function [xgamn10,errall_ga_mraemn10,xgamin10,errall_ga_mraemin10,xgamn5,errall_ga_mraemn5,xgamin5,errall_ga_mraemin5,...
    xga1,errall_ga_mrae1]=tmpmccvtrain_mrae(ii,xgaall,Ctrain)
load Rmat_fwd.mat
load ../vocvalppb.mat
% rng default
C=Rmat_fwd;d=vocvalppb;kk=1;
CCtrain=Ctrain{ii};
for jj=1:length(CCtrain)
Nind=CCtrain(jj,:);
allsetN=true(1,length(vocvalppb));allsetN(Nind)=0;
Ctr{jj}=Rmat_fwd([Nind],:);
dtr{jj}=vocvalppb([Nind]);
% rng(2,'twister')
% 
% options = optimoptions('ga');
% options = optimoptions(options,'UseVectorized', true);
fun = @(x) (C*x'-d);
funga = @(x) 100*sum(abs((Ctr{jj}*x'-dtr{jj})./dtr{jj}));
% 
% for uu=1:10
%     [xga(uu,:),fval(uu)]=(ga(funga,size(Ctr{jj},2),[],[],[],[],zeros(1,size(Ctr{jj},2)),[],[],options));
% end
% xgaall{jj}=xga;
% 
xgal=xgaall{ii};
xga10=xgal{jj};
for uu=1:10
   fval(uu)=funga(xga10(uu,:));
end

[vl,ind]=min(fval);
xgamn10(jj,:)=median(xga10);
xgamin10(jj,:)=(xga10(ind,:));

xga5=xga10(1:5,:);
[vl,ind]=min(fval(1:5));
xgamn5(jj,:)=median(xga5);
xgamin5(jj,:)=(xga5(ind,:));
xga1(jj,:)=(xga5(1,:));

tmm=fun(xgamn10(jj,:));
    errall_ga_mraemn10(jj,:)=tmm;
    
    
    tmm=fun(xgamin10(jj,:));
    errall_ga_mraemin10(jj,:)=tmm;
    
    
    tmm=fun(xgamn5(jj,:));
    errall_ga_mraemn5(jj,:)=tmm;
    
    
    tmm=fun(xgamin5(jj,:));
    errall_ga_mraemin5(jj,:)=tmm;
    
       tmm=fun(xga1(jj,:));
    errall_ga_mrae1(jj,:)=tmm;
% toc

end