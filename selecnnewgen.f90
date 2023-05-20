SUBROUTINE selectn(ipick,j,mate1,mate2)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Subroutine for selection operator.  Presently, tournament selection !
! is the only option available.                                       !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
USE gafort_globals, ONLY : K4,DP,fitness,parent,child,npopsiz,nparam, &
                           nchild
IMPLICIT NONE
INTEGER(K4), INTENT(IN) :: j,ipick
INTEGER(K4), INTENT(OUT) :: mate1,mate2 
INTEGER(K4) :: n,ifirst,isecond,ithird,iforth
			call select(mate1,ipick)
			call select(mate2,ipick)
		    DO n=1,nparam
      child(n,j)=parent(n,mate1)
   END DO
END SUBROUTINE selectn
!*************************************************************************
!*************************************************************************
SUBROUTINE newgen(ielite)
USE gafort_globals, ONLY : K4,DP,npopsiz,nparam, &
                           parent,child,numthreads,ibest
IMPLICIT NONE
SAVE
INTEGER(K4), INTENT(IN) :: ielite
INTEGER(K4) :: j, n, kelite, jelite, irand, my_cpu_id
!$ INTEGER(K4) :: omp_get_thread_num
INTEGER(K4), DIMENSION(numthreads) :: kelite1
REAL(DP) :: rand
!

!$OMP PARALLEL PRIVATE(j,n,my_cpu_id)
my_cpu_id = 1
!$ my_cpu_id = omp_get_thread_num() + 1
kelite1(my_cpu_id) = 0
!$OMP DO LASTPRIVATE(jelite,kelite)
  DO j=1,npopsiz
     jelite=0
     DO n=1,nparam
        parent(n,j)=child(n,j)
        IF (parent(n,j).EQ.ibest(n)) jelite=jelite+1
        IF (jelite.EQ.nparam) kelite1(my_cpu_id)=1
     END DO
  END DO
!$OMP END DO
!$OMP END PARALLEL
kelite=SUM(kelite1) ! If any elements are 1, kelite>0, else kelite=0.
IF (ielite.NE.0 .AND. kelite.EQ.0) THEN
   CALL ran3(1,rand,1,0)
   irand=+NINT(0.5d0+DBLE(npopsiz-1)*rand)
   parent(1:nparam,irand)=ibest(1:nparam)
END IF
END SUBROUTINE newgen
!*************************************************************************
subroutine select(mate,ipick)
	!----------------------------------------------------------------------
	! This routine selects the better of two possible parents formating.
	!----------------------------------------------------------------------
USE gafort_globals, ONLY : K4,DP,npopsiz,nparam,fitness 
integer,intent(inout)	:: ipick
integer,intent(out)	:: mate


integer :: ifirst, isecond,mattmp,indtmp
real :: indv(4)

if(ipick+1 > npopsiz) then
	call shuffle(ipick)
!~ 	print *,'diditgo'
end if

do jh=1,4
indtmp=mod(ipick+jh-1,npopsiz)
if (indtmp.eq.0) indtmp=npopsiz
indv(jh)=fitness(indtmp)
enddo

mattmp=minloc(indv,DIM=1)
!~ print *,ifirst,isecond,'in'
mate=mod(ipick+mattmp-1,npopsiz)
if (mate.eq.0) mate=npopsiz

ipick=ipick+4
return
end subroutine select
!----------------------------------------------------------------------
subroutine shuffle(ipick)
	!----------------------------------------------------------------------
	USE gafort_globals, ONLY : K4,DP, npopsiz,nparam, &
                           parent,fitness,lck
		integer, intent(out)	:: ipick
		INTEGER(K4) :: j,  iother
INTEGER(K4) :: my_cpu_id
REAL(DP) :: rand, temp,itemp(nparam)

		ipick=1
DO j=1,npopsiz-1
   CALL ran3(1,rand,1,0)
   iother=j+1+DINT(DBLE(npopsiz-j)*rand)
   itemp(1:nparam)=parent(1:nparam,iother)
   parent(1:nparam,iother)=parent(1:nparam,j)
   parent(1:nparam,j)=itemp(1:nparam)
   temp=fitness(iother)
   fitness(iother)=fitness(j)
   fitness(j)=temp
END DO
return

end subroutine shuffle



