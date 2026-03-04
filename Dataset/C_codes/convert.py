import subprocess
import sys
import os
import glob

def process_c_file(c_file, disasm_folder):
    base = os.path.splitext(os.path.basename(c_file))[0]
    asm_file = f"{base}.s"
    obj_file = f"{base}.o"
    disasm_file = os.path.join(disasm_folder, f"{base}_opcodes.txt")

    # Step 1: Compile C to assembly
    subprocess.run(["gcc", "-S", c_file, "-o", asm_file], check=True)
    print(f"Assembly code saved to {asm_file}")

    # Step 2: Compile to object file
    subprocess.run(["gcc", "-c", c_file, "-o", obj_file], check=True)

    # Step 3: Disassemble object file
    with open(disasm_file, "w") as f:
        subprocess.run(["objdump", "-d", obj_file], stdout=f, check=True)
    print(f"Disassembly saved to {disasm_file}")


def process_folder(folder_path):
    # Create a folder for disassembly outputs
    disasm_folder = os.path.join(folder_path, "disassembly_outputs")
    os.makedirs(disasm_folder, exist_ok=True)

    c_files = glob.glob(os.path.join(folder_path, "*.c"))
    if not c_files:
        print("No C files found in the folder.")
        return

    for c_file in c_files:
        print(f"\nProcessing {c_file}...")
        try:
            process_c_file(c_file, disasm_folder)
        except subprocess.CalledProcessError as e:
            print(f"Error processing {c_file}: {e}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python convert_folder.py <folder_path>")
        sys.exit(1)

    folder_path = sys.argv[1]
    process_folder(folder_path)