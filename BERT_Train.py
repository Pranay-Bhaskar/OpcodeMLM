import os
import torch
import torch.nn as nn
import torch.optim as optim
import pickle
import random
import numpy as np
from torch.utils.data import Dataset, DataLoader, random_split
from torch.optim.lr_scheduler import LambdaLR

# -----------------------------
# Step 1: Load vocab and add [MASK]
# -----------------------------
with open("vocab.pkl", "rb") as f:
    vocab = pickle.load(f)

token_to_id = vocab["token_to_id"]
id_to_token = vocab["id_to_token"]

if "[MASK]" not in token_to_id:
    mask_id = len(token_to_id)
    token_to_id["[MASK]"] = mask_id
    id_to_token[mask_id] = "[MASK]"
else:
    mask_id = token_to_id["[MASK]"]

vocab_size = len(token_to_id)
print("Training with vocab size:", vocab_size)

# -----------------------------
# Step 2: Define Transformer MLM model
# -----------------------------
class OpcodeMLM(nn.Module):
    def __init__(self, vocab_size, embed_dim=128, num_heads=8, hidden_dim=256, num_layers=4, dropout=0.2):
        super(OpcodeMLM, self).__init__()
        self.embedding = nn.Embedding(vocab_size, embed_dim)
        self.pos_embedding = nn.Embedding(512, embed_dim)  # learned positional embeddings

        encoder_layer = nn.TransformerEncoderLayer(
            d_model=embed_dim,
            nhead=num_heads,
            dim_feedforward=hidden_dim,
            dropout=dropout,
            batch_first=True
        )
        self.transformer = nn.TransformerEncoder(encoder_layer, num_layers=num_layers)
        self.fc = nn.Linear(embed_dim, vocab_size)

    def forward(self, x):
        positions = torch.arange(0, x.size(1), device=x.device).unsqueeze(0)
        x = self.embedding(x) + self.pos_embedding(positions)
        out = self.transformer(x)
        return self.fc(out)

model = OpcodeMLM(vocab_size)

# -----------------------------
# Step 3: Dataset with BERT-style masking
# -----------------------------
class MaskedOpcodeDataset(Dataset):
    def __init__(self, filepath, token_to_id, seq_len=32, mask_prob=0.15):
        with open(filepath, "r") as f:
            lines = f.read().splitlines()
        self.data = []
        for line in lines:
            for tok in line.split():  # tokenize line into multiple tokens
                if tok in token_to_id:
                    self.data.append(token_to_id[tok])

        self.seq_len = seq_len
        self.mask_prob = mask_prob
        self.mask_id = token_to_id["[MASK]"]
        self.vocab_size = len(token_to_id)

    def __len__(self):
        return len(self.data) - self.seq_len

    def __getitem__(self, idx):
        x = self.data[idx:idx+self.seq_len]
        y = x.copy()
        mask = np.zeros(len(x), dtype=np.int64)

        for i in range(len(x)):
            if random.random() < self.mask_prob:
                mask[i] = 1
                prob = random.random()
                if prob < 0.8:
                    x[i] = self.mask_id
                elif prob < 0.9:
                    x[i] = random.randint(0, self.vocab_size - 1)
                else:
                    pass  # keep original

        return torch.tensor(x), torch.tensor(y), torch.tensor(mask)

dataset = MaskedOpcodeDataset("all_opcodes.txt", token_to_id, seq_len=32)

# Train/validation split
train_size = int(0.9 * len(dataset))
val_size = len(dataset) - train_size
train_dataset, val_dataset = random_split(dataset, [train_size, val_size])

train_loader = DataLoader(train_dataset, batch_size=64, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=64)

# -----------------------------
# Step 4: Training loop with accuracy + early stopping
# -----------------------------
criterion = nn.CrossEntropyLoss()
optimizer = optim.AdamW(model.parameters(), lr=0.0005)

def lr_lambda(step):
    warmup_steps = 1000
    if step < warmup_steps:
        return step / warmup_steps
    return 0.95 ** ((step - warmup_steps) // 1000)

scheduler = LambdaLR(optimizer, lr_lambda)

epochs = 50
best_val_loss = np.inf
patience = 5
counter = 0

for epoch in range(epochs):
    # ---- Training ----
    model.train()
    total_loss, total_correct, total_masked = 0, 0, 0
    for inputs, targets, mask in train_loader:
        optimizer.zero_grad()
        outputs = model(inputs)

        masked_outputs = outputs[mask == 1]
        masked_targets = targets[mask == 1]

        if masked_outputs.numel() > 0:
            loss = criterion(masked_outputs, masked_targets)
            loss.backward()
            nn.utils.clip_grad_norm_(model.parameters(), max_norm=0.5)
            optimizer.step()
            scheduler.step()
            total_loss += loss.item()

            preds = masked_outputs.argmax(dim=-1)
            total_correct += (preds == masked_targets).sum().item()
            total_masked += masked_targets.numel()

    avg_train_loss = total_loss / len(train_loader)
    train_acc = total_correct / total_masked if total_masked > 0 else 0.0

    # ---- Validation ----
    model.eval()
    val_loss, val_correct, val_masked = 0, 0, 0
    with torch.no_grad():
        for inputs, targets, mask in val_loader:
            outputs = model(inputs)
            masked_outputs = outputs[mask == 1]
            masked_targets = targets[mask == 1]

            if masked_outputs.numel() > 0:
                loss = criterion(masked_outputs, masked_targets)
                val_loss += loss.item()

                preds = masked_outputs.argmax(dim=-1)
                val_correct += (preds == masked_targets).sum().item()
                val_masked += masked_targets.numel()

    avg_val_loss = val_loss / len(val_loader)
    val_acc = val_correct / val_masked if val_masked > 0 else 0.0

    current_lr = scheduler.get_last_lr()[0]
    print(f"Epoch {epoch+1}/{epochs}, LR: {current_lr:.6f}, "
          f"Train Loss: {avg_train_loss:.4f}, Train Acc: {train_acc:.4f}, "
          f"Val Loss: {avg_val_loss:.4f}, Val Acc: {val_acc:.4f}")

    # ---- Early Stopping ----
    if avg_val_loss < best_val_loss:
        best_val_loss = avg_val_loss
        counter = 0
        torch.save(model.state_dict(), "opcode_mlm_best.pth")
        print("Model improved and saved.")
    else:
        counter += 1
        if counter >= patience:
            print(f"Early stopping triggered at epoch {epoch+1}. Best Val Loss: {best_val_loss:.4f}")
            break
else:
    print(f"Training completed all {epochs} epochs. Best Val Loss: {best_val_loss:.4f}")