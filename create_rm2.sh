#!/bin/bash
rm nw.txt
for f in $(seq -f "%02g" 1 36)
do
echo $f >nw.txt 
rm "aermod_"$f
sh del_lines2.sh >"aermod_"$f
cp "aermod_"$f aermod.inp;aermod/aermod >"fwd_Rmat_files/fwd_Rmat_"$f
done
