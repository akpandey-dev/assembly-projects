#! /bin/bash

nasm -f elf64 hello-world-two-times-loop.asm -o hello-world-two-times-loop.o
ld hello-world-two-times-loop.o -o hello-world-two-times-loop
