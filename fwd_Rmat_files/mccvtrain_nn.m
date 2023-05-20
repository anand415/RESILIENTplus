function [S_nn,errall_nn]=mccvtrain_nn(ii,Ctrain)
load Rmat_fwd.mat
load ../vocvalppb.mat

% rng default
C=Rmat_fwd;
d=vocvalppb;
kk=1;
CCtrain=Ctrain{ii};
for jj=1:min(length(CCtrain),2000)
Nind=CCtrain(jj,:);
allsetN=true(1,length(vocvalppb));allsetN(Nind)=0;
Ctr{jj}=Rmat_fwd([Nind],:);
dtr{jj}=vocvalppb([Nind]);

fun = @(x) (C*x'-d);
funga = @(x) sum(abs((Ctr{jj}*x'-dtr{jj})));


S_nn(jj,:)=lsqnonneg(Ctr{jj},dtr{jj});
errall_nn(jj,:)=fun(S_nn(jj,:));
end