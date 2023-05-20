clear all;close all;
load mccv_sqp_mae_5kn.mat
load mccv_sqp_mse_5kn.mat
load mccv_sqp_mrae_5kn.mat
load mccv_sqp_msrae_5k.mat
load mccv_sqp_mraeiqr_5k.mat
%%

for ii=3:20
   xx=sqp_mse{ii};
   mseallp(ii)=median(iqr(cell2mat(xx')));
end
% xxmed10=median(S_nn{10});
% xxmed5=median(S_nn{5});


for ii=3:20
   yy=sqp_mae{ii};
   maeallp(ii)=median(iqr(cell2mat(yy')));
end

for ii=3:20
   zz=sqp_mrae{ii};
   mraeallp(ii)=median(iqr(cell2mat(zz')));
end

% for ii=3:20
%    zz=sqp_mraeiq{ii};
%    mraeallp(ii)=median(iqr(cell2mat(zz')));
% end

for ii=8:18
   zz=sqp_msrae{ii};
   msraeallp(ii)=median(iqr(cell2mat(zz')));
end

%%
figure(344)
%  hold off
 
 plot(mseallp,'k','DisplayName','MSE','LineWidth',2,'Marker','diamond','MarkerSize',20);
hold on;
plot(maeallp,'m','DisplayName','MAE','LineWidth',2,'Marker','diamond','MarkerSize',20);
plot(mraeallp,'r-','DisplayName','MRAE','LineWidth',2,'Marker','diamond','MarkerSize',20);
plot(msraeallp,'b-','DisplayName','MSRAE','LineWidth',2,'Marker','diamond','MarkerSize',20);

% plot(mseallp,'k','DisplayName','MSE','LineWidth',2,'LineStyle','--','Marker','diamond','MarkerSize',20);
% % hold on;
% plot(maeallp,'m','DisplayName','MAE','LineWidth',2,'LineStyle','--','Marker','diamond','MarkerSize',20);
% plot(mraeallp,'r','DisplayName','MRAE','LineWidth',2,'LineStyle','--','Marker','diamond','MarkerSize',20);

%%
set(gcf, 'Position', [100, 100, 1000, 800])
ylabel(' Average IQR')
xlabel('p');
set(gca,'fontsize',24,'fontweight','bold');
xlim([9 20])
a = findall(gcf,'Type','Line');
set(a,'Linewidth',4)
set(a,'Linewidth',4,'Markersize',20)

h=legend
set(h,'Location','northwest')
print('cost_allP','-depsc')
print('cost_allP','-dpng')
copyfile('cost_allP.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')



