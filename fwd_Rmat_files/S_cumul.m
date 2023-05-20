clear all;close all;


load err_mccv_40c5_8000_nn.mat
load mccv_partns_40c5_8000.mat
load ../vocvalppb.mat
load Rmat_fwd.mat
Casctr=reshape(CCtrain,length(CCtest)*35,1);
Cascts=reshape(CCtest,length(CCtest)*5,1);

for ii=1:40
   atr(ii)=sum(Casctr==ii);
end

for ii=1:40
   ats(ii)=sum(Cascts==ii);
end


SS=cell2mat(S_nn)';

C=Rmat_fwd;
d=vocvalppb;

% for ii=1:10000
SNN_fwd = lsqnonneg(C,d);
Zs=(SNN_fwd<=1e-1);

SSz=SS(:,Zs);

UL=max(SSz(:));
NN=500;
LL=-UL/(2*NN-1);
LL=0;
yl=[LL:1e-1:4e-1 1  UL+1];
yl=[LL:(UL-LL)/NN:UL];

% [sb(:,1),edg]=histcounts(s8_13c6(:,1),yl);
for ii=1:20
[sb(:,ii),edg]=histcounts(SSz(:,ii),yl);
end

% [sb(:,8),edg]=histcounts(SS(:,8),yl);

% YL=[0 yl(1:end-1)];
% h =bar3(sb,'grouped');

sbf=sb./8000;
cmap = hsv(20);
cmap2 = autumn(20);
% cmap(4,:) = cmap2(4,:);

figure(1);
for ii=1:20
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
print('zero_src','-depsc')
copyfile('zero_src.eps','D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures\')

Nzs=find(~Zs);
for kj=1:15
        pc(kj,:)=prctile(SS(:,Nzs(kj)),[25 50 75]);
        IQR(kj)=(pc(kj,3)-pc(kj,1));
% 
%     subplot(3,5,kj)
%     histogram(SS(:,Nzs(kj)))
end

med=median(SS(:,~Zs));

load ../../src_36.mat
C=(colormap(jet(256)));

CU=round((IQR-min(IQR))*256/range(IQR));CU(CU<1)=1;

CU2=round((med-min(med))*256/range(med));CU2(CU2<1)=1;



nme = blanks(length(CU2)-1); 
nme = string(Nzs); 


nme2 = blanks(length(CU)-1);

   ltf=src_36(~Zs,1);
   lngf=src_36(~Zs,2);
   
icon='https://maps.google.com/mapfiles/kml/shapes/triangle.png';

kmlwritepoint('src_36_VAR',ltf,lngf,'IconScale', 4,'Icon',icon,'Color',C(round(CU),:),'Name',nme);winopen('src_36_VAR.kml')


kmlwritepoint('src_36_med',ltf,lngf,'IconScale', 4,'Icon',icon,'Color',C(round(CU2),:),'Name',nme);winopen('src_36_med.kml')


4





% end
% set(gca, 'XTick', unique([0.5, get(gca, set(gca,'XTick',[0,0.2,.4,0.5,0.6,0.8,1]);'XTick')]));
% set(gca,'YTickLabel',{'0','0.2','0.4','\color{blue} 0.5','0.6','\color{blue} 0.75','0.8','1'});