<div align="center">

<pre>
  ____                     _       __  __ _      __  __
 / __ \                   | |     |  \/  | |    |  \/  |
| |  | |_ __   ___ ___  __| | ___ | \  / | |    | \  / |
| |  | | '_ \ / __/ _ \/ _` |/ _ \| |\/| | |    | |\/| |
| |__| | |_) | (_| (_) | (_| |  __/ |  | | |____| |  | |
 \____/| .__/ \___\___/ \__,_|\___|_|  |_|______|_|  |_|
       | |
       |_|
</pre>

[![HuggingFace Space](https://img.shields.io/badge/HuggingFace-Demo-yellow.svg)](https://huggingface.co/spaces/pb-b/opcode_model)
[![Python versions](https://img.shields.io/badge/Python-3.10%2B-blue.svg)](https://www.python.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub Repository](https://img.shields.io/badge/GitHub-Repository-gray?logo=github)](https://github.com/Pranay-Bhaskar/opcode_mlm)

**OpcodeMLM** is a masked language model trained on structured assembly instructions to predict missing tokens in opcode sequences.

It is designed for low-level sequence learning tasks such as reverse engineering experiments, malware analysis, and compiler-behavior exploration.



</div>

## Features

- **Masked Token Prediction:** Predicts missing assembly tokens from surrounding context.
- **Assembly Sequence Learning:** Learns instruction flow from structured AT&T-style x86 assembly.
- **Research-Friendly:** Useful for reverse engineering, malware analysis, and compiler studies.
- **Hugging Face Compatible:** Easy to load with Transformers for inference and experimentation.

## Installation

```bash
pip install torch transformers
```

## Quick Start

You can test the model with Hugging Face Transformers or your local inference script.

```python
from transformers import pipeline

fill_mask = pipeline("fill-mask", model="pb-b/opcode_model")

context = "push %ebp mov %esp,%ebp and $0xfffffff0,%esp sub $0x50,%esp movl $0x50,0x30(%esp) [MASK]"
result = fill_mask(context)

for pred in result:
    print(pred["sequence"])
```

## Model Access

Live demo:

[Hugging Face Space: pb-b/opcode_model](https://huggingface.co/spaces/pb-b/opcode_model)

## Contributing

Contributions, issues, and feature requests for preprocessing, dataset expansion, and model improvements are welcome.

## License

This project is licensed under the MIT License © 2026 Pranay Bhaskar.
