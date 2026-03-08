import torch
import torch.nn as nn
import torch.optim as optim
import pickle
from torch.utils.data import Dataset, DataLoader

# Load vocab
with open("vocab.pkl", "rb") as f:
    vocab = pickle.load(f)
token_to_id = vocab["token_to_id"]
id_to_token = vocab["id_to_token"]
vocab_size = len(token_to_id)
print("Training with vocab size:", vocab_size)

class BinaryMLM(nn.Module):
    def __init__(self, vocab_size, embed_dim=64, hidden_dim=128):
        super().__init__()
        self.embedding = nn.Embedding(vocab_size, embed_dim)
        self.lstm = nn.LSTM(embed_dim, hidden_dim, batch_first=True)
        self.fc = nn.Linear(hidden_dim, vocab_size)

    def forward(self, x):
        x = self.embedding(x)
        out, _ = self.lstm(x)
        return self.fc(out[:, -1])  # Shape: (batch_size, vocab_size)

class NextTokenDataset(Dataset):
    def __init__(self, filepath, token_to_id, seq_len=20):
        with open(filepath, "r") as f:
            lines = f.read().splitlines()
        self.data = [token_to_id[line.strip()] for line in lines if line.strip() in token_to_id]
        self.seq_len = seq_len

    def __len__(self):
        return len(self.data) - self.seq_len

    def __getitem__(self, idx):
        x = self.data[idx:idx+self.seq_len]
        y = self.data[idx+1:idx+self.seq_len+1]
        # FIX: Ensure proper shapes
        x = torch.tensor(x, dtype=torch.long)
        y = torch.tensor(y, dtype=torch.long).squeeze()  # 1D tensor (seq_len,)
        return x, y

# Data loading
dataset = NextTokenDataset("all_opcodes.txt", token_to_id)
loader = DataLoader(dataset, batch_size=32, shuffle=True)

model = BinaryMLM(vocab_size)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

# Training loop
for epoch in range(15):
    total_loss = 0
    for batch_idx, (inputs, targets) in enumerate(loader):
        optimizer.zero_grad()
        outputs = model(inputs)  # (batch_size, vocab_size)
        loss = criterion(outputs, targets)  # targets is 1D (batch_size*seq_len,)
        loss.backward()
        optimizer.step()
        total_loss += loss.item()
    
    avg_loss = total_loss / len(loader)
    print(f"Epoch {epoch+1}/15, Loss: {avg_loss:.4f}")

torch.save(model.state_dict(), "binary_mlm_new_vocab.pth")
print("✅ Model saved as binary_mlm_new_vocab.pth")
