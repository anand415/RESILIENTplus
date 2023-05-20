clear all;
load allcomp;
close all;

plot(tm_mrae*50,'k','DisplayName','RESILIENT+ using GA','LineWidth',2,'Marker','square','MarkerSize',20,'MarkerFaceColor','k');
hold on;
plot(tm_sqp*5,'b','DisplayName','RESILIENT+ using SQP','LineWidth',2,'Marker','diamond','MarkerSize',20,'MarkerFaceColor','b');
set(gca, 'YScale', 'log')

xlabel({'p'});
ylabel('Computation time (s)');
set(gca,'fontsize',20,'fontweight','bold');
% Create legendc
legend

ylim([10^2 10^7])
xlim([7.9 18.1])
set(gcf, 'Position', [100, 100, 500, 400])
savefig('allcomp')

print('allcomp','-dpng')
print('allcomp','-depsc')

copyfile('allcomp.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')