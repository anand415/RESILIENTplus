clear all;
close all;

load mccv_partns_2000nn.mat

tic
rng default
lnn=13;
leav=[1:lnn];

for ii=8:25
    ii
[AS_mrae{ii},errall_mrae{ii}]=mccvtrain_mrae_AS(ii,CCtrain);  
[ovrall_err_AS_mrae2k_trainn(ii),ovrall_err_AS_mrae2k_testn(ii)]=mccvtest_mrae(ii,errall_mrae{ii},CCtrain,CCtest);  
end



%%

