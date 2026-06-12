echo "Building for target: $TARGET"
mkdir -p build
mkdir -p build/$TARGET
mkdir -p build/$TARGET/singles

echo "Compiling print.asm..."
nasm src/$TARGET/print.asm -f elf64 -o build/$TARGET/singles/print.o

echo "Compiling readln.asm..."
nasm src/$TARGET/readln.asm -f elf64 -o build/$TARGET/singles/readln.o

echo "Compiling strcmp.asm..."
nasm src/strcmp.asm -f elf64 -o build/$TARGET/singles/strcmp.o

echo "Compiling strlen.asm..."
nasm src/strlen.asm -f elf64 -o build/$TARGET/singles/strlen.o

echo "Linking..."
ld -m elf_x86_64 -r \
    build/$TARGET/singles/print.o \
    build/$TARGET/singles/readln.o \
    build/$TARGET/singles/strcmp.o \
    build/$TARGET/singles/strlen.o \
    -o build/$TARGET/stdlib.o

echo "Done"
echo "stdlib.o is in build/$TARGET/"