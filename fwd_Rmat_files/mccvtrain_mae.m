function [xgamn,errall_ga_mae,xgaall]=mccvtrain_mae(ii,Ctrain)
load Rmat_fwd.mat
load ../vocvalppb.mat
% rng default
C=Rmat_fwd;d=vocvalppb;kk=1;
CCtrain=Ctrain{ii};
for jj=1:min(length(CCtrain),2000)
Nind=CCtrain(jj,:);
allsetN=true(1,length(vocvalppb));allsetN(Nind)=0;
Ctr{jj}=Rmat_fwd([Nind],:);
dtr{jj}=vocvalppb([Nind]);
rng(2,'twister')

options = optimoptions('ga');
options = optimoptions(options,'UseVectorized', true);
fun = @(x) (C*x'-d);
funga = @(x) sum(abs((Ctr{jj}*x'-dtr{jj})));

for uu=1:10
    [xga(uu,:),fval(uu)]=(ga(funga,size(Ctr{jj},2),[],[],[],[],zeros(1,size(Ctr{jj},2)),[],[],options));
end
xgaall{jj}=xga;
% [vl,ind]=min(fval);
xgamn(jj,:)=median(xga);
tmm=fun(xgamn(jj,:));
    errall_ga_mae(jj,:)=tmm;
toc

end