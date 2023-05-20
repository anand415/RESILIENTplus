clear all;
close all;
load Rmat_fwd.mat
load ../vocvalppb.mat
load mccv_partns_40c10_8000
options = optimoptions('ga','MaxGenerations', 20000,'FunctionTolerance',1e-8);

C=Rmat_fwd;
d=vocvalppb;
kk=1;tic

for ii=1:500
ii
Nind=CCtrain(ii,:);
allsetN=true(1,length(vocvalppb));allsetN(Nind)=0;
Ctr{ii}=Rmat_fwd([Nind],:);
dtr{ii}=vocvalppb([Nind]);

    kr=inv(Ctr{ii}'*Ctr{ii}+eye(36))*Ctr{ii}'*dtr{ii};
    kr(kr<0)=0;
fun = @(x) (C*x-d);
errall_ridge{ii}=fun(kr);


    
% toc


end

save('errall_ridge1000','errall_ridge')