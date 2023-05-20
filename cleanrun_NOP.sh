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
./armd >13c0_s8_nae_za

