#!/bin/bash
git clone git@github.com:51ddhesh/kilo-editor.git
cd kilo-editor
mv kilo.c ..
cd ..
rm -rf kilo-editor
cc kilo.c -o kilo -std=c23 -save-temps
rm -f kilo.c kilo
