#!/bin/bash

# Neville, September 2026
# You have to give this file permission before you run it with "chmod +x ./compile.sh"

rm -rf target
mkdir -p target

cp -r src/gui target

javac \
    -soruce 21 \
    -target 21 \
    -cp "lib/*:src" \
    -d target \
    $(find src -name "*.java")

echo "Compilation complete. The results are in the folder 'target'"