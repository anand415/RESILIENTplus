clear all;
close all;
load Rmat_fwd.mat
load ../vocvalppb.mat

C=Rmat_fwd;
d=vocvalppb;kk=1;

rng default
load mccv_partns_40c10_8000.mat
for ii=1:8000
    
% ii
Nind=CCtrain(ii,:);
% allsetN=true(1,length(vocvalppb));allsetN(~Nind)=0;

Ctr{ii}=Rmat_fwd([Nind],:);
dtr{ii}=vocvalppb([Nind]);
fun = @(x) (C*x-d);
S_nn{ii}=lsqnonneg(Ctr{ii},dtr{ii});
errall_nn{ii}=fun(S_nn{ii});

% funga = @(x) sum(abs((Ctr{ii}*x'-dtr{ii})));
% fun = @(x) (C*x'-d);

% errall_ga{ii}=fun(ga(funga,size(Ctr{ii},2),[],[],[],[],zeros(1,size(Ctr{ii},2)),[],[]));

end
save('err_mccv_40c10_8000_nn','errall_nn','S_nn')