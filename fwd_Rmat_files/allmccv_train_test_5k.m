clear all;
close all;

load mccv_partns_5000nn.mat

tic
rng default
lnn=13;
leav=[1:lnn];
%%
for ii=6:20
    ii
[sqp_mrae{ii},errall_mrae{ii}]=mccvtrain_mrae_sqp(ii,CCtrain);  
[ovrall_err_sqp_mrae5k_trainn(ii),ovrall_err_sqp_mrae5k_testn(ii)]=mccvtest_mrae(ii,errall_mrae{ii},CCtrain,CCtest);  
end

save('mccv_sqp_mrae_5k','sqp_mrae','errall_mrae','ovrall_err_sqp_mrae5k_trainn','ovrall_err_sqp_mrae5k_testn')


% 
% for ii=8:25
%     ii
% [AS_mrae{ii},errall_mrae{ii}]=mccvtrain_mrae_AS(ii,CCtrain);  
% [ovrall_err_AS_mrae5k_trainn(ii),ovrall_err_AS_mrae5k_testn(ii)]=mccvtest_mrae(ii,errall_mrae{ii},CCtrain,CCtest);  
% end
% 
% save('mccv_AS_mrae_5k','AS_mrae','errall_mrae','ovrall_err_AS_mrae5k_trainn','ovrall_err_AS_mrae5k_testn')


for ii=6:20
    ii
[sqp_mae{ii},errall_mae{ii}]=mccvtrain_mae_sqp(ii,CCtrain);  
[ovrall_err_sqp_mae5k_trainn(ii),ovrall_err_sqp_mae5k_testn(ii)]=mccvtest_mae(ii,errall_mae{ii},CCtrain,CCtest);  
end

save('mccv_sqp_mae_5k','sqp_mae','errall_mae','ovrall_err_sqp_mae5k_trainn','ovrall_err_sqp_mae5k_testn')

for ii=6:20
    ii
[sqp_mse{ii},errall_mse{ii}]=mccvtrain_mse_sqp(ii,CCtrain);  
[ovrall_err_sqp_mse5k_trainn(ii),ovrall_err_sqp_mse5k_testn(ii)]=mccvtest_mse(ii,errall_mse{ii},CCtrain,CCtest);  
end

save('mccv_sqp_mse_5k','sqp_mse','errall_mse','ovrall_err_sqp_mse5k_trainn','ovrall_err_sqp_mse5k_testn')
%%
for ii=1:4
    ii
[sqp_mrae{ii},errall_mraeiqr{ii}]=mccvtrain_mraeiqr_sqp(ii,CCtrain);  
[ovrall_err_sqp_mraeiqr5k_trainn(ii),ovrall_err_sqp_mraeiqr5k_testn(ii)]=mccvtest_mraeiqr(ii,errall_mraeiqr{ii},CCtrain,CCtest);  
end
sqp_mraeiqr=sqp_mrae;
save('mccv_sqp_mraeiqr_5k','sqp_mraeiqr','errall_mraeiqr','ovrall_err_sqp_mraeiqr5k_trainn','ovrall_err_sqp_mraeiqr5k_testn')
%%

for ii=8:18
    ii
[sqp_msrae{ii},errall_msrae{ii}]=mccvtrain_msrae_sqp(ii,CCtrain);  
[ovrall_err_sqp_msrae5k_trainn(ii),ovrall_err_sqp_msrae5k_testn(ii)]=mccvtest_msrae(ii,errall_msrae{ii},CCtrain,CCtest);  
end

save('mccv_sqp_msrae_5k','sqp_msrae','errall_msrae','ovrall_err_sqp_msrae5k_trainn','ovrall_err_sqp_msrae5k_testn')




%%
% %%
% had not run this segment
% for ii=8:18
%     ii
% [sqp_mrae{ii},errall_mrae{ii}]=mccvtrain_mseN_sqp(ii,CCtrain);  
% [ovrall_err_sqp_mseN5k_trainn(ii),ovrall_err_sqp_mseN5k_testn(ii)]=mccvtest_mseN(ii,errall_mseN{ii},CCtrain,CCtest);  
% end
% 
% save('mccv_sqp_mseN_5k','sqp_mseN','errall_mseN','ovrall_err_sqp_mseN5k_trainn','ovrall_err_sqp_mseN5k_testn')
% 
