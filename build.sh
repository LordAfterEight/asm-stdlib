TARGET=${1:-linux}

if [ "$TARGET" = "windows" ]; then
    echo "Currently not supported. Keep an eye on the GitHub:"
    echo "https://github.com/LordAfterEight/asm-stdlib"
    exit 0
elif [ "$TARGET" = "linux" ]; then
    FORMAT="elf64"
    LINK_EMU="elf_x86_64"
else
    echo "Invalid build target: $TARGET"
    exit 1
fi

echo "Building for target: $TARGET"
mkdir -p build
mkdir -p build/$TARGET
mkdir -p build/$TARGET/singles

echo "Compiling print.asm..."
nasm src/$TARGET/print.asm -f $FORMAT -o build/$TARGET/singles/print.o

echo "Compiling readln.asm..."
nasm src/$TARGET/readln.asm -f $FORMAT -o build/$TARGET/singles/readln.o

echo "Compiling strcmp.asm..."
nasm src/strcmp.asm -f $FORMAT -o build/$TARGET/singles/strcmp.o

echo "Compiling strlen.asm..."
nasm src/strlen.asm -f $FORMAT -o build/$TARGET/singles/strlen.o

echo "Linking..."
ld -m $LINK_EMU -r \
    build/$TARGET/singles/print.o \
    build/$TARGET/singles/readln.o \
    build/$TARGET/singles/strcmp.o \
    build/$TARGET/singles/strlen.o \
    -o build/$TARGET/stdlib.o

echo "Done"
echo "stdlib.o is in build/$TARGET/"