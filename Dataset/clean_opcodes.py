import os

input_folder = r"C:\Users\prana\binary_mlm_dataset\programs"

for filename in os.listdir(input_folder):
    if filename.endswith("_opcodes.txt"):
        input_path = os.path.join(input_folder, filename)
        output_path = os.path.join(input_folder, filename.replace("_opcodes.txt", "_clean.txt"))

        with open(input_path, "r") as infile, open(output_path, "w") as outfile:
            for line in infile:
                line = line.strip()
                if not line:
                    continue
                # Skip headers and labels
                if line.startswith("Disassembly") or line.endswith(":") or ("<" in line and ">" in line):
                    continue

                # Split into columns by whitespace
                parts = line.split()
                if len(parts) >= 3:
                    # Instruction starts after address and hex bytes
                    # Find first token that is not hex (letters or %)
                    for i, token in enumerate(parts):
                        if not all(c in "0123456789abcdefABCDEF" for c in token.replace(":", "")):
                            outfile.write(" ".join(parts[i:]) + "\n")
                            break

print("✅ Cleaned files saved with '_clean.txt' suffix.")