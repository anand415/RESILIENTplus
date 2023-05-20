SUBROUTINE initial4_s8
USE gafort_globals, ONLY : K4,DP,parent,npopsiz,nparam,pmutate,maxgen,   &
                          idum,ielite,nchild,microga, &
                          child,fitness,numthreads,ibest
IMPLICIT NONE

INTEGER(K4) :: i, j, n2j,my_cpu_id
INTEGER(K4), DIMENSION(numthreads) :: iduma
REAL(DP) :: rand,tmpp
!$ INTEGER(K4) :: omp_get_thread_num
!
parent(1:nparam,1)=ibest(1:nparam)
!$OMP PARALLEL private(i,j,rand,my_cpu_id)
  my_cpu_id = 1
!$    my_cpu_id = omp_get_thread_num() + 1
!$OMP DO
   DO i=2,npopsiz
      fitness(i)=0
      DO j=1,nparam
      CALL ran3(1,rand,my_cpu_id,0)
      tmpp=ibest(j)+rand-0.5
if(tmpp .lt. 0)tmpp=0
      	parent(j,i)=tmpp
       END DO
   END DO    
 !$OMP END DO
!$OMP END PARALLEL
END SUBROUTINE initial4_s8
