clear all;
rng default
tic;ll=1;
for ss=[1:6]
    ss
[Ctest]=combnk([1:47],ss);

clear CCCtest Ctrain

if (ss>2)
Ctrain=zeros(5000,47-ss);
CCCtest=zeros(5000,ss);
end
kk=1;
for ii=1:max(floor(length(Ctest)/5000),1):length(Ctest)
    if kk<=5000
    tmpp=[1:47];
    CCCtest(kk,:)=Ctest(ii,:);
    Ctrain(kk,:)=tmpp(~ismember(tmpp,Ctest(ii,:)));kk=kk+1;
    end
end
CCtrain{ll}=Ctrain;
CCtest{ll}=CCCtest;ll=ll+1;
toc
end
ll=7;
for ii=1:5000
   A(ii,:)=randperm(47); 
end

for ss=[7:40]
CCtrain{ll}=A(:,1:47-ss);CCtest{ll}=A(:,47-ss+1:47);ll=ll+1;
end

    save('mccv_partns_5000nn','CCtrain','CCtest')

