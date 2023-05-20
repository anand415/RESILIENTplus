! This program is the Fortran 90 version of gafortomp.f
!*************************************************************************
MODULE gafort_globals
IMPLICIT NONE
INTEGER, PARAMETER :: DP=KIND(1.0D0)
INTEGER, PARAMETER :: K4=KIND(1)
INTEGER, PARAMETER :: OMP_LOCK_KIND = selected_int_kind(18) 
INTEGER(K4), PARAMETER :: indmax=500, nchrmax=450, nparmax=30,nparam=8
REAL, DIMENSION(nparam,indmax) :: parent, child
REAL(DP), DIMENSION(indmax) :: fitness
REAL(DP) :: pcross,pmutate,tmpr
INTEGER(K4) :: maxgen,idum,ielite, &
               nchild,microga,npopsiz,itt
INTEGER(K4) :: numthreads
integer :: clck_counts_beg, clck_counts_end, clck_rate,lck
character*1754            :: rdfl,ss
real :: ibest(8),best,mccont
character(len=60) ::  command
integer( kind = 4 ) result
REAL(DP), PARAMETER :: tmps=0.0001,tmps2=10,tmps3=5


END MODULE gafort_globals
!*************************************************************************
MODULE ran_state
USE gafort_globals, ONLY : K4,DP
IMPLICIT NONE
INTEGER(K4), PARAMETER :: madim=55
TYPE ranstate
     REAL(DP) :: ma(madim),mj
     INTEGER(K4) :: iff,inext,inextp,iduma
     INTEGER(K4) :: padding	(128)
END TYPE ranstate
TYPE(ranstate), ALLOCATABLE :: procstates(:)
INTEGER(K4) :: lenran
!  According to Knuth, any large mbig, and any smaller (but still large)
!  mseed can be substituted for the above values.                       
REAL(DP), PARAMETER :: mbig=4000000.,mseed=1618033.,mz=0.,fac=1./mbig
END MODULE ran_state

subroutine gafortran
USE gafort_globals
USE ran_state
use omp_lib
IMPLICIT NONE

INTEGER(K4) ::ik, ipick, mate1, mate2, itemp, n, my_cpu_id, j, i,ii, &
               icross,k,offset,ithird,iforth,jj
               
REAL(DP) :: fbar,  temp, rand, evals

character*50 :: filename 
real(4),dimension(nparam) :: str

!$     numthreads=omp_get_max_threads()
open(231,file='fnl',status='old',action='read')

do ik=1,numthreads
 rewind(unit=131+ik)
end do
 call initials8
!!!!!!! Main generational processing loop. !!!!!!!!!!!
DO i=1,maxgen

   CALL evalout
   CALL crosnmuts8
   CALL newgen(ielite,ibest)

!~  if(microga.eq.1)  call gamicros8

END DO

END SUBROUTINE gafortran
!********************************************************
