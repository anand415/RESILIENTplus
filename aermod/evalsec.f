            subroutine evalsec 
           USE MAIN1
           use main2
           
c~            print *,'h'

c~                 mn_sim=mean(sim_sel,0)
c~         do kk=1,137
c~             nrmlized_sim(kk)=sim_sel(kk)-(sum(sim_sel)/137)
c~             evd_nrm(kk)=evd(kk)-(sum(evd)/137)
c~         enddo
c~                 print *,nrmlized_sim(2),evd(2),evd_nrm(2)
c~         do kk=1,137
c~         errr(kk)=abs(sim_sel(kk)-(evd(kk)*1000))
c~      &                               /((evd(kk)*1000))
c~         enddo
c~         mse(2)=(sum(errr))/1000
c~                     write(filnam,'(a7)') 'msd_tst'
                    write(filnam,'(a7)') 'output_rec'

      
c~      &        (annval(indx_evd(kk),1,1),kk=1,2),(errr(kk),kk=1,2),mse(2)
c~         write(filnam,'(a4,i1,a4)') 'core', my_id,'/mse'
c~             !write(filnam,'(a3)') 'all'
      
       inquire(file=filnam, exist=exiist)
        if (exiist) then
	!	print *,'there'
        open(1222, file=filnam, status="old", position="append", 
     &                                               action="write")
!	 print *,'ntthere'
        else
            open(1222, file=filnam, status="new", action="write")
       endif
       
               do kk=1,nobs
c~             sim_sel(kk)=(annval(indx_evd(kk),1,1))
c~              write(*, '(2f12.1,2x,f12.3,2x,f12.3)') AXR(indx_evd(kk)),
c~      &     AYR(indx_evd(kk)),annval(indx_evd(kk),1,1)
            write(*, '(f12.3)'),annval(indx_evd(kk),1,1)
c~              write(1222, '(2f12.1,2x,f12.1,2x,f12.1)') AXR(kk),AYR(kk)
c~                 ,annval(kk,1,1)
c~      &        evd(kk)*1000
       enddo
       
        close(1222)
           end
