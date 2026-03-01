import torch
import torch.nn as nn
import torch.optim as optim
import pickle
from torch.utils.data import Dataset, DataLoader

# -----------------------------
# Step 1: Load vocab
# -----------------------------
with open("vocab.pkl", "rb") as f:
    vocab = pickle.load(f)

token_to_id = vocab["token_to_id"]
id_to_token = vocab["id_to_token"]
vocab_size = len(token_to_id)

print("Training with vocab size:", vocab_size)

# -----------------------------
# Step 2: Define model
# -----------------------------
class BinaryMLM(nn.Module):
    def __init__(self, vocab_size, embed_dim=64, hidden_dim=128):
        super(BinaryMLM, self).__init__()
        self.embedding = nn.Embedding(vocab_size, embed_dim)
        self.lstm = nn.LSTM(embed_dim, hidden_dim, batch_first=True)
        self.fc = nn.Linear(hidden_dim, vocab_size)

    def forward(self, x):
        x = self.embedding(x)
        out, _ = self.lstm(x)
        out = self.fc(out)
        return out

model = BinaryMLM(vocab_size, embed_dim=64, hidden_dim=128)

# -----------------------------
# Step 3: Dataset class
# -----------------------------
class OpcodeDataset(Dataset):
    def __init__(self, filepath, token_to_id, seq_len=20):
        with open(filepath, "r") as f:
            lines = f.read().splitlines()
        self.data = [token_to_id[line] for line in lines if line in token_to_id]
        self.seq_len = seq_len

    def __len__(self):
        return len(self.data) - self.seq_len

    def __getitem__(self, idx):
        x = self.data[idx:idx+self.seq_len]
        y = self.data[idx+1:idx+self.seq_len+1]
        return torch.tensor(x), torch.tensor(y)

dataset = OpcodeDataset("all_opcodes.txt", token_to_id, seq_len=20)
loader = DataLoader(dataset, batch_size=32, shuffle=True)

# -----------------------------
# Step 4: Training loop
# -----------------------------
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

epochs = 20
for epoch in range(epochs):
    total_loss = 0
    for inputs, targets in loader:
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs.view(-1, vocab_size), targets.view(-1))
        loss.backward()
        optimizer.step()
        total_loss += loss.item()
    avg_loss = total_loss / len(loader)
    print(f"Epoch {epoch+1}/{epochs}, Loss: {avg_loss:.4f}")

# -----------------------------
# Step 5: Save model
# -----------------------------
torch.save(model.state_dict(), "binary_mlm.pth")
print("Model saved as binary_mlm.pth")