clear all;close all;
load mccv_sqp_mae_5kn.mat
load mccv_sqp_mse_5kn.mat
load mccv_sqp_mrae_5kn.mat
load mccv_sqp_mraeiqr_5k.mat
load mccv_sqp_msrae_5k.mat

%%
qcdd=@(x) (prctile(x,75)-prctile(x,25))./(2+(prctile(x,75)+prctile(x,25)));
qcd=@(x) (prctile(x,75)-prctile(x,25))./((prctile(x,75)+prctile(x,25)));
% qcdV = vectorize(qcd);
% qcddV = vectorize(qcdd);

for ii=6:20
   xx=sqp_mse{ii};
   
   mseallp(ii)=median(qcdd(cell2mat(xx')));
   mseallpMX(ii)=max(qcdd(cell2mat(xx')));

end
% xxmed10=median(S_nn{10});
% xxmed5=median(S_nn{5});


for ii=6:20
   yy=sqp_mae{ii};
   maeallp(ii)=median(qcdd(cell2mat(yy')));
   maeallpMX(ii)=max(qcdd(cell2mat(yy')));

end

for ii=6:20
   zz=sqp_mrae{ii};
   mraeallp(ii)=median(qcdd(cell2mat(zz')));
   mraeallpMX(ii)=max(qcdd(cell2mat(zz')));
end

for ii=6:20
   zz=sqp_mraeiqr{ii};
   mraeiqrallp(ii)=median(qcdd(cell2mat(zz')));
   mraeiqrallpMX(ii)=max(qcdd(cell2mat(zz')));
end

for ii=8:18
   zz=sqp_msrae{ii};
   msraeallp(ii)=median(qcdd(cell2mat(zz')));
   msraeallpMX(ii)=max(qcdd(cell2mat(zz')));
end

%%
figure(344)
%  hold off
 
%  plot(mseallp,'k','DisplayName','MSE','LineWidth',2,'Marker','diamond','MarkerSize',20);
% hold on;
% plot(maeallp,'m','DisplayName','MAE','LineWidth',2,'Marker','diamond','MarkerSize',20);
% plot(mraeallp,'r-','DisplayName','MRAE','LineWidth',2,'Marker','diamond','MarkerSize',20);
hold on;

 plot(mseallpMX,'k','DisplayName','MSE','LineWidth',2,'Marker','diamond','MarkerSize',20);
plot(maeallpMX,'m','DisplayName','MAE','LineWidth',2,'Marker','diamond','MarkerSize',20);
plot(msraeallpMX,'g','DisplayName','MRSE','LineWidth',2,'Marker','diamond','MarkerSize',20);
plot(mraeallpMX,'r','DisplayName','MRAE','LineWidth',2,'Marker','diamond','MarkerSize',20);
% plot(mraeiqrallpMX,'b','DisplayName','MRAEIQR','LineWidth',2,'Marker','diamond','MarkerSize',20);

% plot(mseallp,'k','DisplayName','MSE','LineWidth',2,'LineStyle','--','Marker','diamond','MarkerSize',20);
% % hold on;
% plot(maeallp,'m','DisplayName','MAE','LineWidth',2,'LineStyle','--','Marker','diamond','MarkerSize',20);
% plot(mraeallp,'r','DisplayName','MRAE','LineWidth',2,'LineStyle','--','Marker','diamond','MarkerSize',20);

%%
set(gcf, 'Position', [100, 100, 1000, 800])
ylabel(' Max QCD')
xlabel('p');
set(gca,'fontsize',24,'fontweight','bold');
set(gca,'XTick',[8:2:12 13 14:2:18]);
set(gca,'XTickLabel',{'8','10','12','\color{blue} 13','14','16','18'});
xlim([8 18])
a = findall(gcf,'Type','Line');
set(a,'Linewidth',4)
set(a,'Linewidth',4,'Markersize',20)
grid on

h=legend
set(h,'Location','northwest')
print('cost_allP','-depsc')
print('cost_allP','-dpng')
copyfile('cost_allP.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')



