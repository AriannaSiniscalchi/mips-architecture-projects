# ⚙️ MIPS Architecture Projects
> *Computer Engineering Coursework • University of Bergamo (UniBG)*

---

### 💻 Overview
This repository contains a collection of low-level Assembly MIPS programs developed during my Computer Engineering studies at the University of Bergamo (UniBG). 

The goal of these projects is to demonstrate a solid understanding of low-level computer architecture, CPU register management, stack frame manipulation, memory allocation, and hardware-software interaction.

---

### 🛠️ Environment & Core Architecture

| Category | Technical Specification |
| :--- | :--- |
| **🟢 CPU Architecture** | MIPS32 (Reduced Instruction Set Computer - RISC) |
| **🔵 Simulation Suite** | MARS (MIPS Assembler and Runtime Simulator) |
| **🟠 Instruction Set** | Core MIPS assembly: Data transfer (`lw`, `sw`), Arithmetic (`add`, `sub`), Logical, Conditional branching (`beq`, `bne`), and Bitwise manipulation. |

---

### 📂 Detailed Project Directory

All MIPS Assembly source files are consolidated inside the `mips-assembly-exercises/` directory to maintain a clean repository root structure.

#### 🧮 1. Exception Handling & Fractions (`01-exception-handling-fractions`)
> **Core Focus:** Hardware Traps, Conditional Branching
* **Description:** Low-level logic system handling mathematical operations with fractional numbers.
* **Technical Details:** Implements domain-specific error trapping (e.g., zero denominator) using conditional branching instructions to simulate structured software exceptions.

#### ♟️ 2. Chess Board Simulator (`02-chess-board-oop`)
> **Core Focus:** Matrix Coordinate Offset, Base-Address Pointer Arithmetic
* **Description:** Architectural matrix simulation mapping a classic chess game board layout directly into contiguous memory blocks.
* **Technical Details:** Computes runtime memory offsets for multidimensional grid navigation and vector verification for legal piece movements.

#### 📄 3. Advanced I/O & Exception Hierarchy (`03-exceptions`)
> **Core Focus:** File Descriptors, Syscalls, Simulated Traps
* **Description:** Core system handling file description streams and simulated hardware exception traps via system calls (`syscall`).

#### 📐 4. Geometry System (`04-EsercitazioneInterfacce`)
> **Core Focus:** Subroutines, Memory Scaling Coefficients
* **Description:** Subroutine-driven application calculating multi-dimensional shape transformations and scaling coefficients directly in the memory buffer.

#### 👥 5. Object Identity & Hashing Contracts (`05-collections`)
> **Core Focus:** Logical Identity Tracking, Contiguous Blocks
* **Description:** Low-level implementation of custom logical identity tracking, replicating high-level key matching patterns within raw memory structures.

#### 🛒 6. Retail Management System (`06-retail-connect-system`)
> **Core Focus:** Memory Bound Checks, Atomic Registries
* **Description:** Multi-module inventory simulation balancing system registries, dynamic carts, and atomic warehouse stocking updates.
* **Technical Details:** Resource constraint enforcement using software-level bounds check algorithms to completely prevent transaction memory overflows.

#### 💳 7. Advanced Retail Framework (`07-retail-connect-evolved`)
> **Core Focus:** State Registers, Programmatic Loyalty Loops
* **Description:** Evolution of the retail subsystem introducing persistent user state registers and programmatic loyalty program logic.
* **Technical Details:** Uses conditional instruction branches handling automated tiered discounts and multi-variable loyalty point calculations using dedicated registers.

#### ✈️ 8. Airline Flight Management (`08-flight-management-system`)
> **Core Focus:** Indexed Register Scrubbing, Memory Deletion Loops
* **Description:** Structural program managing multi-class real-time seat registers, automated manifests, and total financial aggregation loops.
* **Technical Details:** Ensures safe dynamic array modification using indexed register scrubbing to prevent dataset record corruption during item deletion.

#### 📅 9. Event Hierarchies & Comparators (`09-event-collections`)
> **Core Focus:** Memory-Efficient Array Iteration, Set Primitives
* **Description:** Sorting engine aligning heterogeneous event logs based on their physical occurrence frequency.
* **Technical Details:** Optimizes data lookups through direct register indexing and natural sequence comparisons using conditional set primitives.

#### 🎲 10. Robust Random Division (`10-random-division-handler`)
> **Core Focus:** Error Routing Blocks, Multi-Catch Simulations
* **Description:** A defensive runtime framework built to secure unpredicted operational execution paths against dynamic arithmetic errors.
* **Technical Details:** Implements software-level multi-catch routing blocks checking for both input type validation and critical division-by-zero hardware traps.

#### 📊 11. University Grade Parser (`11-grade-parser-exception`)
> **Core Focus:** String Tokenizer, Loop Isolators, ASCII Filters
* **Description:** Text-stream processing tokenizer that parses, validates, and evaluates raw string-encoded grade inputs.
* **Technical Details:** Stream scanning utilizing loop isolators to filter out bad tokens (illegal range boundaries or non-numeric ASCII strings) without breaking the CPU execution flow.

---

### 🚀 How to Run the Programs

To run these assembly files on your system, you need a simulated MIPS environment:

1. Download the **MARS Simulator** from the [MSU MARS Page](https://computerscience.missouristate.edu/mars-mips-simulator.htm).
2. Launch the MARS GUI interface.
3. Open any source file (e.g., `02-chess-board-oop.asm`) from the `mips-assembly-exercises/` folder.
4. **Assemble the code:** Press the **Wrench and Screwdriver** icon (`F3`).
5. **Execute the software:** Click the green **Play** button to run the program and use the simulated I/O console window.

---

### 🎯 Coding & Engineering Standards
All MIPS Assembly source files are built following rigid structural standards for low-level software design:
* **Register Conventions:** Strict adherence to standard MIPS register usage rules (e.g., `$t` registers for temporary values, `$s` for saved data across calls).
* **Defensive Arithmetic:** Software-level validation checks before executing operations that risk triggering CPU-level hardware faults.
* **Documentation:** Heavy use of assembly comments mapping instructions to their conceptual pseudo-code operations.
