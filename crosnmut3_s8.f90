subroutine crosnmut3_s8
USE gafort_globals
INTEGER(K4) :: ipick, mate1, mate2,  n, my_cpu_id, j
REAL(DP) :: fbar,  temp, rand, evals


ipick=npopsiz
do i=1,npopsiz,nchild
call selectn(ipick,i,mate1,mate2)
DO j=1,nparam	         
CALL ran3(1,rand,1,0)
IF (rand.LE.pcross) THEN
child(j,i)=parent(j,mate2)
END IF
if(microga.eq.0) then

	 CALL ran3(1,rand,1,0)
		  IF (rand.LE.pmutate) THEN 
		 CALL ran3(1,rand,1,0)
		  tmpr=(-1+rand*2+ibest(j))
		child(j,i)=(merge(tmpr,tmps,tmpr>tmps))
ENDIF

 
endif
enddo
END DO  
end subroutine
