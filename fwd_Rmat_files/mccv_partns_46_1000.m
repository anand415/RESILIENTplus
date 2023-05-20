clear all;
rng default
tic;ll=1;
for ss=[1:6]
    ss
[Ctest]=combnk([1:46],ss);

clear CCCtest Ctrain

if (ss>2)
Ctrain=zeros(1000,46-ss);
CCCtest=zeros(1000,ss);
end
kk=1;
for ii=1:max(floor(length(Ctest)/1000),1):length(Ctest)
    if kk<=1000
    tmpp=[1:46];
    CCCtest(kk,:)=Ctest(ii,:);
    Ctrain(kk,:)=tmpp(~ismember(tmpp,Ctest(ii,:)));kk=kk+1;
    end
end
CCtrain{ll}=Ctrain;
CCtest{ll}=CCCtest;ll=ll+1;
toc
end

for ii=1:1000
   A(ii,:)=randperm(46); 
end

for ss=[7:15]
CCtrain{ll}=A(:,1:46-ss);CCtest{ll}=A(:,46-ss+1:46);ll=ll+1;
end

    save('mccv_partns_1000nn','CCtrain','CCtest')

