# asm-stdlib
A small personal collection of simple "stdlib" tools for use in x86_64 assembly.

## NOTE
This version of asm-stdlib will only compile for x86_64 Linux, as it makes use of syscalls unique to that OS

To use this, simply run the build script and copy the resulting `stdlib.o` to whereever you want to use it. You'll need to include it in the linking command.

## Features:
- strlen
- strcmp
- readln
- print

### strlen
This routine takes the address of a string of bytes in `rdi` and reads until it encounters a nullbyte. The length of the string is stored in `rax`.

### strcmp
This routine takes the addresses of two strings in `rsi` and `rdi` and reads until either there is a difference or there is a nullbyte in both at the same time. Returns 1 in `rax` if the strings are equal, 0 if not.

### readln
This routine makes use of a Linux syscall to read a line from a terminal. Takes the address of the buffer to read to in `rdi`. and length in `rsi`. Blocks until `Return` is pressed. Returns the number of read bytes in `rax`.

### print
This routine takes the address of a string in `rdi` and prints it using the Linux syscall `write`