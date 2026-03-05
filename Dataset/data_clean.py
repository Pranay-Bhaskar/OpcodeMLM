#!/usr/bin/env python3
"""
Heavy-duty assembly extractor for 57K+ line files
Memory efficient - processes line-by-line, no loading everything
Perfect for your exact all_opcodes.txt format
"""

import re
from pathlib import Path

def is_assembly_instruction(line):
    """Detect pure x86 assembly instructions"""
    line = line.strip()
    
    # Skip obvious non-assembly
    if any(pattern in line for pattern in [
        '###', 'file format', '.o:', '.exe:', 'pei-i386', 'pe-i386'
    ]):
        return False
    
    # Skip empty lines
    if not line:
        return False
    
    # Assembly instructions: short, contain % registers, no standalone ':'
    if (len(line) < 60 and 
        '%' in line and 
        not line.endswith(':') and
        ':' not in line.split()[0]):  # No labels
        return True
    
    return False

def clean_assembly_dataset(input_path="all_opcodes.txt", output_path="clean_assembly.txt"):
    """Process massive assembly files efficiently"""
    input_path = Path(input_path)
    output_path = Path(output_path)
    
    print(f"🔍 Processing {input_path} ({input_path.stat().st_size/1e6:.1f} MB)...")
    
    assembly_lines = []
    total_lines = 0
    assembly_count = 0
    
    # Line-by-line processing (memory efficient for 57K+ lines)
    with open(input_path, 'r', encoding='utf-8', errors='ignore') as infile:
        for line_num, line in enumerate(infile, 1):
            total_lines += 1
            
            if is_assembly_instruction(line):
                assembly_lines.append(line.strip())
                assembly_count += 1
                
                # Progress indicator
                if assembly_count % 5000 == 0:
                    print(f"   Progress: {assembly_count:,} assembly lines extracted...")
    
    print(f"\n📊 RESULTS:")
    print(f"   Total lines processed: {total_lines:,}")
    print(f"   Pure assembly instructions: {assembly_count:,}")
    print(f"   Filter ratio: {assembly_count/total_lines*100:.1f}%")
    
    # Show samples
    print(f"\n📋 First 15 clean assembly instructions:")
    for i, instr in enumerate(assembly_lines[:15]):
        print(f"   {i+1:2d}. {instr}")
    
    # Write clean dataset
    with open(output_path, 'w', encoding='utf-8') as outfile:
        outfile.write('\n'.join(assembly_lines))
    
    print(f"\n💾 SAVED: {output_path} ({len(assembly_lines):,} lines)")
    print(f"✅ Data cleaning COMPLETE!")
    
    return len(assembly_lines)

if __name__ == "__main__":
    # Run in your Dataset directory
    clean_assembly_dataset()
