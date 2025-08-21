#!/bin/bash
g++ -std=c++20 -O3 -pthread main.cpp -o ring_buffer
./ring_buffer
rm -f ring_buffer