#!/bin/bash

make clean -C aermod_main
make clean -C aermod
sh del_core.sh
make clean

