SUBROUTINE gamicro2_s8
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Micro-GA implementation subroutine !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
USE gafort_globals, ONLY : K4,DP,npopsiz,nparam,parent,ibest,fitness
IMPLICIT NONE
SAVE
!INTEGER(K4), DIMENSION(nchrmax) :: ibest
INTEGER(K4) :: icount, j, n,my_cpu_id
REAL(DP) :: diffrac, rand
   !$ INTEGER(K4) :: omp_get_thread_num
icount=0

DO j=1,npopsiz
   DO n=1,nparam
	
      IF(parent(n,j).NE.ibest(n)) then
      icount=icount+1
        endif
   END DO
END DO
!~ print *,icount
diffrac=DBLE(icount)/DBLE((npopsiz)*nparam)
IF (diffrac.LT.0.02d0) THEN
!~    print *,'entered micro'
   parent(1:nparam,1)=ibest(1:nparam)

!$OMP PARALLEL private(n,j,rand,my_cpu_id)
  my_cpu_id = 1
!$    my_cpu_id = omp_get_thread_num() + 1
!$OMP DO
   DO j=2,npopsiz
      DO n=1,nparam
      CALL ran3(1,rand,my_cpu_id,0)
         parent(n,j)=(rand*maxval(ibest)*2)
 END DO

   END DO    
 !$OMP END DO
!$OMP END PARALLEL
 END IF
END SUBROUTINE gamicro2_s8
