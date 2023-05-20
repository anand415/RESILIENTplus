#!/bin/bash

make clean -C aermod_main
make -C aermod_main
sh del_core.sh
sh create_core.sh
sh link.sh;
make clean -C aermod
make -C aermod

make clean
make
./armd >s8

#~ result=${PWD}          # to assign to a variable
#~ dt=$(echo $result | cut -c 109-116);
#~ ./armd > "MS_"$dt
#~ echo $PWD"MSfinished"

