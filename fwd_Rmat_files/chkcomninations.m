clear all;
% close all;
load mccv_partns_5000nn.mat
leav=[1:12];

for ghj=[3:3]
Ctest=CCtest{ghj};
Ctrain=CCtrain{ghj};


Casctr=reshape(Ctrain,length(Ctest)*(47-leav(ghj)),1);
Cascts=reshape(Ctest,length(Ctest)*(leav(ghj)),1);
for ii=1:47
   atr(ii)=sum(Casctr==ii);
end

for ii=1:47
   ats(ii)=sum(Cascts==ii);
end

AQWS=CCtest{1,6};
% cs=zeros(820,820);
% 
for ii=1:5000
%     tic
    for jj=1:5000
        cs(ii,jj)=length(intersect(AQWS(ii,:),AQWS(jj,:)));
    end
%     toc
end

bs=reshape(cs,1,[]);
% [A,kl]=triu(ones(2000,2000),1);
A=triu(ones(5000,5000),1);
as=reshape(A,1,[]);
zs=bs(logical(as));
max(zs)    
end

