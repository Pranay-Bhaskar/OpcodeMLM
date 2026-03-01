import pickle

# Load merged opcodes file
with open("all_opcodes.txt", "r") as f:
    lines = f.read().splitlines()

# Build vocab
unique_tokens = sorted(set(lines))
token_to_id = {tok: i for i, tok in enumerate(unique_tokens)}
id_to_token = {i: tok for tok, i in token_to_id.items()}

# Save vocab
vocab = {"token_to_id": token_to_id, "id_to_token": id_to_token}
with open("vocab.pkl", "wb") as f:
    pickle.dump(vocab, f)

print("Total tokens:", len(lines))
print("Vocabulary size:", len(token_to_id))