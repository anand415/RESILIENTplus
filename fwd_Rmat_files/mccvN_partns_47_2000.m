clear all;
rng default
tic;ll=1;


for jj=3:40
    clear a b
    for ii=1:500
    [a(ii,:),b(ii,:)]=dividerand(47,47-jj,jj);
    end
    CCtrain{jj}=a;
    CCtest{jj}=b;
end

    save('mccv_partns_500chk','CCtrain','CCtest')

