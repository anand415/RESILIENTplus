clear all;
close all;
load Rmat_fwd.mat
load ../vocvalppb.mat
load mccv_partns_40c10_8000
options = optimoptions('ga','MaxGenerations', 20000,'FunctionTolerance',1e-8);

C=Rmat_fwd;
d=vocvalppb;
kk=1;
tic
for ii=1:8000
ii
Nind=CCtrain(ii,:);
allsetN=true(1,length(vocvalppb));allsetN(Nind)=0;
Ctr{ii}=Rmat_fwd([Nind],:);
dtr{ii}=vocvalppb([Nind]);

fun = @(x) (C*x'-d);
funga = @(x) norm((Ctr{ii}*x'-dtr{ii}));

for uu=1:4
    tmm(uu,:)=fun(ga(funga,size(Ctr{ii},2),[],[],[],[],zeros(1,size(Ctr{ii},2)),[],[]));
end
    errall_ga_mae{ii}=median(tmm);
toc
if ii==2000
  save('errall_ga_maetill2000','errall_ga_mae')  
end
if ii==4000
  save('errall_ga_maetill4000','errall_ga_mae')  
end
if ii==6000
  save('errall_ga_maetill6000','errall_ga_mae')  
end


if ii==1000
  save('errall_ga_maetill1000','errall_ga_mae')  
end

end

save('errall_ga_mae8000','errall_ga_mae')