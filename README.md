# Assembly JUMP Instructions
This repository contains a simple NASM assembly program written in Intel syntax to demonstrate various jump instructions. The program compares two numbers and prints a message indicating whether they are equal, or which one is greater, using Linux system calls. 

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup and Installation](#setup-and-installation)
  - [Linux](#linux)
  - [Windows](#windows)
- [Usage](#usage)

## Overview
The `jump64.asm` program:
- Compares two numbers (`num1` and `num2`) defined in the `.data` section.
- Uses jump instructions:
  - `jmp`: Unconditional jump.
  - `je`: Jump if equal.
  - `jg`: Jump if greater.
  - `jl`: Jump if less.
- Outputs a message to the console based on the comparison result.
- Designed for 64-bit systems using Intel syntax and NASM.

## Prerequisites
### Linux
- **NASM** (Netwide Assembler): Install via your package manager.
- **GNU Linker (ld)**: Usually included with Linux distributions.
- A 64-bit Linux distribution.

### Windows
- **NASM**: Download from [nasm.us](https://www.nasm.us/) and add to your system PATH.
- **MinGW** (for `ld` linker): Install via [MinGW](http://www.mingw.org/) or use a subsystem like WSL (Windows Subsystem for Linux) for native Linux compatibility.
- **Git Bash** or a similar terminal for running commands.
- Alternatively, use WSL2 with a Linux distribution to follow Linux instructions.

## Setup and Installation

### Linux
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/HasinduRanasinghe/assembly-jump-instructions.git
   cd assembly-jump-instructions
   ```
2. **Compile the Code**:
   ```bash
   nasm -f elf64 jump64.asm
   ld jump64.o -o jump64
   ```
3. **Run the Program**:
   ```bash
   ./jump64
   ```
### Windows
The provided code uses Linux syscalls, so it’s recommended to use WSL2 for simplicity.

# Usage
- The program compares num1 and num2 (default: both 42).
- Outputs one of:
  - Numbers are equal! (if num1 == num2)
  - First number is greater! (if num1 > num2)
  - First number is less! (if num1 < num2)
- To test different outputs, modify num1 and num2 in jump64.asm.
