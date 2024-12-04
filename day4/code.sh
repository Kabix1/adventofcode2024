#!/usr/bin/env sh

{
awk -f part1.awk input | rg -o 'XMAS' | sort | uniq -c
awk -f part1.awk input | rg -o 'SAMX' | sort | uniq -c;
} | awk '{sum += $1} END{print sum}'

awk -f part2.awk input
