import torch
import torch.nn.functional as F
import pickle
import numpy as np

# Load vocab and model (EXACTLY your architecture)
with open("vocab.pkl", "rb") as f:
    vocab = pickle.load(f)

token_to_id = vocab["token_to_id"]
id_to_token = vocab["id_to_token"]

# ADD [MASK] if missing (exactly like training)
if "[MASK]" not in token_to_id:
    mask_id = len(token_to_id)
    token_to_id["[MASK]"] = mask_id
    id_to_token[mask_id] = "[MASK]"
else:
    mask_id = token_to_id["[MASK]"]

vocab_size = len(token_to_id)

print(f"Vocab size: {vocab_size}, Mask ID: {mask_id}")

class OpcodeMLM(torch.nn.Module):
    def __init__(self, vocab_size, embed_dim=128, num_heads=8, hidden_dim=256, num_layers=4, dropout=0.2):
        super(OpcodeMLM, self).__init__()
        self.embedding = torch.nn.Embedding(vocab_size, embed_dim)
        self.pos_embedding = torch.nn.Embedding(512, embed_dim)
        encoder_layer = torch.nn.TransformerEncoderLayer(
            d_model=embed_dim, nhead=num_heads, dim_feedforward=hidden_dim, 
            dropout=dropout, batch_first=True
        )
        self.transformer = torch.nn.TransformerEncoder(encoder_layer, num_layers)
        self.fc = torch.nn.Linear(embed_dim, vocab_size)

    def forward(self, x):
        positions = torch.arange(0, x.size(1), device=x.device).unsqueeze(0)
        x = self.embedding(x) + self.pos_embedding(positions)
        out = self.transformer(x)
        return self.fc(out)

model = OpcodeMLM(vocab_size)
model.load_state_dict(torch.load("opcode_mlm_best.pth", map_location='cpu'))
model.eval()

print("✅ Transformer MLM loaded! Testing masked prediction...")

# Test 1: Fill missing instructions
test_cases = [
    ["push %ebp", "mov %esp,%ebp", "[MASK]", "[MASK]"],  # After prologue
    ["push %ebx", "sub $0x20,%esp", "[MASK]", "mov %eax,(%esp)"],  # Stack setup
]

print("\n=== MASKED INSTRUCTION PREDICTION ===")
for i, seq in enumerate(test_cases):
    print(f"\nInput: {' '.join(seq)}")
    
    # Replace [MASK] with mask_id for model
    input_ids = torch.tensor([[token_to_id.get(t, token_to_id["[MASK]"]) for t in seq]])
    
    with torch.no_grad():
        logits = model(input_ids)[0]
        mask_positions = [j for j, t in enumerate(seq) if t == "[MASK]"]
        
        for pos in mask_positions:
            masked_logits = logits[pos]
            top3 = torch.topk(F.softmax(masked_logits, dim=-1), 3)
            print(f"  Position {pos}:")
            for j in range(3):
                token = id_to_token[top3.indices[j].item()]
                prob = top3.values[j].item()
                print(f"    {token:<25} {prob:.1%}")
