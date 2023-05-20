clear all;
rng default
tic;ll=1;
for ss=[1:6]
    ss
[Ctest]=combnk([1:47],ss);

clear CCCtest Ctrain

if (ss>2)
Ctrain=zeros(500,47-ss);
CCCtest=zeros(500,ss);
end
Ctestr=Ctest(randi(length(Ctest),1,length(Ctest)),:);
kk=1;
for ii=1:max(floor(length(Ctestr)/1000),1):length(Ctestr)
    if kk<=1000
    tmpp=[1:47];
    CCCtest(kk,:)=Ctestr(ii,:);
    Ctrain(kk,:)=tmpp(~ismember(tmpp,Ctestr(ii,:)));kk=kk+1;
    end
end
CCtrain{ll}=Ctrain;
CCtest{ll}=CCCtest;ll=ll+1;
toc
end
ll=7;
for ii=1:500
   A(ii,:)=randperm(47); 
end

for ss=[7:40]
CCtrain{ll}=A(:,1:47-ss);CCtest{ll}=A(:,47-ss+1:47);ll=ll+1;
end

    save('mccv_partns_500nn','CCtrain','CCtest')

