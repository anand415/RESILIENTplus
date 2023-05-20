		MODULE MAIN2
        IMPLICIT NONE
        INTEGER, PARAMETER ::  nobs=47  
       real  :: mse(2)
       
       DOUBLE PRECISION :: evd(nobs),errr(nobs)
       integer :: indx_evd(nobs),my_id,jhh
        CHARACTER*30 filname,bfilnam
        integer :: hh,kk,lng,ind,ii,itt
      LOGICAL :: exiist
      character*39 filnam,filnam1
      real :: sim_sel(nobs)


        
       
        DATA indx_evd /
     &  3039,2425,3976,3627,4232,5437,5920,7005,4134,7378,
     &  6658,6175,5571,4968,4126,4250,4854,5820,5583,6186,5957,
     &  5234,4751,4268,3423,1367,2106,2940,3176,2809,2684,2441,2071,
     &  630,2599,2849,3350,5966,5859,6342,5383,4659,5001,4277,3912,
     &  6787,7150/
            END MODULE MAIN2