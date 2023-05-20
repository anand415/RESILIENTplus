#!/bin/bash
#~ rm -r MET*
#~ matlab -nodisplay < alldays_datacompare.m
#~ matlab -nodisplay < copytoallmet.m 
for d in $(find . -name "MET*" | sort); do
    echo "$d"
		cd "$d"
				
	sh run_ms_ss.sh
		cd ../	
done;


#~ cd aermod_SS
		#~ make -C aermod_main
		#~ make -C aermod
		#~ cd ..
		#~ cd aermod_MS
		#~ make -C aermod_main
#~ rm $d/"aermod_SS/aermod_main/aermod.o";

#~ rm $d/"aermod_MS/aermod_main/aermod.o";
		#~ rm $d/"aermod_SS/aermod_main/calc1.o";
		#~ rm $d/"aermod_MS/aermod_main/calc1.o";
		#~ rm $d/"aermod_SS/aermod_main/modules2.o";
		#~ rm $d/"aermod_MS/aermod_main/modules2.o";
		#~ rm $d/"aermod_SS/aermod_main/evalsec.o";
		#~ rm $d/"aermod_MS/aermod_main/evalsec.o";
		#~ rm $d/"aermod_SS/aermod/aermod.o";
		#~ rm $d/"aermod_MS/aermod/aermod.o";
		#~ rm $d/"aermod_SS/aermod/calc1.o";
		#~ rm $d/"aermod_MS/aermod/calc1.o";
		#~ rm $d/"aermod_SS/aermod/modules2.o";
		#~ rm $d/"aermod_MS/aermod/modules2.o";
		#~ rm $d/"aermod_SS/aermod/evalsec.o";
		#~ rm $d/"aermod_MS/aermod/evalsec.o";
