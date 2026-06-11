mkdir build
nasm src/print.asm -f elf64 -o build/print.o
nasm src/readln.asm -f elf64 -o build/readln.o
nasm src/strcmp.asm -f elf64 -o build/strcmp.o
nasm src/strlen.asm -f elf64 -o build/strlen.o
ld -m elf_x86_64 -r build/print.o  build/readln.o build/strcmp.o build/strlen.o -o build/stdlib.o