% clear all;
close all;
% load mccv_mrae_errs_QM_1000_2
% load mccv_partns_46c5_8000.mat
load sq3.mat
load xmrae_sqp.mat
load mccv_sqp_mrae_5kn.mat
load ../vocvalppb.mat
load Rmat_fwd.mat
Zs=find(xmrae_sqp<=0.001);
mtt=cell2mat(sqp_mrae{1,18}');
% mtt=sqp_mrae{1,13};
SSz=mtt(:,Zs);
UL=max(SSz(:));
NN=500;
LL=-UL/(2*NN-1);
LL=0;
cmap = jet(length(Zs));
[xs,vf]=sort(prctile(SSz,75));

% yl=[LL:1e-1:4e-1 1  UL+1];
yl=[LL:(UL-LL)/NN:UL];

for ii=1:length(Zs)
[sb(:,ii),edg]=histcounts(SSz(:,vf(ii)),yl);
end

% [sb(:,8),edg]=histcounts(SS(:,8),yl);

% YL=[0 yl(1:end-1)];
% h =bar3(sb,'grouped');

sbf=sb./length(SSz);
SS_q3=prctile(SSz,75);
SS_q3srt=SS_q3(vf);
%%
%inactivesrc
AA=prctile(SSz,75);
figure(13233);
for ii=1:length(Zs)
hold on
cmsm(ii,:)=[0;cumsum(sbf(:,ii))];
if SS_q3srt(ii)>0.2
h1=plot(yl,cmsm(ii,:),'LineWidth',4,'color','r');
set(get(get(h1,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

else
h2=plot(yl,cmsm(ii,:),'LineWidth',4,'color','b');
set(get(get(h2,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

end
end
x=[0,1];
y=[0.75,0.75];
p1=line(x,y,'Linestyle','--','Linewidth',4,'color','blue');
set(get(get(p1,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

% x=[0,2];
% y=[0.5,0.5];
% line(x,y,'Linestyle','--','Linewidth',3,'color','blue')
x=[0.2,0.2];
y=[0,1];
p1=line(x,y,'Linestyle',':','Linewidth',4,'color','k');
set(get(get(p1,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

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

set(gca,'XTick',[0,0.2,0.5,1,1.5,2]);
set(gca,'XTickLabel',{'0','\color{red} 0.2','0.5','1','1.5','2'});
set(get(get(h1,'Annotation'),'LegendInformation'),'IconDisplayStyle','on');
set(get(get(h2,'Annotation'),'LegendInformation'),'IconDisplayStyle','on');
legend
legend('Reliable','Unreliable','Position',[0.402083333333333 0.449333333333333 0.20999999564141 0.132999996304512])

set(gca,'fontsize',20,'fontweight','bold');
% Create legend
ylim([0 1])
xlim([0 1.5])
set(gcf, 'Position', [100, 100, 800, 500])
% print('zero_src','-depsc')
% print('zero_src','-dpng')
% copyfile('zero_src.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')
%%
% activesrc
figure(8788);
hold on

%     h = bar(a,diag(b),'stacked');
% h=bar(qcd_ss,'FaceColor','r');

bds=find(qcd_ss>0.35);
% set(h(bds),'facecolor','r')
% h.CData(2,:)=[1 1 0] ;

for ii = 1:length(qcd_ss)
    if ~ismember(ii,bds)
    h1=bar(ii,qcd_ss(ii));
    set(h1,'FaceColor','b');
    set(get(get(h1,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
    else
            h2=bar(ii,qcd_ss(ii));
    set(h2,'FaceColor','r');
    set(get(get(h2,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
    end
end
set(get(get(h1,'Annotation'),'LegendInformation'),'IconDisplayStyle','on');
set(get(get(h2,'Annotation'),'LegendInformation'),'IconDisplayStyle','on');

p=line([0 21],[0.33 0.33],'Linestyle','--','Linewidth',3,'color','k');
set(get(get(p,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

p=line([0 21],[0.25 0.25],'Linestyle',':','Linewidth',3,'color','k');
set(get(get(p,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

p=line([0 21],[0.5 0.5],'Linestyle',':','Linewidth',3,'color','k');
set(get(get(p,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');


ll=legend('Unreliable','Reliable','Location','northwest','Fontsize',17);
set(ll,...
    'Position',[0.153333333231054 0.715666686780525 0.20124999590218 0.12099999666214],...
    'FontSize',17);

ylabel({'QCD'});
xlabel('Source number');
% legend('S1','S2','S3','S4','S5','S6','S7','S8')

% Create xlabel
% xlabel('p');

% box(axes1,'on');
% Set the remaining axes properties
set(gca,'XTick',1:21);
set(gca,'XTickLabel',actvind,'XTickLabelRotation',90);

set(gca,'YTick',[0,0.25,0.33,0.5,]);
set(gca,'YTickLabel',{'0','\color{blue} 0.25','\color{blue} 0.33','\color{blue} 0.5'});

set(gca,'fontsize',20,'fontweight','bold');
% Create legend
ylim([0 0.55])
% xlim([0 2])
set(gcf, 'Position', [100, 100, 800, 500])
% print('actv_src','-depsc')
% print('actv_src','-dpng')
% copyfile('actv_src.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')
%%
%i have ignored this figure
nZs=find(xmrae>0.1);

SSnz=xgamraemin5{1,15}(:,nZs);
UL=max(SSnz(:));
NN=500;
LL=-UL/(2*NN-1);
LL=0;
cmap = jet(length(nZs));

% yl=[LL:1e-1:4e-1 1  UL+1];
yl=[LL:(UL-LL)/NN:UL];
[xs,vf]=sort(prctile(SSnz,75));
for ii=1:length(nZs)
[sb(:,ii),edg]=histcounts(SSnz(:,vf(ii)),yl);
end

% [sb(:,8),edg]=histcounts(SS(:,8),yl);

% YL=[0 yl(1:end-1)];
% h =bar3(sb,'grouped');

sbf=sb./length(SSnz);

figure(1555);
hold on
cmsm=[];
badd=actvind(qcd_ss>0.42);
% badsrt=bad(vf);
for ii=1:length(nZs)
cmsm(ii,:)=[0;cumsum(sbf(:,ii))];
if ismember(ii,badd)
    ii
plot(yl,cmsm(ii,:),'k--','LineWidth',4);
else
plot(yl,cmsm(ii,:),'LineWidth',4,'color',cmap(ii,:));
end
hold on

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
% xlim([0 2])
set(gcf, 'Position', [100, 100, 800, 500])
% print('nonzero_src','-depsc')
% print('nonzero_src','-dpng')
% copyfile('nonzero_src.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')

