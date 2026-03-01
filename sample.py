import torch
import torch.nn.functional as F
import pickle

# -----------------------------
# Step 1: Load vocab
# -----------------------------
with open("vocab.pkl", "rb") as f:
    vocab = pickle.load(f)

token_to_id = vocab["token_to_id"]
id_to_token = vocab["id_to_token"]
vocab_size = len(token_to_id)

print("Loaded vocab size:", vocab_size)

# -----------------------------
# Step 2: Define model (same as training)
# -----------------------------
class BinaryMLM(torch.nn.Module):
    def __init__(self, vocab_size, embed_dim=64, hidden_dim=128):
        super(BinaryMLM, self).__init__()
        self.embedding = torch.nn.Embedding(vocab_size, embed_dim)
        self.lstm = torch.nn.LSTM(embed_dim, hidden_dim, batch_first=True)
        self.fc = torch.nn.Linear(hidden_dim, vocab_size)

    def forward(self, x):
        x = self.embedding(x)
        out, _ = self.lstm(x)
        out = self.fc(out)
        return out

model = BinaryMLM(vocab_size, embed_dim=64, hidden_dim=128)
model.load_state_dict(torch.load("binary_mlm.pth"))
model.eval()

# -----------------------------
# Step 3: Generate sequence
# -----------------------------
seed = ["push %ebp", "mov %esp,%ebp"]  # starting tokens
tokens = seed.copy()

for _ in range(20):  # generate 20 more tokens
    input_ids = torch.tensor([[token_to_id[t] for t in tokens if t in token_to_id]], dtype=torch.long)
    with torch.no_grad():
        logits = model(input_ids)[0, -1]  # last step
        probs = F.softmax(logits / 1.0, dim=-1)  # temperature=1.0
        next_id = torch.multinomial(probs, num_samples=1).item()
    tokens.append(id_to_token[next_id])

print("Generated sequence:")
print("\n".join(tokens))