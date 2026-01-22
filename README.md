# 3-Stage_Pipeline_RISCV
## 3-Stage Pipelined RISC-V Processor (SystemVerilog)

This repository contains a **3-stage pipelined RISC-V processor** implemented in **SystemVerilog**, developed as part of a *Computer Architecture coursework project*.  
The design focuses on **clarity, correctness, and modular structure**, making it suitable for educational use and architectural exploration.

---

## 📌 Project Summary

The processor implements a simplified subset of the **RISC-V ISA** and follows a clean 3-stage pipeline:

- Instruction Fetch (IF)  
- Instruction Decode / Execute (ID/EX)  
- Memory Access / Writeback (MEM/WB)

The design demonstrates correct instruction flow, centralized control-signal generation, and disciplined pipeline timing using explicit pipeline registers.

---

## 🏗️ Architecture Overview

- **IF Stage:**  
  Fetches instructions, updates the program counter, and handles basic control-flow redirection.

- **ID/EX Stage:**  
  Decodes instructions, reads registers, generates immediates, executes ALU operations, and evaluates branch conditions.

- **MEM/WB Stage:**  
  Performs data memory access for loads/stores and writes results back to the register file.

---

## 🔁 Pipeline Registers

The design uses dedicated pipeline registers to maintain timing and instruction flow:

- IF/ID register  
- EX/MEM register  

The program counter and instruction word are propagated across stages to support debugging and verification.

---

## 🧩 Key Features

- Modular SystemVerilog design  
- Centralized control unit  
- ALU with arithmetic and logical operations  
- Immediate generator for common RISC-V formats  
- Load and store support  
- Branch and jump handling  
- Clean separation of datapath and control logic  

---

## ⚠️ Hazard Handling

- Control hazards are resolved by redirecting the program counter after branch or jump evaluation  
- Branch prediction and speculative execution are not implemented  
- Data hazards are assumed to be managed through instruction scheduling  

This keeps the design simple and predictable for learning purposes.

---

## 🧱 Modules

- Program counter  
- Instruction memory  
- Register file  
- ALU  
- Control unit  
- Immediate generator  
- Pipeline registers  
- Data memory  
- Top-level processor  
- Testbench  

---

## 🛠️ Tools Used

- VS Code – coding  
- ModelSim / Questa – simulation  
- GTKWave – waveform analysis  
- Venus – RISC-V binary generation  
