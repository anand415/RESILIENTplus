clear all;
close all;
load mccv_mrae_errs_QM_1000_2
% load mccv_partns_46c5_8000.mat
load sq3.mat
load xmrae
load ../vocvalppb.mat
load Rmat_fwd.mat
% Casctr=reshape(CCtrain,length(CCtest)*35,1);
% Cascts=reshape(CCtest,length(CCtest)*5,1);

% for ii=1:46
%    atr(ii)=sum(Casctr==ii);
% end
% 
% for ii=1:46
%    ats(ii)=sum(Cascts==ii);
% end


% SS=cell2mat(sq3)';

% C=Rmat_fwd;
% d=vocvalppb;

% for ii=1:10000
% SNN_fwd = lsqnonneg(C,d);
Zs=find(xmrae<0.05);

SSz=ga_mrae{1,8}(:,Zs);

UL=max(ga_mrae{1,8}(:));
NN=500;
LL=-UL/(2*NN-1);
LL=0;
yl=[LL:1e-1:4e-1 1  UL+1];
yl=[LL:(UL-LL)/NN:UL];

% [sb(:,1),edg]=histcounts(s8_13c6(:,1),yl);
for ii=1:length(Zs)
[sb(:,ii),edg]=histcounts(SSz(:,ii),yl);
end

% [sb(:,8),edg]=histcounts(SS(:,8),yl);

% YL=[0 yl(1:end-1)];
h =bar3(sb,'grouped');
% ,0.1);
set(gca,'YTick',(1:11),'YTickLabel',yl(1:11))

set(gca,'YTick',[1:200]...
,'YTickLabel',round(yl(1:end),2,'significant'));



% ytickformat('%.2f')
ylim([0 20]);
aa=[0:460:1200 1716];
set(gca,'ZTick',aa,'ZTickLabel',[0 0.23 0.47 0.7 1])
zlim([0 1716])
% ylim([LL 12])
ylabel('Emission rate (g/s)');
zlabel('Relative frequency')
xlabel('Sources')
view(gca,[275 0]);
set(gca,'FontSize',28,'FontWeight','bold')
% set(gca,'XTickLabel',{'S2','S3','S4','S5','S6','S7'},'FontSize',28)
% legend('S2','S3','S4','S5','S6','S7','location','northeast');
xtickangle(45)
ytickangle(45)
% set(gcf, 'Position', [ 10          34        980        980])
set(gcf, 'Position', [    46          50        1000        800])
grid off
% set(h(8),'facecolor','r');
% set(h(1),'facecolor','b');
% axesLabelsAlign3D
% 
% saveas(gcf,'s6_3d_hist_grouped')
% print('s6_3d_hist_13c6','-depsc')