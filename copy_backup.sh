#!/bin/bash
for f in $(seq 1 50)
do
for i in $(seq 11 59)
do 
c=$((i-10))
a[$c]=$i
done
unset a[$f]

for i in ${a[@]}
do 
echo $i
done
done
