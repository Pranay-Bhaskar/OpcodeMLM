import torch
import torch.nn as nn
import torch.optim as optim
import pickle
import random
from torch.utils.data import Dataset, DataLoader
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

        # dynamic masking each epoch
        for i in range(len(x)):
            if random.random() < self.mask_prob:
                x[i] = self.mask_id

        return torch.tensor(x), torch.tensor(y)

dataset = MaskedOpcodeDataset("all_opcodes.txt", token_to_id, seq_len=32)
loader = DataLoader(dataset, batch_size=64, shuffle=True)

# -----------------------------
# Step 4: Training loop with scheduler
# -----------------------------
criterion = nn.CrossEntropyLoss()
optimizer = optim.AdamW(model.parameters(), lr=0.001)

# Warmup + decay scheduler
def lr_lambda(step):
    warmup_steps = 1000
    if step < warmup_steps:
        return step / warmup_steps
    return 0.95 ** ((step - warmup_steps) // 1000)

scheduler = LambdaLR(optimizer, lr_lambda)

epochs = 50
for epoch in range(epochs):
    total_loss = 0
    for inputs, targets in loader:
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs.reshape(-1, vocab_size), targets.reshape(-1))
        loss.backward()
        nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
        optimizer.step()
        scheduler.step()
        total_loss += loss.item()
    avg_loss = total_loss / len(loader)
    print(f"Epoch {epoch+1}/{epochs}, Loss: {avg_loss:.4f}")

# -----------------------------
# Step 5: Save model
# -----------------------------
torch.save(model.state_dict(), "opcode_mlm_best.pth")
print("Model saved as opcode_mlm_best.pth")