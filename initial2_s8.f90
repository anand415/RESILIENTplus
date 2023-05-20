SUBROUTINE initial2_s8
USE gafort_globals, ONLY : K4,DP,parent,npopsiz,nparam,pmutate,maxgen,   &
                          idum,ielite,nchild,microga, &
                          child,fitness,numthreads,ibest,tmps,tmps2,tmps3,tmpr
IMPLICIT NONE

INTEGER(K4) :: i, j, n2j,my_cpu_id
INTEGER(K4), DIMENSION(numthreads) :: iduma
REAL(DP) :: rand

!$ INTEGER(K4) :: omp_get_thread_num
parent(1:nparam,1)=ibest(1:nparam)
!$OMP PARALLEL private(i,j,rand,my_cpu_id,tmpr)
  my_cpu_id = 1
!$    my_cpu_id = omp_get_thread_num() + 1
!$OMP DO
   DO i=2,npopsiz
      fitness(i)=0
      do j=1,nparam
 CALL ran3(1,rand,my_cpu_id,0)
tmpr=(rand*maxval(ibest)*2)
parent(1,i)=(merge(tmpr,tmps,tmpr>tmps))
	   END DO 
	   end do   
 !$OMP END DO
!$OMP END PARALLEL
END SUBROUTINE initial2_s8
