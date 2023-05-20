subroutine gafortran2
USE gafort_globals
USE ran_state
use omp_lib
IMPLICIT NONE

INTEGER(K4) ::ik, ipick, mate1, mate2, itemp, n, my_cpu_id, j, ii, &
               icross,k,offset,ithird,iforth,jj,i
               
REAL(DP) :: fbar,  temp, rand, evals

character*50 :: filename
 real(4),dimension(8) :: str

open(231,file='fnl',status='old',action='read') 
CALL initial2_s8

!!!!!!! Main generational processing loop. !!!!!!!!!!!

DO i=1,maxgen

   CALL evalout

    call crosnmut2_s8
    
CALL newgen(ielite)

!~  if(microga.eq.1)  call gamicro2_s8
 
END DO

END SUBROUTINE gafortran2
!********************************************************
