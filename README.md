# ⚙️ MIPS Architecture Projects

This repository contains a collection of Assembly MIPS programs developed during my first year of Computer Engineering at the University of Bergamo (UniBG). 

The goal of these projects is to demonstrate a solid understanding of low-level computer architecture, CPU register management, memory allocation, and hardware-software interaction.

---

## 🛠️ Tools & Environment

* **Architecture:** MIPS32
* **Simulator:** MARS (MIPS Assembler and Runtime Simulator)
* **Instruction Set:** Core MIPS assembly instructions (data transfer, arithmetic, logical, and conditional branching)

---

## 📂 Project Directory

Here is a breakdown of the programs included in this repository:

### 1. Basic Operations & Input/Output
* **Description:** Simple programs focusing on reading integers/strings from the console, performing basic arithmetic operations, and printing results back to the user.
* **Key Concepts:** System calls (`syscall`), register allocation (`$t0`, `$v0`, `$a0`).

### 2. Control Structures & Loops
* **Description:** Implementation of conditional structures (`if-else`) and loops (`for`, `while`) to manipulate data arrays or perform repetitive calculations.
* **Key Concepts:** Conditional branching (`beq`, `bne`), unconditional jumps (`j`), array indexing.

### 3. Functions & Stack Management (Optional - if you did them)
* **Description:** Modular programs using subroutines and functions, demonstrating how the stack is used to save and restore register states.
* **Key Concepts:** Jump and link (`jal`), jump register (`jr`), stack pointer (`$sp`).

---

## 🚀 How to Run the Programs

To run these assembly files on your computer:
1. Download and install the [MARS Simulator](https://courses.missouristate.edu/kenvollmar/mars/).
2. Open MARS and load any `.asm` or `.s` file from this repository.
3. Click on **Assemble** (the wrench and screwdriver icon).
4. Click on **Run** (the green play button) to execute the code and interact with the console.
