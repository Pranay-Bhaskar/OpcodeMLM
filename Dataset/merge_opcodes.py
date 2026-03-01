import os

input_folder = r"C:\Users\prana\binary_mlm_dataset\programs"
output_file = os.path.join(input_folder, "all_opcodes.txt")

with open(output_file, "w") as outfile:
    for filename in os.listdir(input_folder):
        if filename.endswith("_clean.txt"):
            with open(os.path.join(input_folder, filename), "r") as infile:
                outfile.write(infile.read() + "\n")

print("✅ Merged into all_opcodes.txt")