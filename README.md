# 2D Array Sorting using MIPS Assembly

##  Project Overview
This project is a low-level programming implementation designed to sort a **2D array (8x8 matrix)** using **MIPS Assembly language**. It demonstrates how data is stored in memory, how registers are manipulated, and how algorithms are implemented without the abstraction of high-level languages.

##  Features
- **Data Structure:** Handles an 8x8 matrix (64 elements) stored in memory starting from base address `0x10000000`.
- **Algorithm:** Implements the **Bubble Sort** algorithm adapted for 2D memory indexing.
- **Output:** Prints the array twice: first in its **Unsorted** state and then in its **Sorted** state.

## Technical Concepts Applied
- **Memory Addressing:** Calculating the offset for 2D elements using the formula: `Address = BaseAddress + (row * row_size + column) * element_size`.
- **System Calls (Syscalls):** Used for printing integers, strings, and handling program termination.
- **Register Management:** Efficient use of `$s` and `$t` registers for loops and temporary calculations.

## Tools Used
- **MARS (MIPS Assembler and Runtime Simulator)** or **QtSpim**.

## Repository Structure
- `matrix_sort.asm`: The source code containing the logic for sorting and printing.
- `Project_Report.pdf`: Comprehensive documentation explaining the logic, flowchart, and output screenshots.

##  Learning Outcomes
- Understanding the interaction between hardware and software.
- Mastering manual memory management and loop structures in Assembly.
- Debugging low-level code using simulators.
