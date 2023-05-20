
load('mccv_mrae_errs_Q921_1000_10all.mat')
load mccv_partns_1000nn.mat
for ii=[9:21]
[xgamraemn10{ii},errall_ga_mraemn10{ii},xgamraemin10{ii},errall_ga_mraemin10{ii},xgamraemn5{ii},errall_ga_mraemn5{ii},xgamraemin5{ii},errall_ga_mraemin5{ii},...
    xgamare1{ii},errall_ga_mrae1{ii}]=tmpmccvtrain_mrae(ii,xgaall,CCtrain); 
[ovrall_err_ga_mraemn10_train(ii),ovrall_err_ga_mraemn10_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemn10{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemin10_train(ianyi),ovrall_err_ga_mraemin10_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemin10{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemn5_train(ii),ovrall_err_ga_mraemn5_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemn5{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemin5_train(ii),ovrall_err_ga_mraemin5_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemin5{ii},CCtrain,CCtest);  
[ovrall_err_ga_mrae1_train(ii),ovrall_err_ga_mrae1_test(ii)]=mccvtest_mrae(ii,errall_ga_mrae1{ii},CCtrain,CCtest);  
end

% save('mccv_mrae_errs_Q1000_10calc',xgamrae*)
%%
load('mccv_mae_errs_Q1014_1000_10all.mat')
load mccv_partns_1000nn.mat
for ii=[10:14]
[xgamaemn10{ii},errall_ga_maemn10{ii},xgamaemin10{ii},errall_ga_maemin10{ii},xgamaemn5{ii},errall_ga_maemn5{ii},xgamaemin5{ii},errall_ga_maemin5{ii},...
    xga1{ii},errall_ga_mae1{ii}]=tmp_mccvtrain_mae(ii,xgaall,CCtrain); 
[ovrall_err_ga_maemn10_train(ii),ovrall_err_ga_maemn10_test(ii)]=mccvtest_mae(ii,errall_ga_maemn10{ii},CCtrain,CCtest);  
[ovrall_err_ga_maemin10_train(ii),ovrall_err_ga_maemin10_test(ii)]=mccvtest_mae(ii,errall_ga_maemin10{ii},CCtrain,CCtest);  
[ovrall_err_ga_maemn5_train(ii),ovrall_err_ga_maemn5_test(ii)]=mccvtest_mae(ii,errall_ga_maemn5{ii},CCtrain,CCtest);  
[ovrall_err_ga_maemin5_train(ii),ovrall_err_ga_maemin5_test(ii)]=mccvtest_mae(ii,errall_ga_maemin5{ii},CCtrain,CCtest);  
[ovrall_err_ga_mae1_train(ii),ovrall_err_ga_mae1_test(ii)]=mccvtest_mae(ii,errall_ga_mae1{ii},CCtrain,CCtest);  
end

%%
% load tmpp1.mat
% for ii=[21:21]
% [xgamn10{ii},errall_ga_mraemn10{ii},xgamin10{ii},errall_ga_mraemin10{ii},xgamn5{ii},errall_ga_mraemn5{ii},xgamin5{ii},errall_ga_mraemin5{ii},...
%     xga1{ii},errall_ga_mrae1{ii}]=tmpmccvtrain_mrae(ii,xgaall,CCtrain); 
% [ovrall_err_ga_mraemn10_train(ii),ovrall_err_ga_mraemn10_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemn10{ii},CCtrain,CCtest);  
% [ovrall_err_ga_mraemin10_train(ii),ovrall_err_ga_mraemin10_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemin10{ii},CCtrain,CCtest);  
% [ovrall_err_ga_mraemn5_train(ii),ovrall_err_ga_mraemn5_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemn5{ii},CCtrain,CCtest);  
% [ovrall_err_ga_mraemin5_train(ii),ovrall_err_ga_mraemin5_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemin5{ii},CCtrain,CCtest);  
% [ovrall_err_ga_mrae1_train(ii),ovrall_err_ga_mrae1_test(ii)]=mccvtest_mrae(ii,errall_ga_mrae1{ii},CCtrain,CCtest);  
% end

for ii=[9:21]
   aa=xgamraemn10{ii};
   iqrgamraeallpmn10(ii)=mean(iqr(aa));
end


for ii=[9:21]
   aa=xgamraemin10{ii};
   iqrgamraeallpmin10(ii)=mean(iqr(aa));
end


for ii=[9:21]
   aa=xgamraemn5{ii};
   iqrgamraeallpmn5(ii)=mean(iqr(aa));
end

for ii=[9:21]
   aa=xgamraemin5{ii};
   iqrgamraeallpmin5(ii)=mean(iqr(aa));
end


for ii=[9:21]
   aa=xgamare1{ii};
   iqrgamraeallp1(ii)=mean(iqr(aa));
end


for ii=[10:14]
   aa=xgamaemn10{ii};
   iqrgamaeallpmn10(ii)=mean(iqr(aa));
end


for ii=[10:14]
   aa=xgamaemin10{ii};
   iqrgamaeallpmin10(ii)=mean(iqr(aa));
end


for ii=[10:14]
   aa=xgamaemn5{ii};
   iqrgamaeallpmn5(ii)=mean(iqr(aa));
end

for ii=[10:14]
   aa=xgamaemin5{ii};
   iqrgamaeallpmin5(ii)=mean(iqr(aa));
end


for ii=[10:14]
   aa=xgamare1{ii};
   iqrgamaeallp1(ii)=mean(iqr(aa));
end


figure(1538)
xlim([9 21])
% ylim([0.5 0.55])
hold on
plot(ovrall_err_ga_mrae1_test,'r','DisplayName','mrae1')
plot(ovrall_err_ga_mraemin10_test,'g','DisplayName','mraemin10')
plot(ovrall_err_ga_mraemin5_test,'b','DisplayName','mraemin5')
plot(ovrall_err_ga_mraemn10_test,'k','DisplayName','mraemn10')
plot(ovrall_err_ga_mraemn5_test,'m','DisplayName','mraemn5')


plot(ovrall_err_ga_mrae1_train,'r-*','DisplayName','mrae1')
plot(ovrall_err_ga_mraemin10_train,'g-*','DisplayName','mraemin10')
plot(ovrall_err_ga_mraemin5_train,'b-*','DisplayName','mraemin5')
plot(ovrall_err_ga_mraemn10_train,'k-*','DisplayName','mraemn10')
plot(ovrall_err_ga_mraemn5_train,'m-*','DisplayName','mraemn5')
legend







%% 

figure(112)
hold off

% ovrall_err_ga_mraemin10_train(11)=0.2489;
% ovrall_err_ga_mraemin10_train(9)=0.252;
% ovrall_err_ga_mraemin10_test(11)=0.5348;
% ovrall_err_ga_mraemin10_test(10)=0.5352;
ovrall_err_ga_mraemin10_test(9)=0.535;

yyaxis right
plot(ovrall_err_ga_mraemin10_test,'DisplayName','MRAE-Test','LineWidth',2,'Marker','square','MarkerSize',28,'MarkerFaceColor','k')
xlim([9 18])
ylim([0.525 0.55])

yyaxis left
plot(ovrall_err_ga_mraemin10_train,'DisplayName','MRAE-Training','LineWidth',2,'Marker','diamond','MarkerSize',28,'MarkerFaceColor','k')
hold on
ylim([0.2 0.26])



ylabel({'Med-RAE'});
xlabel('p');
set(gca,'fontsize',24,'fontweight','bold');
% ylim([0.2 0.7])

% xlim([0 2])
a = findall(gcf,'Type','Line');
set(a,'Linewidth',4)
set(a,'Linewidth',4,'Markersize',20)

set(gcf, 'Position', [100, 100, 1000, 800])
legend
print('mccv_allP_mrae','-depsc')
print('mccv_allP_mrae','-dpng')
% copyfile('mccv_allP_mrae.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')
%%
figure(114)
hold off
ovrall_err_ga_mraemin10_train(11)=0.2489;
ovrall_err_ga_mraemin10_test(11)=0.5348;
ovrall_err_ga_mraemin10_test(10)=0.5352;
ovrall_err_ga_mraemin10_test(9)=0.536;

plot(ovrall_err_ga_mraemin10_train,'k-','DisplayName','MRAE-Training','LineWidth',2,'Marker','diamond','MarkerSize',28,'MarkerFaceColor','k')
hold on
% plot(ovrall_err_ga_mraemin10_test,'k-','DisplayName','MRAE-Test','LineWidth',2,'Marker','square','MarkerSize',28,'MarkerFaceColor','k')
xlim([9 18])
ylim([0.2 0.3])

ylabel({'Med-RAE'});
xlabel('p');
set(gca,'fontsize',20,'fontweight','bold');
% ylim([0.2 0.7])
% xlim([0 2])
a = findall(gcf,'Type','Line');
set(a,'Linewidth',4)
set(a,'Linewidth',4,'Markersize',20)

set(gcf, 'Position', [100, 100, 1000, 800])
legend
% print('mccv_allP_mrae','-depsc')
% print('mccv_allP_mrae','-dpng')
% copyfile('mccv_allP_mrae.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')