#!/bin/bash
aa=$(nproc --all)
for i in $(seq -f "%02g" 1 $aa);
#do rm -vfr "core"$i; done
do mkdir "core"$i; 
cp AERMET.SFC ./"core"$i
cp AERMET.PFL ./"core"$i
cp pmatt_13c1_bin ./"core"$i
done
