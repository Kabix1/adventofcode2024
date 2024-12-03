#!/usr/bin/env sh

rg -o 'mul\([0-9]+,[0-9]+\)' input|rg -o '[0-9]+,[0-9]+' | awk -F ',' '{sum += $1*$2} END{print sum}'

rg -o "mul\([0-9]+,[0-9]+\)|do\(\)|don't\(\)" input | awk -f code.awk
