#!/bin/bash
gawk '
 {n=split($0,a," ",b)
 line=b[0];
 	   if(NR>=11 && NR<=59){
		if(NR==12){
	for (i=1;i<=n; i++)
     line=(line a[i] b[i])
     	print line
#~ 
}}
		else {
			 for (i=1;i<=n; i++)
     line=(line a[i] b[i])
     	print line)
			}
	#~ 
	
}' aermod.inp
