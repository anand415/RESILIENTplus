clear all;close all
load mccv_sqp_mrae_5kn.mat;

yyaxis right
plot(ovrall_err_sqp_mrae5k_testn,'DisplayName','MRAE-Test','LineWidth',2,'Marker','square','MarkerSize',28,'MarkerFaceColor','k')
xlim([7.97 18.03])
ylim([0.55 0.64])

yyaxis left
plot(ovrall_err_sqp_mrae5k_trainn,'DisplayName','MRAE-Training','LineWidth',2,'Marker','diamond','MarkerSize',28,'MarkerFaceColor','k')
hold on
ylim([0.2 0.32])


ylabel({'Med-RAE'});
xlabel('p');
set(gca,'fontsize',24,'fontweight','bold');
% ylim([0.2 0.7])

% xlim([0 2])
a = findall(gcf,'Type','Line');
set(a,'Linewidth',4)
set(a,'Linewidth',4,'Markersize',20)
annotation(gcf,'ellipse',[0.493 0.30375 0.045 0.07375],'Color',[1 0 1],...
    'LineWidth',3);
set(gcf, 'Position', [100, 100, 1000, 800])
set(gca,'xTick',[8:18]);
set(gca,'xTickLabel',{'8','9','10','11','12','\color{blue} 13','14','15','16','17','18'});

legend
savefig('mccv_allP_mrae')
print('mccv_allP_mrae','-depsc')
print('mccv_allP_mrae','-dpng')
copyfile('mccv_allP_mrae.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')