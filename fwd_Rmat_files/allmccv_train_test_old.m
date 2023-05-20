clear all;
close all;

load mccv_partns_1000nn.mat
% load 
% % load mccv_mae_errs_Q_1000M.mat
load mccv_mrae_errs_Q18_1000_2.mat
load mccv_mae_errs_QM_1000_2.mat 
load mccv_mae_errs_Q18_1000_3.mat
load mccv_mae_errs_Q913_1000_2.mat
load mccv_mse_errs_Q18_1000_2
% load mccv_mrae_errs_Q_500_5.mat
% load mccv_mrae_errs_Q_10it2
% load mccv_mrae_errs_Q_500_5
load mccv_mae_errs_Q113M_1000_2
load mccv_mrae_errs_Q79_1000_5.mat
load mccv_mrae_errs_Q310_1000_5.mat
tic
rng default
lnn=13
leav=[1:lnn];

for ii=[11:11]
[ga_mae{ii},errall_ga_mae{ii},xgaall]=mccvtrain_mae(ii,CCtrain); 

% [ovrall_err_ga_mae_train(ii),ovrall_err_ga_mae_test(ii)]=mccvtest_mae(ii,errall_ga_mae{ii},CCtrain,CCtest);  
end
% ovrall_err_ga_mae_test(1)=106;
% ovrall_err_ga_mae_test(4)=103.6;

save('mccv_mae_errs_Q1111_1000_10all','ga_mae','errall_ga_mae','xgaall')


for ii=[3:26]
[ga_mse{ii},errall_ga_mse{ii}]=mccvtrain_mse(ii,CCtrain); 

[ovrall_err_ga_mse_train(ii),ovrall_err_ga_mse_test(ii)]=mccvtest_mse(ii,errall_ga_mse{ii},CCtrain,CCtest);  
end
% save('mccv_mse_errs_Q18_1000_2','ga_mse','errall_ga_mse')


figure(1)
for ii=[20:20]
% [ga_mrae{ii},errall_ga_mrae{ii},xgaall{ii}]=mccvtrain_mrae(ii,CCtrain); 
[ovrall_err_ga_mrae_train(ii),ovrall_err_ga_mrae_test(ii)]=mccvtest_mrae(ii,errall_ga_mrae{ii},CCtrain,CCtest);  
end

% save('mccv_mrae_errs_Q1818_1000_10all','ga_mrae','errall_ga_mrae','xgaall')

for ii=[3:26]
% [ga_mrae{ii},errall_ga_mrae{ii}]=mccvtrain_mrae(ii,CCtrain); 
[ovrall_err_ga_mrae_trainn(ii),ovrall_err_ga_mrae_testn(ii)]=mccvtest_mrae(ii,errall_mrae{ii},CCtrain,CCtest);  
end

% ovrall_err_ga_mrae_test(1)=0.5567;
% ovrall_err_ga_mrae_test(6)=0.522134;
% ovrall_err_ga_mrae_test(7)=0.522144;

% ovrall_err_ga_mrae_test(9)=0.5245;

% save('mccv_mrae_errs_Q_500_5','ga_mrae','errall_ga_mrae')


plot(ovrall_err_ga_mrae_train,'k-','DisplayName','MRAE-Training','LineWidth',2,'Marker','diamond','MarkerSize',28,'MarkerFaceColor','k')
hold on
plot(ovrall_err_ga_mrae_test,'k-','DisplayName','MRAE-Test','LineWidth',2,'Marker','square','MarkerSize',28,'MarkerFaceColor','k')

plot(leav,ovrall_err_ga_mae_train,'m-*','DisplayName','MAE-Train')
hold on
plot(leav,ovrall_err_ga_mae_test,'m','Marker','diamond','DisplayName','MAE-Test')

plot(leav,ovrall_err_ga_mse_train,'m-*','DisplayName','MAE-Train')
hold on
plot(leav,ovrall_err_ga_mse_test,'m','Marker','diamond','DisplayName','MAE-Test')

% % 
for ii=[1:8]       
[S_nn{ii},errall_nn{ii}]=mccvtrain_nn(ii,CCtrain);  
[ovrall_err_nn_train(ii),ovrall_err_nn_test(ii)]=mccvtest(ii,errall_nn{ii},CCtrain,CCtest);  
end
% 
% 
% plot(leav,ovrall_err_nn_train,'b-*','DisplayName','NN-Train');
% hold on
% plot(leav,ovrall_err_nn_test,'b','Marker','diamond','DisplayName','NN-Test');
ylabel({'Med-RAE'});
xlabel('p');
set(gca,'fontsize',20,'fontweight','bold');
ylim([0.2 0.7])
% xlim([0 2])
a = findall(gcf,'Type','Line');
set(a,'Linewidth',4)
set(a,'Linewidth',4,'Markersize',20)

set(gcf, 'Position', [100, 100, 1000, 800])
legend
print('mccv_allP_mrae','-dpdf')
print('mccv_allP_mrae','-dpng')
copyfile('mccv_allP_mrae.pdf','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')


% save('mccv_allp_800','ovrall_err_ga_mae_test','ovrall_err_nn_test','ovrall_err_ga_mae_train','ovrall_err_nn_train')


% save('mccv_allp_200','ovrall_err_ga_mae_test','ovrall_err_nn_test','ovrall_err_ga_mae_train','ovrall_err_nn_train')