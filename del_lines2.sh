#!/bin/bash
gawk '

   NR==FNR{ kk=$0
	   #~ print kk
	   ;next;}
NR!=FNR{
	{
	 n=split($0,a," ",b)
 line=b[0];
 	   if(FNR>=10 && FNR<=45){
		if(FNR==kk+9){
	for (i=1;i<=n; i++)
     line=(line a[i] b[i])
     	print line
#~ 
}}
	else if(FNR>=46 && FNR<=81){
		if(FNR==(kk+9+36)){
	for (i=1;i<=n; i++)
     line=(line a[i] b[i])
     	print line
#~ 
}}
		else {
			 for (i=1;i<=n; i++)
     line=(line a[i] b[i])
     	print line
			}
}
	#~ 
	
}' nw.txt 21_SEP2.inp
