#!/bin/bash
gawk '
  {a[NR]=$1
	   }
	   {print a[NR]}' nw.txt
