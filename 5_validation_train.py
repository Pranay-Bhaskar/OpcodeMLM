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
# Step 3: Dataset with dynamic masking
# -----------------------------
class MaskedOpcodeDataset(Dataset):
    def __init__(self, filepath, token_to_id, seq_len=32, mask_prob=0.15):
        with open(filepath, "r") as f:
            lines = f.read().splitlines()
        self.data = [token_to_id[line] for line in lines if line in token_to_id]
        self.seq_len = seq_len
        self.mask_prob = mask_prob
        self.mask_id = token_to_id["[MASK]"]

    def __len__(self):
        return len(self.data) - self.seq_len

    def __getitem__(self, idx):
        x = self.data[idx:idx+self.seq_len]
        y = x.copy()
        for i in range(len(x)):
            if random.random() < self.mask_prob:
                x[i] = self.mask_id
        return torch.tensor(x), torch.tensor(y)

dataset = MaskedOpcodeDataset("all_opcodes.txt", token_to_id, seq_len=32)

# Train/validation split
train_size = int(0.9 * len(dataset))
val_size = len(dataset) - train_size
train_dataset, val_dataset = random_split(dataset, [train_size, val_size])

train_loader = DataLoader(train_dataset, batch_size=64, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=64)

# -----------------------------
# Step 4: Training loop with early stopping + safety checks
# -----------------------------
criterion = nn.CrossEntropyLoss()
optimizer = optim.AdamW(model.parameters(), lr=0.0005)  # lowered LR for stability

# Warmup + decay scheduler
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
    total_loss = 0
    for inputs, targets in train_loader:
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs.reshape(-1, vocab_size), targets.reshape(-1))
        loss.backward()

        # Gradient check for NaNs
        for name, param in model.named_parameters():
            if param.grad is not None and torch.isnan(param.grad).any():
                print(f"NaN detected in gradients of {name}")
                exit()

        nn.utils.clip_grad_norm_(model.parameters(), max_norm=0.5)  # tighter clipping
        optimizer.step()
        scheduler.step()
        total_loss += loss.item()

    avg_train_loss = total_loss / len(train_loader)

    # ---- Validation ----
    model.eval()
    val_loss = 0
    with torch.no_grad():
        for inputs, targets in val_loader:
            outputs = model(inputs)
            loss = criterion(outputs.reshape(-1, vocab_size), targets.reshape(-1))
            val_loss += loss.item()
    avg_val_loss = val_loss / len(val_loader)

    # Print LR for debugging
    current_lr = scheduler.get_last_lr()[0]
    print(f"Epoch {epoch+1}/{epochs}, LR: {current_lr:.6f}, Train Loss: {avg_train_loss:.4f}, Val Loss: {avg_val_loss:.4f}")

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