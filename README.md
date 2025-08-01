# Assembly JUMP Instructions
This repository contains a simple NASM assembly program written in Intel syntax to demonstrate various jump instructions. The program compares two numbers and prints a message indicating whether they are equal or which one is greater, using Linux system calls. 

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup and Installation](#setup-and-installation)
  - [Linux](#linux)
  - [Windows](#windows)
- [Usage](#usage)
- [Additional Notes](#additional-notes)
- [Differences Between 64-bit and 32-bit Versions](#differences-between-64-bit-and-32-bit-versions)

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

## Usage
- The program compares num1 and num2 (default: both 42).
- Outputs one of:
  - Numbers are equal! (if num1 == num2)
  - First number is greater! (if num1 > num2)
  - First number is less! (if num1 < num2)
- To test different outputs, modify num1 and num2 in jump64.asm.

## Additional Notes
This repository includes both a 64-bit version (`jump64.asm`) and a 32-bit version (`jump32.asm`) of the assembly program. The 32-bit version is designed for 32-bit Linux systems or 64-bit Linux with 32-bit support. You can compile and run `jump32.asm` using the relevant instructions, making it easy to explore jump instructions in both 32-bit and 64-bit environments.

## Differences Between 64-bit and 32-bit Versions
The 64-bit (`jump64.asm`) and 32-bit (`jump32.asm`) versions perform the same task, comparing two numbers and printing a message based on jump instructions, but differ in their architecture and system call mechanisms.
- **Architecture**:
  - **64-bit**: Uses 64-bit registers (`rax`, `rbx`, `rsi`, `rdi`) and the `elf64` object format, designed for x86_64 Linux systems.
  - **32-bit**: Uses 32-bit registers (`eax`, `ebx`, `ecx`, `edx`) and the `elf32` object format, compatible with x86 Linux systems.
- **System Calls**:
  - **64-bit**: Uses the `syscall` instruction with 64-bit syscall numbers (1 for `write`, 60 for `exit`) and passes arguments in registers `rdi`, `rsi`, `rdx`, per the x86_64 System V ABI.
  - **32-bit**: Uses the `int 0x80` interrupt with 32-bit syscall numbers (4 for `write`, 1 for `exit`) and passes arguments in registers `ebx`, `ecx`, `edx`.
- **Data Types**:
  - **64-bit**: Defines numbers with `dq` (quadword, 64 bits) for 64-bit integers.
  - **32-bit**: Defines numbers with `dd` (doubleword, 32 bits) for 32-bit integers.
- **Linking**:
  - **64-bit**: Links with default 64-bit settings (`ld`).
  - **32-bit**: Requires 32-bit linking with `-m elf_i386` to ensure compatibility.
