import torch
import torch.nn as nn
import torch.optim as optim
import pickle
from torch.utils.data import random_split, Dataset, DataLoader
import matplotlib.pyplot as plt

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
# Step 2: Model
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
# Step 3: Dataset + 80/20 Split
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

full_dataset = OpcodeDataset("all_opcodes.txt", token_to_id, seq_len=20)
train_size = int(0.8 * len(full_dataset))
val_size = len(full_dataset) - train_size
train_dataset, val_dataset = random_split(full_dataset, [train_size, val_size])

train_loader = DataLoader(train_dataset, batch_size=32, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=32, shuffle=False)

print(f"Train: {len(train_dataset)}, Val: {len(val_dataset)}")

# -----------------------------
# Step 4: Optimizer + Scheduler + Criterion
# -----------------------------
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.0005)  # Lower LR
scheduler = optim.lr_scheduler.ReduceLROnPlateau(
    optimizer, mode='min', factor=0.5, patience=5
)

# -----------------------------
# Step 5: PERFECTED TRAINING LOOP (50 epochs, patience=5)
# -----------------------------
epochs = 50
train_losses, val_losses, val_accuracies = [], [], []
best_val_loss = float('inf')
patience_counter = 0

for epoch in range(epochs):
    # === TRAINING ===
    model.train()
    total_train_loss = 0
    for inputs, targets in train_loader:
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs.view(-1, vocab_size), targets.view(-1))
        loss.backward()
        
        # Gradient clipping
        torch.nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
        
        optimizer.step()
        total_train_loss += loss.item()
    
    avg_train_loss = total_train_loss / len(train_loader)
    train_losses.append(avg_train_loss)
    
    # === VALIDATION WITH ACCURACY ===
    model.eval()
    total_val_loss = 0
    correct_predictions = 0
    total_predictions = 0
    
    with torch.no_grad():
        for inputs, targets in val_loader:
            outputs = model(inputs)
            loss = criterion(outputs.view(-1, vocab_size), targets.view(-1))
            total_val_loss += loss.item()
            
            # Accuracy calculation
            predictions = outputs.argmax(dim=-1).view(-1)
            targets_flat = targets.view(-1)
            correct_predictions += (predictions == targets_flat).sum().item()
            total_predictions += targets_flat.numel()
    
    val_accuracy = 100 * correct_predictions / total_predictions
    avg_val_loss = total_val_loss / len(val_loader)
    val_losses.append(avg_val_loss)
    val_accuracies.append(val_accuracy)
    
    # === SCHEDULER + PRINT + EARLY STOPPING ===
    scheduler.step(avg_val_loss)
    print(f"Epoch {epoch+1:2d}/50 | Train: {avg_train_loss:.4f} | Val: {avg_val_loss:.4f} | Acc: {val_accuracy:.2f}% | LR: {optimizer.param_groups[0]['lr']:.6f}")
    
    if avg_val_loss < best_val_loss - 0.001:
        best_val_loss = avg_val_loss
        patience_counter = 0
        torch.save({
            'model_state_dict': model.state_dict(),
            'optimizer_state_dict': optimizer.state_dict(),
            'epoch': epoch,
            'val_loss': avg_val_loss
        }, "best_model.pth")
        print(f"  → NEW BEST: {best_val_loss:.4f}")
    else:
        patience_counter += 1
        print(f"  → Patience: {patience_counter}/5")
        if patience_counter >= 5:
            print(f"Early stopping at epoch {epoch+1}. Best val_loss: {best_val_loss:.4f}")
            break

# -----------------------------
# Step 6: Load Best Model + Plot + Final Save
# -----------------------------
checkpoint = torch.load("best_model.pth")
model.load_state_dict(checkpoint['model_state_dict'])
torch.save(model.state_dict(), "binary_mlm_perfect.pth")
print("Perfect model saved as binary_mlm_perfect.pth")

# Enhanced plotting
plt.figure(figsize=(15, 5))

plt.subplot(1, 3, 1)
plt.plot(train_losses, label='Train Loss')
plt.plot(val_losses, label='Val Loss')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.legend()
plt.title('Loss Curves')
plt.grid(True)

plt.subplot(1, 3, 2)
plt.plot(val_accuracies, label='Val Accuracy')
plt.xlabel('Epoch')
plt.ylabel('Accuracy %')
plt.title('Validation Accuracy')
plt.grid(True)

plt.subplot(1, 3, 3)
lrs = [0.0005 * (0.5 ** (i//6)) for i in range(len(val_losses))]
plt.plot(lrs[:len(val_losses)], label='Learning Rate')
plt.xlabel('Epoch')
plt.ylabel('LR')
plt.title('Learning Rate Schedule')
plt.grid(True)

plt.tight_layout()
plt.savefig('perfect_training.png', dpi=300, bbox_inches='tight')
plt.show()

print("🎉 TRAINING COMPLETE - Model perfected!")
print(f"Final Val Loss: {best_val_loss:.4f}")
print(f"Peak Val Accuracy: {max(val_accuracies):.2f}%")
