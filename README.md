# System-Verilog

My notes and practice projects from learning SystemVerilog, mostly for
verification: interfaces, testbench programs, monitors, packages, structs and
enums. Each folder is a small Vivado project.

## What's inside

| Folder / file | What I practiced |
|---|---|
| `Basic_sv/` | Full adder and a first SystemVerilog testbench |
| `ALU/` | 4-bit ALU with a testbench |
| `Assignment1/` | 4:1 mux verified through an interface, a monitor and a test program |
| `Assignment2/` | Mealy FSM that detects the sequence `101`, with interface and monitor |
| `interface/` | Up/down counter driven through an interface |
| `arbitor/` | Arbiter connected with ports versus with an interface |
| `cross_module/` | Cross-module references from a test to a design |
| `DualPortMemory/` | Memory with a bidirectional interface |
| `TrueDualPortMemory/` | True dual-port memory using a package |
| `enum.sv`, `struct.sv` | Enum and struct examples |
| `main.c` | The same struct/enum ideas in C, for comparison |
| `notes.txt`, `sv.txt`, ... | My study notes (data types, regions, ...) |

## Try it

Open any folder's `.xpr` file in Vivado and run behavioral simulation. The
sources are under `<folder>/<folder>.srcs/`.
