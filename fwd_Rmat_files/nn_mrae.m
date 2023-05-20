% lnn=8
% tic
% leav=[1:lnn];
for ii=[3:26]       
[S_nn{ii},errall_nn{ii}]=mccvtrain_nn(ii,CCtrain);  
[ovrall_err_nn_train(ii),ovrall_err_nn_test(ii)]=mccvtest_mse(ii,errall_nn{ii},CCtrain,CCtest);  
end
% toc
% figure(2)
% plot(leav,ovrall_err_nn_train,'r-*','DisplayName','NN-Train');
% hold on
% plot(leav,ovrall_err_nn_test,'r','Marker','diamond','DisplayName','NN-Test');
% 


lnn=8;
leav=[1:lnn];
load mccv_partns_5000nn.mat
for ii=[12:18]       
% [S_mrae{ii},errall_mrae{ii}]=mccvtrain_mrae_AS(ii,CCtrain);  
[ovrall_err_ga_mrae5k_trainn(ii),ovrall_err_ga_mrae5k_testn(ii)]=mccvtest_mrae(ii,errall_S_mrae{ii},CCtrain,CCtest);  
end
S_mrae5k=S_mrae;
errall_mrae5k=errall_mrae;
toc
plot(leav,ovrall_err_ga_mrae_train,'b-*','DisplayName','MRAE-AS');
hold on
plot(leav,ovrall_err_ga_mrae_test,'b','Marker','diamond','DisplayName','MRAE-AS');

load mccv_partns_1000nn.mat
for ii=[11:14]       
[S_mae{ii},errall_mae{ii}]=mccvtrain_mae_AS(ii,CCtrain);  
% [ovrall_err_ga_mae1k_trainn(ii),ovrall_err_ga_mae1k_testn(ii)]=mccvtest_mae(ii,errall_mae{ii},CCtrain,CCtest);  
end



A=S_nn{1,4};
iqA=iqr(A);

B=ga_mrae{1,4};
iqB=iqr(B);