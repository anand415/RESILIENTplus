function figboxplt_mrae(S_mrae,Smed)


SS=S_mrae{1,2};

Zs=(Smed{3,2}<=5e-2);
SSz=SS(:,Zs);
Nzs=find(~Zs);

figure(32);

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

print('boxplt_mrae','-depsc')
print('boxplt_mrae','-dpng')

copyfile('boxplt_mrae.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_05_28\chapter4\figsAPR')