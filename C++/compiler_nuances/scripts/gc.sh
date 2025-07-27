#!/bin/bash
g++ "$1" -o main && ./main
rm -f main
