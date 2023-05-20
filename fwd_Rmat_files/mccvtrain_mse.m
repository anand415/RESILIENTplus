function [xgamn,errall_ga_mse]=mccvtrain_mse(ii,Ctrain)
load Rmat_fwd.mat
load ../vocvalppb.mat

% rng default
C=Rmat_fwd;
d=vocvalppb;
kk=1;
CCtrain=Ctrain{ii};
for jj=1:min(length(CCtrain),1000)
Nind=CCtrain(jj,:);
allsetN=true(1,length(vocvalppb));allsetN(Nind)=0;
Ctr{jj}=Rmat_fwd([Nind],:);
dtr{jj}=vocvalppb([Nind]);
rng(2,'twister')
options = optimoptions('ga');
fun = @(x) (C*x'-d);
funga = @(x) (norm((Ctr{jj}*x'-dtr{jj})));
for uu=1:10
    [xga(uu,:),fval(uu)]=(ga(funga,size(Ctr{jj},2),[],[],[],[],zeros(1,size(Ctr{jj},2)),[],[],options));
end
[vl,ind]=min(fval);

xgamn(jj,:)=(xga(ind,:));
tmm=fun(xgamn(jj,:));
    errall_ga_mse(jj,:)=tmm;
toc

end