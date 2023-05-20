clear all;
rng default
tic;ll=1;
for ss=[1:6]
    ss
[Ctest]=combnk([1:44],ss);

clear CCCtest Ctrain

if (ss>2)
Ctrain=zeros(2000,44-ss);
CCCtest=zeros(2000,ss);
end
kk=1;
for ii=1:max(floor(length(Ctest)/2000),1):length(Ctest)
    if kk<=2000
    tmpp=[1:44];
    CCCtest(kk,:)=Ctest(ii,:);
    Ctrain(kk,:)=tmpp(~ismember(tmpp,Ctest(ii,:)));kk=kk+1;
    end
end
CCtrain{ll}=Ctrain;
CCtest{ll}=CCCtest;ll=ll+1;
toc
end

for ii=1:2000
   A(ii,:)=randperm(44); 
end

for ss=[7:15]
CCtrain{ll}=A(:,1:44-ss);CCtest{ll}=A(:,44-ss+1:44);ll=ll+1;
end

    save('mccv_partns_2000nn','CCtrain','CCtest')

