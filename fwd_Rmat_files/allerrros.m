clear all;close all;
load ovrall_err_ga_mae_cumul.mat
load ovrall_err_ga_mrae_cumul.mat
load ovrall_err_nn_cumul.mat
load ovrall_err_PI_cumul.mat
load ovrall_err_ridge_cumul.mat

ovrall_err_nn_trainLst=ovrall_err_nn_trainA(end);
ovrall_err_ga_mae_trainLst=ovrall_err_ga_mae_trainA(end);
ovrall_err_ga_mrae_trainLst=ovrall_err_ga_mrae_trainA(end);
ovrall_err_PI_trainLst=ovrall_err_PI_trainA(end);
ovrall_err_ridge_trainLst=ovrall_err_ridge_trainA(end);


ovrall_err_nn_testLst=ovrall_err_nn_testA(end);
ovrall_err_ga_mae_testLst=ovrall_err_ga_mae_testA(end);
ovrall_err_ga_mrae_testLst=ovrall_err_ga_mrae_testA(end);
ovrall_err_PI_testLst=ovrall_err_PI_testA(end);
ovrall_err_ridge_testLst=ovrall_err_ridge_testA(end);



% plot(ovrall_err_ridge_testA(1:20:500),'r','Marker','diamond','MarkerSize',16);hold on;plot(ovrall_err_ridge_trainA(1:20:500),'b','Marker','diamond');
% plot(ovrall_err_PI_testA(1:20:500),'r','Marker','o','MarkerSize',16);hold on;plot(ovrall_err_PI_trainA(1:20:500),'b','Marker','o');
plot([1:20:500],ovrall_err_nn_testA(1:20:500),'r','Marker','diamond','MarkerSize',16,'displayname','NNMSE-Test');hold on;plot([1:20:500],ovrall_err_nn_trainA(1:20:500),'b','Marker','diamond','MarkerSize',16,'DisplayName','NNMSE-Training');
plot([1:20:500],ovrall_err_ga_mae_testA(1:20:500),'r','Marker','*','MarkerSize',16,'DisplayName','MAE-Test');hold on;plot([1:20:500],ovrall_err_ga_mae_trainA(1:20:500),'b','Marker','*','MarkerSize',16,'DisplayName','MAE-Training');
plot([1:20:500],ovrall_err_ga_mrae_testA(1:20:500),'r','Marker','o','MarkerSize',16,'DisplayName','MRAE-Test');hold on;plot([1:20:500],ovrall_err_ga_mrae_trainA(1:20:500),'b','Marker','o','MarkerSize',16,'DisplayName','MRAE-Training');

LLI=legend;
ylabel({'Mean error'});
xlabel('Total number of trials');
set(gca,'fontsize',20,'fontweight','bold');
% Create legend
% ylim([0 1])
% xlim([0 2])
set(gcf, 'Position', [100, 100, 1000, 800])

set(LLI,...
    'Position',[0.590333338995774 0.468541673595707 0.240999994337559 0.24062499307096]);


print('mccv_aller','-depsc')
copyfile('mccv_aller.eps','D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures\')
copyfile('mccv_aller.eps','D:\Dropbox\Apps\Overleaf\APR_2020_05_22\For_figures\')
copyfile('mccv_aller.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_05_28\chapter4\figsAPR')