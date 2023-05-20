function figzerosrc_nn(S_nn,Smed)

SS=S_nn{1,2};

Zs=(Smed{1,2}<=5e-2);
SSz=SS(:,Zs);
Nzs=find(~Zs);

% medmrae=median(SS(:,~Zs));
% iqqrmrae=iqr(SS(:,~Zs));


UL=max(SSz(:));
NN=500;
LL=-UL/(2*NN-1);
LL=0;
yl=[LL:1e-1:4e-1 1  UL+1];
yl=[LL:(UL-LL)/NN:UL];

% [sb(:,1),edg]=histcounts(s8_13c6(:,1),yl);
for ii=1:sum(Zs)
[sb(:,ii),edg]=histcounts(SSz(:,ii),yl);
end

% [sb(:,8),edg]=histcounts(SS(:,8),yl);

% YL=[0 yl(1:end-1)];
% h =bar3(sb,'grouped');

sbf=sb./length(SS);

cmap = hsv(19);
cmap2 = autumn(19);
figure(19);
for ii=1:sum(Zs)
hold on
cmsm(ii,:)=[0;cumsum(sbf(:,ii))];
plot(yl,cmsm(ii,:),'LineWidth',4,'color',cmap(ii,:));
end
x=[0,1];
y=[0.75,0.75];
line(x,y,'Linestyle','--','Linewidth',4,'color','blue')

x=[0,2];
y=[0.5,0.5];
line(x,y,'Linestyle','--','Linewidth',4,'color','blue')

% str1=        ';
% str2=;
ylabel({'Cumulative';'relative frequency'});
xlabel('Emission rate (g/s)');
% legend('S1','S2','S3','S4','S5','S6','S7','S8')

% Create xlabel
% xlabel('p');

% box(axes1,'on');
% Set the remaining axes properties
set(gca,'YTick',[0,0.2,0.4,0.5,0.6,0.75,0.9,1]);
set(gca,'YTickLabel',{'0','0.2','0.4','\color{blue} 0.5','0.6','\color{blue} 0.75','0.9','1'});

set(gca,'fontsize',20,'fontweight','bold');
% Create legend
ylim([0 1])
xlim([0 2])
set(gcf, 'Position', [100, 100, 800, 600])

a = findall(gcf,'Type','Line');
set(a,'Linewidth',4,'Markersize',20);

print('zero_src','-depsc')
copyfile('zero_src.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_05_28\chapter4\figsAPR\')

