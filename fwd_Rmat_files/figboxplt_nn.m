function figboxplt_nn(S_nn,Smed)


SS=S_nn{1,5};

Zs=(Smed{1,2}<=5e-2);
SSz=SS(:,Zs);
Nzs=find(~Zs);

figure(31);

boxplot(SS(:,:),'Labels',string([1:36]),'Symbol','')

set(findobj(gca,'type','line'),'linew',2)


xlabel({'Source Number'});
ylabel('Emission rate (g/s)');
% legend('S1','S2','S3','S4','S5','S6','S7','S8')

% Create xlabel
% xlabel('p');

% box(axes1,'on');
% Set the remaining axes properties

set(gca,'fontsize',22,'fontweight','bold');
% Create legend
ylim([0 8])
% xlim([0 2])
set(gcf, 'Position', [100, 100, 1200, 600])

print('boxplt_nn','-depsc')
print('boxplt_nn','-dpng')

copyfile('boxplt_nn.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_05_28\chapter4\figsAPR')