clear all;
close all;
load Rmat_fwd.mat
load ../vocvalppb.mat

C=Rmat_fwd;
d=vocvalppb;kk=1;
% VV=[1:length(vocvalppb)];
% [CCtest1]=nchoosek(VV,5);
% ff=round(rand(1,8000)*length(CCtest1));
% % CCtest=CCtest1(1:round(length(CCtest1)/4000):length(CCtest1),:);
% CCtest2=CCtest1(ff,:);
% for ii=1:length(CCtest2)
% 
% allset=true(1,length(vocvalppb));
% 
%     allset(CCtest2(ii,:))=0;
% [CCtrain(ii,:)]=VV(allset);
% 
% end
% 
% 
% CCtest=CCtest2(1:length(CCtrain),:);
% Casctr=reshape(CCtrain,length(CCtest)*(length(vocvalppb)-5),1);
% Cascts=reshape(CCtest,length(CCtest)*5,1);
% 
% 
% for ii=1:40
%    atr(ii)=sum(Casctr==ii);
% end
% 
% for ii=1:40
%    ats(ii)=sum(Cascts==ii);
% end
% options = optimoptions('ga','MaxGenerations', 5000,'FunctionTolerance',1e-6);

% save('mccv_partns_40c5_8000','CCtrain','CCtest')

load mccv_partns_40c5_8000.mat
for ii=1:length(CCtrain)
    
ii
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
save('err_mccv_40c5_8000_nn','errall_nn','S_nn')