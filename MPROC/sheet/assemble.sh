#!/bin/bash

src=$1
exe=${src:0:-4}
object=$exe.o

#echo $src
#echo $object
#echo $exe

nasm -f elf64 $src
ld $object -o $exe
./$exe

