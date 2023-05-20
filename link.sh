#!/bin/bash
aa=$(nproc --all)
for i in $(seq -f "%02g" 1 $aa); do ln -f "aermod_main/aermod" "core"$i"/"; done
