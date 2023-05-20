clear all;
close all;
load mccv_partns_5000nn.mat
load mccv_sqp_mrae_5kn.mat

tic
rng default
lnn=13;
leav=[1:lnn];
%%
for ii=6:20
    ii
% [sqp_mrae{ii},errall_mrae{ii}]=mccvtrain_mrae_sqp(ii,CCtrain);  
[ovrall_err_sqp_mrae5k_trainn(ii),ovrall_err_sqp_mrae5k_testn(ii)]=mccvtest_mrae(ii,errall_mrae{ii},CCtrain,CCtest);  
end

save('mccv_sqp_mrae_5k','sqp_mrae','errall_mrae','ovrall_err_sqp_mrae5k_trainn','ovrall_err_sqp_mrae5k_testn')


% 