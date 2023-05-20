SUBROUTINE evalout
USE gafort_globals, ONLY : K4,DP,parent,   &
                          fitness,npopsiz,nparam, &
                          numthreads,rdfl,ibest,best,ss,itt
!use  for_mse
IMPLICIT NONE
SAVE

INTEGER(K4) :: j, n, k, jstart, jend, jbest, my_cpu_id
REAL(DP) :: fitsum, pi
REAL(DP), DIMENSION(nparam) :: f1,f2,funcval1
        real(4),dimension(nparam) :: str,ems
		
			integer :: jhj
		character(len=80) ::  command
		real ::emis,mse(2,npopsiz)
		integer( kind = 4 ) result
		       integer :: ww,jj,hh
		       character*100 filepace,inpname
INTEGER(k4) :: l, iparam, m, i, nvalley,jjint
!$ INTEGER(K4) :: omp_get_thread_num
!	
fitsum=0.0d0
best=1d9

 write(command,'(a38)') 'find . -name "*mse*" -exec rm {} +'
call system ( command, result )


!$OMP PARALLEL PRIVATE(j,my_cpu_id,str,ss,command,result) 
my_cpu_id = 1
!$ my_cpu_id = omp_get_thread_num() + 1
!$OMP DO 
DO j=1,npopsiz
ss=rdfl
str(1:nparam)=parent(1:nparam,j)
	 do jj=1,nparam
 	write(ss(3812+85*(jj-1):3818+85*(jj-1)),'(f7.3)') str(jj)
 	enddo
 rewind(131+my_cpu_id)
				write(131+my_cpu_id,'(a)') ss
				
				write(command,'(a9,i2.2,a2,f5.1,a2,i3,a22,i2.2,a7)') 'printf "',my_cpu_id,'\n',real(j),&
&				'\n',itt,'\naermod.inp\n" | core',my_cpu_id,'/aermod'
				!print *,command
				call system ( command, result )
END DO
!$OMP END DO
!$OMP END PARALLEL
write(command,'(a54	)') 'find . -name "*mse*" -exec cat {} \; >fnl'
call system ( command, result )
rewind(231)

do j=1,npopsiz
read(231,'(2f12.3)') mse(1:2,j)
!~ print *,mse(1:2,j),'mse'
fitness(mse(1,j))=mse(2,j)
enddo 


! Check to see if fitness of individual j is the best fitness.
DO j=1,npopsiz
   IF (fitness(j).LT.best) THEN 
      best=fitness(j)
       jbest=j
      ibest(1:nparam)=parent(1:nparam,j)
   END IF
END DO
!~ do j=1,npopsiz
!~ print *,j,parent(1:nparam,j),fitness(j)
!~ print '(2f10.3)',mse(1:2,j)
!~ enddo
  print *,ibest(1:nparam),best,jbest,'best'

!~   print '(90f10.3,i3,4a)',ibest(1:nparam),best,jbest,'best'
END SUBROUTINE evalout
