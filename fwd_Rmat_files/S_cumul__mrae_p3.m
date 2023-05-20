% clear all;close all;


load mccv_mrae_errs_Q_1
load mccv_partns_40c10_8000.mat
load ../vocvalppb.mat
load Rmat_fwd.mat
rng default

C=Rmat_fwd;
d=vocvalppb;

funchk = @(x) (C*x'-vocvalppb);
fun = @(x) norm(C*x'-vocvalppb);
funmae = @(x) sum(abs(C*x'-vocvalppb));
funmrae = @(x) sum(abs(C*x'-vocvalppb)./vocvalppb);
% for ii=1:10000
% for ii=1:5
% % [xmae(ii,:),errmae(ii)] = ga(funmae,size(C,2),[],[],[],[],zeros(1,size(C,2)),[],[]);
% [xmrae1(ii,:),errmrae(ii)] = ga(funmrae,size(C,2),[],[],[],[],zeros(1,size(C,2)),[],[]);
% end


xmrae=median(xmrae1(1:2,:));

% xga=median(xga);


SS=ga_mrae{3};

Zs=(xmrae<=1e-2);

SSz=SS(:,Zs);


Nzs=find(~Zs);


medmae=median(SS(:,~Zs));
iqqrmae=iqr(SS(:,~Zs));


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
% cmap(4,:) = cmap2(4,:);

figure(3); boxplot(SS(:,~Zs),'Labels',string(Nzs),'symbol','')



xlabel({'Source Number'});
ylabel('Emission rate (g/s)');
% legend('S1','S2','S3','S4','S5','S6','S7','S8')

% Create xlabel
% xlabel('p');

% box(axes1,'on');
% Set the remaining axes properties

set(gca,'fontsize',20,'fontweight','bold');
% Create legend
ylim([0 12])
% xlim([0 2])
set(gcf, 'Position', [100, 100, 1200, 600])
print('boxplt_mae','-depsc')
copyfile('boxplt_mae.eps','D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures\')




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
% print('zero_src_mae','-depsc')
% copyfile('zero_src_mae.eps','D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures\')



load ../../src_36.mat
C=(colormap(jet(256)));

CU=round((iqqrmae-min(iqqrmae))*256/range(iqqrmae));CU(CU<1)=1;

% CU2=round((med-min(med))*256/range(med));CU2(CU2<1)=1;



nme = blanks(length(CU2)-1); 
nme = string(Nzs); 


nme2 = blanks(length(CU)-1);

   ltf=src_36(~Zs,1);
   lngf=src_36(~Zs,2);
   
icon='https://maps.google.com/mapfiles/kml/shapes/triangle.png';

% kmlwritepoint('src_36_ga_mae_VAR',ltf,lngf,'IconScale', 4,'Icon',icon,'Color',C(round(CU),:),'Name',nme);winopen('src_36_ga_mae_VAR.kml')
% 
% 
% kmlwritepoint('src_36_ga_mae_med',ltf,lngf,'IconScale', 4,'Icon',icon,'Color',C(round(CU2),:),'Name',nme);winopen('src_36_ga_mae_med.kml')

figure(5);
aa=imread('D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures\S_ga_mae_var.jpg');
imshow(imcrop(aa,[180,0,1700,1050]))
colorbar;colormap('jet')
caxis([min(iqqrmae) max(iqqrmae)])
set(gca,'fontsize',36,'fontweight','bold');
annotation(gcf,'textbox',...
    [0.899231046931409 0.935574963609898 0.0775198555956669 0.0611353711790391],...
    'String',{''},...
    'LineStyle','none',...
    'FontWeight','bold',...
    'FontSize',22,...
    'FitBoxToText','off');

% print('S_mae_var','-depsc')
% copyfile('S_mae_var.eps','D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures')




figure(16);
aa=imread('D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures\S_ga_mae_med.jpg');
imshow(imcrop(aa,[180,0,1700,1050]))
colorbar;colormap('jet')
caxis([min(med) max(med)])
set(gca,'fontsize',32,'fontweight','bold');
annotation(gcf,'textbox',...
    [0.899231046931409 0.935574963609898 0.175198555956669 0.0611353711790391],...
    'String',{'q (g/s)'},...
    'LineStyle','none',...
    'FontWeight','bold',...
    'FontSize',24,...
    'FitBoxToText','off');

% print('S_mae_med','-depsc')
% copyfile('S_mae_med.eps','D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures')



% end
% set(gca, 'XTick', unique([0.5, get(gca, set(gca,'XTick',[0,0.2,.4,0.5,0.6,0.8,1]);'XTick')]));
% set(gca,'YTickLabel',{'0','0.2','0.4','\color{blue} 0.5','0.6','\color{blue} 0.75','0.8','1'});