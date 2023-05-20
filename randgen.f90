SUBROUTINE ran_init(idum,procs)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Initialize the state of the random number generator per processor.   !
! To avoid false sharing and increase spatial locality, we allocate    !
! one structure ranstate per processor and maintain pointers to it.    !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
USE gafort_globals, ONLY : K4,DP
USE ran_state
IMPLICIT NONE
INTEGER(K4), INTENT(IN) :: procs,idum
INTEGER(K4) :: i,ii,k,j
REAL(DP) :: mk
!
IF (lenran > 0) THEN
   DEALLOCATE(procstates)
   lenran=0
END IF
!
lenran=procs
!PRINT *,PROCS
ALLOCATE(procstates(lenran))    ! Allocate an array of pointers to ranstate per proc.
DO j=1,lenran
   procstates(j)%iff=0
   procstates(j)%iduma=idum*j  ! Generate seed value for each processor.
   IF (procstates(j)%iff.EQ.0) THEN
      procstates(j)%iff=1
      procstates(j)%mj=mseed-DBLE(IABS(procstates(j)%iduma))
      procstates(j)%mj=DMOD(procstates(j)%mj,mbig)
      procstates(j)%ma(madim)=procstates(j)%mj
      mk=1
      DO i=1,madim-1
         ii=MOD(21*i,madim)
         procstates(j)%ma(ii)=mk
         mk=procstates(j)%mj-mk
         IF(mk.LT.mz) mk=mk+mbig
         procstates(j)%mj=procstates(j)%ma(ii)
      END DO
      DO k=1,4
         DO i=1,madim
            procstates(j)%ma(i)=procstates(j)%ma(i)-procstates(j)%ma(1+MOD(i+30,madim))
            IF(procstates(j)%ma(i).LT.mz) procstates(j)%ma(i)=procstates(j)%ma(i)+mbig
         END DO
      END DO
      procstates(j)%inext=0
      procstates(j)%inextp=31
      procstates(j)%iduma=1
   END IF
END DO
END SUBROUTINE ran_init
!*************************************************************************
SUBROUTINE ran3(idum,rand,j,numprocs)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  Returns a uniform random deviate between 0.0 and 1.0.  Set idum to  !
!  any negative value to initialize or reinitialize the sequence.      !
!  This function is taken from W.H. Press', "Numerical Recipes" p. 199.!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
USE gafort_globals, ONLY : K4,DP
USE ran_state
IMPLICIT NONE
INTEGER(K4), INTENT(IN) :: j,numprocs,idum
REAL(DP), INTENT(OUT) :: rand
!
 !print *,numprocs,J
IF (idum.LT.0) CALL ran_init(idum,numprocs)
procstates(j)%inext=procstates(j)%inext+1
IF(procstates(j)%inext.EQ.56) procstates(j)%inext=1
procstates(j)%inextp=procstates(j)%inextp+1
IF(procstates(j)%inextp.EQ.56) procstates(j)%inextp=1
procstates(j)%mj=procstates(j)%ma(procstates(j)%inext) & 
                       - procstates(j)%ma(procstates(j)%inextp)
IF(procstates(j)%mj.LT.mz) procstates(j)%mj=procstates(j)%mj+mbig
procstates(j)%ma(procstates(j)%inext)=procstates(j)%mj
rand=procstates(j)%mj*fac
END SUBROUTINE ran3
