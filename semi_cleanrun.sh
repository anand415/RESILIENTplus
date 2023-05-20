#!/bin/bash

make -C aermod_main
sh del_core.sh
sh create_core.sh
sh link.sh;
make -C aermod

make clean
make 
result=${PWD}          # to assign to a variable
dt=$(echo $result | cut -c 109-116);
./armd > "MS_"$dt
echo $PWD"MSfinished"
cp "MS_"$dt ../../results
