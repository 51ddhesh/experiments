#!/bin/bash
gcc "$1" -o main && ./main
rm -f main
