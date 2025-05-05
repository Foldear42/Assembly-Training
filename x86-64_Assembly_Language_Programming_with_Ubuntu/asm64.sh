#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: ./asm64 <asmMainFile> (no extension)"
    exit
fi

if [ ! -e "$1.asm" ]; then
    echo "Error, $1.asm not found."
    echo "Note, do not enter file extensions."
    exit
fi

rm -f "$1" "$1.o" "$1.lst"

yasm -Worphan-labels -g dwarf2 -f elf64 $1.asm -l $1.lst -o $1.o
ld -g -o $1 $1.o