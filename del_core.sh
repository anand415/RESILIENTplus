#!/bin/bash
aa=$(nproc --all)
for i in $(seq -f "%02g" 1 $aa);
do rm -vfr "core"$i; done
#do mkdir "core"$i; done
