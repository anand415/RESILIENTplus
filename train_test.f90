program train_test
USE gafort_globals
USE ran_state
use omp_lib
IMPLICIT NONE

integer :: hj,i1,k1,j1,temp,jj,ik
real :: u,rand

character*50 :: filename 


real,dimension(nparam) :: emiss

NAMELIST /ga/ npopsiz,pmutate,maxgen,idum,pcross,&
              ielite,nchild,microga

open(unit=1923,file='aermod.inp',status='replace',action='write',form='formatted')

open(unit=10, file="21_SEP2.inp", action="read",form="unformatted", access="stream")


!$     numthreads=omp_get_max_threads()
CALL ran3(-1000,rand,1,numthreads)

call system_clock ( clck_counts_beg, clck_rate )
write(command,'(a20)') 'rm msd_tst;rm msd_tr'
call system ( command, result )

do ik=1,numthreads
write(filename,'(a4,i2.2,a11)') 'core',ik,'/aermod.inp'
open(unit=131+ik,file=filename,status='replace',action='write',form='formatted')
end do

read(10) rdfl

do hj=1,1
print *,hj
itt=hj

OPEN (UNIT=23, FILE='ga.inp', STATUS='OLD')
READ (23, NML = ga)
close(23)

call gafortran
OPEN (UNIT=23, FILE='ga2.inp', STATUS='OLD')
READ (23, NML = ga)

do k1=1,20
call gafortran2
end do

OPEN (UNIT=23, FILE='ga3.inp', STATUS='OLD')
READ (23, NML = ga)

do k1=1,20
call gafortran3
end do
 
call testing_s8

ENDDO

call system_clock ( clck_counts_end, clck_rate )
write (*, *)  (clck_counts_end - clck_counts_beg) / real (clck_rate)
end program

