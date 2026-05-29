# ⚙️ MIPS Architecture Projects

This repository contains a collection of Assembly MIPS programs developed during my Computer Engineering studies at the University of Bergamo (UniBG). 

The goal of these projects is to demonstrate a solid understanding of low-level computer architecture, CPU register management, memory allocation, and hardware-software interaction.

---

## 🛠️ Tools & Environment

* **Architecture:** MIPS32 (Reduced Instruction Set Computer - RISC)
* **Simulator:** MARS (MIPS Assembler and Runtime Simulator)
* **Instruction Set:** Core MIPS assembly instructions (data transfer, arithmetic, logical, conditional branching, and bitwise manipulation)

---

## 📂 Project Directory

All MIPS Assembly source files are consolidated inside the `mips-assembly-exercises/` directory to maintain a clean repository root structure.

### 🧮 1. Exception Handling & Fractions (`mips-assembly-exercises/01-exception-handling-fractions`)
* **Description:** Low-level logic system handling mathematical operations with fractional numbers.
* **Key Components:** Implements domain-specific error trapping (e.g., zero denominator) using conditional branching instructions.

### ♟️ 2. Chess Board Simulator (`mips-assembly-exercises/02-chess-board-oop`)
* **Description:** Architectural matrix simulation mapping a classic chess game board layout.
* **Key Components:** Matrix coordinate offset calculation, base-address pointer arithmetic, and vector verification for legal piece movements.

### 📄 3. Advanced I/O & Exception Hierarchy (`mips-assembly-exercises/03-exceptions`)
* **Description:** Core system handling file description streams and simulated hardware exception traps.

### 📐 4. Geometry System (`mips-assembly-exercises/04-EsercitazioneInterfacce`)
* **Description:** Subroutine-driven application calculating multi-dimensional shape transformations and scaling coefficients directly in memory.

### 👥 5. Object Identity & Hashing Contracts (`mips-assembly-exercises/05-collections`)
* **Description:** Low-level implementation of custom logical identity tracking, replicating key matching patterns within contiguous memory structures.

### 🛒 6. Retail Management System (`mips-assembly-exercises/06-retail-connect-system`)
* **Description:** Multi-module inventory simulation balancing system registries, dynamic carts, and atomic warehouse stocking updates.
* **Key Components:** Resource constraint enforcement using bounds check algorithms to prevent transaction overflows.

### 💳 7. Advanced Retail Framework (`mips-assembly-exercises/07-retail-connect-evolved`)
* **Description:** Evolution of the retail subsystem introducing persistent user state registers and programmatic loyalty program logic.
* **Key Components:** Conditional instruction branches handling automated tiered discounts and multi-variable loyalty point calculations.

### ✈️ 8. Airline Flight Management (`mips-assembly-exercises/08-flight-management-system`)
* **Description:** Structural program managing multi-class real-time seat registers, automated manifests, and total financial aggregation loops.
* **Key Components:** Safe dynamic array modification using indexed register scrubbing to prevent record corruption during item deletion.

### 📅 9. Event Hierarchies & Comparators (`mips-assembly-exercises/09-event-collections`)
* **Description:** Sorting engine aligning heterogeneous event logs based on their physical occurrence frequency.
* **Key Components:** Memory-efficient array iteration and natural sequence comparisons using conditional set primitives.

### 🎲 10. Robust Random Division (`mips-assembly-exercises/10-random-division-handler`)
* **Description:** A defensive runtime framework built to secure unpredicted operational execution paths against dynamic arithmetic errors.
* **Key Components:** Software-level multi-catch routing blocks checking for both input type validation and critical division-by-zero hardware traps.

### 📊 11. University Grade Parser (`mips-assembly-exercises/11-grade-parser-exception`)
* **Description:** Text-stream processing tokenizator that parses, validates, and evaluates raw string-encoded grade inputs.
* **Key Components:** Stream scanning utilizing loop isolators to filter out bad tokens (illegal range boundaries or non-numeric ASCII strings) without breaking the execution flow.

---

## 🚀 How to Run the Programs

To run these assembly files on your computer:
1. Download and install the [MARS Simulator](https://courses.missouristate.edu/kenvollmar/mars/).
2. Open MARS and navigate to the `mips-assembly-exercises/` directory to load any `.asm` or `.s` file.
3. Click on **Assemble** (the wrench and screwdriver icon).
4. Click on **Run** (the green play button) to execute the code and interact with the simulated console.
