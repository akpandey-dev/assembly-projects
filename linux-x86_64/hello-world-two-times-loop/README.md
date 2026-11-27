# Hello World Two Times Loop

A **x86-64 NASM** program that prints `Hello, world!` twice to standard output using a **loop and Linux syscalls**.  
This minimal project demonstrates how to implement basic iteration in assembly while interacting directly with the operating system, without relying on libraries or runtime layers.

## Main features
- Written in **x86-64 NASM syntax**
- Uses **direct Linux syscalls** (`write(2)`, `exit(2)`)
- Implements a counter-based loop using `r12`
- Number of iterations can be changed easily by changing value of `r12`
- No libc, no runtime, no abstractions
- Includes a simple `build.sh` script for assembling and linking
- Demonstrates conditional branching, iteration, and register manipulation

## How it works

The program follows a counter-based loop:

1. Starts execution at `_start`
2. Initializes `r12` with the repetition count (`2`)
3. Checks whether the counter has reached zero
4. Prints the message using a `write(2)` syscall
5. Decrements the counter and jumps back to the loop
6. Invokes the `exit(2)` syscall once the counter reaches zero
7. Terminates the program

## Important

- `write(2)` syscall number = `1`
- Standard output file descriptor = `1`
- `exit(2)` syscall number = `60`
- `r12` holds the repetition counter because syscall overwrites `rcx` and `r11`.
- `cmp` and `je` control loop termination
- `dec` decrements the counter after each iteration
- `xor rdi, rdi` sets exit status to `0`

## Build & Run

```bash
chmod +x build.sh
./build.sh
./hello-world-two-times-loop
```

Invoke the script directly if you prefer not using `chmod`:

```bash
bash build.sh
./hello-world-two-times-loop
```
---

## Requirements

- NASM
- GNU ld
- Linux x86-64 environment (native or WSL)