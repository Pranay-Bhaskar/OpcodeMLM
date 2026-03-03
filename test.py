import torch
import torch.nn as nn
import pickle
from torch.utils.data import Dataset, DataLoader
from sklearn.metrics import classification_report

# -----------------------------
# Step 1: Load vocab
# -----------------------------
with open("vocab.pkl", "rb") as f:
    vocab = pickle.load(f)

token_to_id = vocab["token_to_id"]
id_to_token = vocab["id_to_token"]

# Add [MASK] token if missing (must match training)
if "[MASK]" not in token_to_id:
    mask_id = len(token_to_id)
    token_to_id["[MASK]"] = mask_id
    id_to_token[mask_id] = "[MASK]"

vocab_size = len(token_to_id)
print("Loaded vocab size:", vocab_size)


# -----------------------------
# Step 2: Define model (same as training)
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

# -----------------------------
# Step 3: Load best checkpoint
# -----------------------------
model = OpcodeMLM(vocab_size=vocab_size)
model.load_state_dict(torch.load("opcode_mlm_best.pth"))
model.eval()

print("Loaded best model checkpoint.")

# -----------------------------
# Step 4: Prepare test dataset from all_Test_opcodes.txt
# -----------------------------
class OpcodeDataset(Dataset):
    def __init__(self, file_path, token_to_id):
        self.sequences = []
        with open(file_path, "r") as f:
            content = f.read().strip()
            # Split programs by blank lines (double newline)
            programs = content.split("\n\n")
            for prog in programs:
                tokens = [line.strip() for line in prog.split("\n") if line.strip() != ""]
                ids = [token_to_id[t] for t in tokens if t in token_to_id]
                if len(ids) > 1:
                    self.sequences.append(ids)

    def __len__(self):
        return len(self.sequences)

    def __getitem__(self, idx):
        seq = torch.tensor(self.sequences[idx], dtype=torch.long)
        return seq[:-1], seq[1:]  # input, target

test_dataset = OpcodeDataset("all_Test_opcodes.txt", token_to_id)
test_loader = DataLoader(test_dataset, batch_size=1, shuffle=False)

print("Loaded test dataset with", len(test_dataset), "programs.")

# -----------------------------
# Step 5: Evaluate on test set
# -----------------------------
all_preds = []
all_labels = []

with torch.no_grad():
    for inputs, labels in test_loader:
        outputs = model(inputs)  # [batch, seq_len, vocab_size]
        _, predicted = torch.max(outputs, dim=-1)  # [batch, seq_len]

        all_preds.extend(predicted.view(-1).cpu().numpy())
        all_labels.extend(labels.view(-1).cpu().numpy())

# -----------------------------
# Step 6: Print results
# -----------------------------
from sklearn.metrics import classification_report

print("Classification Report:")
print(classification_report(all_labels, all_preds))