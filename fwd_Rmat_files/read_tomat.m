% clear all;
% flnm=dir('fwd_Rm*');
% rng default
% for ii=1:length(flnm)
%    Rmat_fwd(:,ii)=csvread(flnm(ii).name);
% end
% save('Rmat_fwd','Rmat_fwd');
%
%
% Rmat_fwd=Rmat_fwd(1:end,:);
% W{1}=eye(size(Rmat_fwd,2));
% for h=2:20;
%     Rf=Rmat_fwd*inv(W{h-1});
%     Hf=inv(Rf*W{h-1}*Rf');
%     %    Hf2=pinv(Rf*W{h-1}*Rf');
%     for ss=1:size(Rmat_fwd,2)
%         aa(h,ss)= Rf(:,ss)'*Hf*Rf(:,ss);
%     end
%     Wint=diag(aa(h,:));
%     W{h}=W{h-1}*((Wint))^(0.5);
%
%     Rf=Rmat_fwd*inv(W{h});
%     Hf=inv(Rf*W{h}*Rf');
%     for ss=1:size(Rmat_fwd,2)
%         aa1(h,ss)= Rf(:,ss)'*Hf*Rf(:,ss);
%     end
%     Wint1=diag(aa1(h,:));
% end

% Wmat=W{end};sum(diag(Wmat))
% Rphi=Rmat_fwd*inv(Wmat);
% Hphi=(Rmat_fwd*inv(Wmat)*Rmat_fwd');
% S=Rphi'*inv(Hphi);
%%
clear all;
load ../../src_36.mat
% load ../../obs_2020_02_26_sep.mat
load ../vocvalppb.mat
load Rmat_fwd.mat
C=Rmat_fwd;
d=vocvalppb;

%%
tic
Sdirect_fwd36=pinv(C)*d;
toc
%%
% Sdirect_fwdNC=Sdirect_fwd;

sridge=inv(C'*C+eye(36))*C'*d;

% for ii=1:10000
SNN_fwd = lsqnonneg(C,d);
ENN_fwd = norm(C*SNN_fwd - d);
% Edirect_fwd36 = (C*(Sdirect_fwd) - d);

Eridge_fwd = norm(C*(sridge) - d)/(47^0.5);

funchk = @(x) (C*x'-d);
funmse = @(x) norm(C*x'-d);
funmae = @(x) mean(abs(C*x'-d));
funmrae = @(x) mean(abs(C*x'-d)./d);
funmsrae = @(x) mean((abs(C*x'-d)./d).^2);


Sdirect_fwdNC36=Sdirect_fwd36;
Sdirect_fwdNC36(Sdirect_fwdNC36<0)=0;

options = optimoptions('fmincon');
options = optimoptions(options,'Display', 'off');
% options = optimoptions(options,'MaxFunctionEvaluations', 5000);
% options = optimoptions(options,'OptimalityTolerance', OptimalityTolerance_Data);
% options = optimoptions(options,'FunctionTolerance', OptimalityTolerance_Data);
% options = optimoptions(options,'Algorithm', 'active-set');


sridgeNC=sridge;
sridgeNC(sridgeNC<0)=0;
Eridge_fwdNC = norm(C*(sridgeNC) - d)/sqrt(length(d));

%%
% options = optimoptions('ga');
% for ii=1:3
% [xxga(ii,:),errga(ii)]= ga(fun,size(C,2),[],[],[],[],zeros(1,size(C,2)),[],[]);
% %
% %
% [xxmae(ii,:),errmae(ii)] = ga(funmae,size(C,2),[],[],[],[],zeros(1,size(C,2)),[],[]);
% [xxmrae(ii,:),errmrae(ii)] = ga(funmrae,size(C,2),[],[],[],[],zeros(1,size(C,2)),[],[]);
% end

%%
% xga=median(xxga);
% % xmae=median(xxmae);
% xxmrae1=xxmrae(1:3,:);
%
% errmrae1=errmrae(1:3);
% % [vl1,ind1]=min(errga);
% % [vl2,ind2]=min(errmae);
% [vl3,ind3]=min(errmrae1);
% xga=(xxga(ind1,:));
% xmae=(xxmae(ind2,:));
% xmrae=(xxmrae1(ind3,:));
% % xmrae10=(xxmrae(ind3,:));
% save('xmrae','xmrae','xxmrae','errmrae1')

%%
options = optimoptions('fmincon');
options = optimoptions(options,'Display', 'off');
%%
% options = optimoptions(options,'Algorithm', 'interior-point');
% tic
% [xmrae_intpoint,~,~,~,~,~,~] = ...
% fmincon(funmrae,ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
% toc
% options = optimoptions(options,'Algorithm', 'active-set');
% tic
% [xmrae_AS,fval1,exitflag,output,lambda,grad,hessian] = ...
% fmincon(funmrae,ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
%%

options = optimoptions(options,'Algorithm', 'sqp');
tic
% for ii=1:100
[xmrae_sqp,~,~,~,~,~,~] = ...
    fmincon(funmrae,ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
% end
toc
[xmae_sqp,~,~,~,~,~,~] = ...
    fmincon(funmae,ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
[xmse_sqp,~,~,~,~,~,~] = ...
    fmincon(funmse,ones(1,36),[],[],[],[],zeros(1,36),[],[],options);

[xmsrae_sqp,~,~,~,~,~,~] = ...
    fmincon(funmsrae,ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
% save('xmrae_sqp','xmrae_sqp')
save('xmsrae_sqp','xmsrae_sqp')
save('xmse_sqp','xmse_sqp')
save('xmae_sqp','xmae_sqp')

%%
% load allphi.mat

er_sqp_mrae=funchk(xmrae_sqp);
er_sqp_mae=funchk(xmae_sqp);
er_sqp_mse=funchk(xmse_sqp);
er_sqp_msrae=funchk(xmsrae_sqp);

errs(1,:)=er_sqp_mse;
errs(2,:)=er_sqp_mae;
errs(3,:)=er_sqp_mrae;
errs(4,:)=er_sqp_msrae;
%%
% errsfst(1)=mean(abs(er_ip)./d);
% errsfst(2)=mean(abs(er_AS)./d);
% errsfst(3)=mean(abs(er_sqp)./d);

% save('xmrae_sqp2','xmrae_sqp')
%     end
%%

er_PI36=funchk(Sdirect_fwd36');
er_PINC36=funchk(Sdirect_fwdNC36');
% er_mse=funchk(xga);
% er_mae=funchk(xmae);
% er_mrae=funchk(xmrae);
%
% errs(1,:)=Edirect_fwd;
% errs(2,:)=Edirect_fwdNC;
% errs(3,:)=Ephi_fwd;
% errs(4,:)=Ephi_fwdNC;
% errs(5,:)=er_PI36;
% errs(6,:)=er_PINC36;
% errs(7,:)=er_sqp_mse;
% errs(8,:)=er_sqp_mae;
% errs(9,:)=er_sqp_mrae;
%%

%%
% errs9=errs9';
% for ii=1:3
%     fprintf(fop,'%5.2f &  %5.2f & %5.2f & %5.2f & %5.2f & %5.2f &  %5.2f & %5.2f & %5.2f \\\\',errs9(ii,:));
%     fprintf(fop,'\n')
% end
%  
% fop2=fopen('frlatex2.txt','w');
% errs9=errs9';

% for ii=1:9
%     fprintf(fop2,'%5.3g &  %5.3g & %5.3g  \\\\',errs9(ii,:));
%     fprintf(fop2,'\n')
% end

% %
% tstga=norm(C*xga'-d);
% tstmae=norm(C*xmae'-d);
%
% tstmrae=norm(C*xmrae'-d);
% xmrae2=xmrae;
% xmrae(xmrae>3)=3;
%%
load xmrae_sqp
C=(colormap(jet(256)));
dxc=round([linspace(1,256,11)]);
C(dxc,:)
rtlvls=[0 0.02 .04 0.06 0.08 0.12 0.16 0.2 0.35 0.6 1.4];
az=discretize(xmrae_sqp,rtlvls);
% CU=round((SNN_fwd-min(SNN_fwd))*256/range(SNN_fwd));
% CU1=round(((xmrae_sqp-min(xmrae_sqp))/range(xmrae_sqp))*256);
% CU1=ones(length(xmrae_sqp),3);
% CU2=ones(1,length(xmrae_sqp));

% CU1(xmrae_sqp>0.1,:)=repmat([255 255 51],sum(xmrae_sqp>0.1),1);
% CU1(~(xmrae_sqp>0.1),:)=repmat([255 255 255],sum(xmrae_sqp<=0.1),1);

% CU(CU<1)=1;
% CU1(CU1<1)=1;

nme_num = string([1:length(xmrae_sqp)]);

nonm = blanks(length(xmrae_sqp)-1);

ltf=src_36(:,1);
lngf=src_36(:,2);
% CU1=CU1./255;
icon='https://maps.google.com/mapfiles/kml/shapes/triangle.png';
% %
% kmlwritepoint('src_36_NN_6H',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU),:),'Name',nonmae);winopen('src_36_NN_6H.kml')
% kmlwritepoint('src_36_MRAE_6H',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU1),:),'Name',nonmae);winopen('src_36_MRAE_6H.kml')

% kmlwritepoint('src_36_MRAE_4Hnm_GAabs',ltf,lngf,'IconScale', 4,'Icon',icon,'Color',CU1,'Name',nonm,'AltitudeMode','clampToGround');winopen('src_36_MRAE_4Hnm_GAabs.kml')

% kmlwritepoint('src_36_NN_6Hnonm',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU),:),'Name',nme_num);winopen('src_36_NN_6Hnm.kml')
% kmlwritepoint('src_36_MRAE_4Hnm',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(dxc(az),:),'Name',nme_num,'AltitudeMode','clampToGround');winopen('src_36_MRAE_4Hnm.kml')
kmlwritepoint('src_36_MRAE_4Hnm_sml',ltf,lngf,'IconScale',2 ,'Icon',icon,'Color',C(dxc(az),:),'Name',nonm,'AltitudeMode','clampToGround');winopen('src_36_MRAE_4Hnm_sml.kml')

% kmlwritepoint('src_36_MRAE_4Hnm_BW05',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',CU1,'Name',nme_num,'AltitudeMode','clampToGround');winopen('src_36_MRAE_4Hnm_BW05.kml')
% kmlwritepoint('src_36_MRAE_4Hnm_BWpnt1sqp',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',CU1,'Name',nme_num,'AltitudeMode','clampToGround');winopen('src_36_MRAE_4Hnm_BWpnt1.kml')
% kmlwritepoint('src_36_MRAE_4Hnm_BWpnt3',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',CU1,'Name',nme_num,'AltitudeMode','clampToGround');winopen('src_36_MRAE_4Hnm_BWpnt3.kml')
% kmlwritepoint('src_36_MRAE_4Hnonm',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU1),:),'Name',nonm);winopen('src_36_MRAE_4Hnonm.kml')

% kmlwritepoint('src_36_NN_6H_num',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU),:),'Name',nme_num);winopen('src_36_NN_6H_num.kml')
%
% kmlwritepoint('src_36_pinv_6H',ltf,lngf,'IconScale', 2,'Icon',icon,'Color',C(round(CU1),:),'Name',nonmae);winopen('src_36_pinv_6H.kml')
%

%%
ff=figure(2623);
% yyaxis right
for ii=1:11;plot([1:2],ii+ones(1,2),'Color',C(dxc(ii),:),'LineWidth',55);hold on;end
% 
% ax.Visible = 'off';
% 
rtlvls(end)=1.3;
yticklabels('')
xticklabels('')
ylim([1 12])
% yyaxis right
yticks([1:12]+0.5)
yticklabels(rtlvls)
set(gca,'fontsize',20,'fontweight','bold');
set(gcf, 'Position', [200, 200, 125, 900])
print('clrbr_ER','-dpng')
%%

figure(6);
% set(groot,'defaultFigurePaperPositionMode','manual')
aa=imread('s36_m46.jpg');
fig = gcf;
% fig.PaperPositionMode = 'manual';
% fig.Position = [1 1 1750 1100];
% orient(fig,'portrait')
imshow(imcrop(aa,[180,0,1700,1050]));

% Create colorbar


xlim=get(gca,'XLim');

ylim=get(gca,'YLim');
ht = text(0.26*xlim(1)+0.7*xlim(2),0.8*ylim(1)+0.2*ylim(2),'wind');
set(ht,'Rotation',52)
set(ht,'FontSize',25,'color','y')

dd=annotation(gcf,'arrow',[0.677370030581041 0.63914373088685],...
    [0.871374527112232 0.802325581395349],'Color',[1 1 1],'LineWidth',18,...
    'HeadStyle','cback2');
set(dd,'HeadWidth',30)
set(dd,'HeadLength',30)

annotation(gcf,'textbox',...
    [0.84416741566897 0.853555599847796 0.175198555956669 0.061135371179039],...
    'Color',[1 1 1],...
    'String',{'q (g/s)'},...
    'LineStyle','none',...
    'FontWeight','bold',...
    'FontSize',24,...
    'FitBoxToText','off');


% print('s36_m46','-dpng')
% print('s36_m46','-dpdf')
%
% fig.PaperPosition = [.25 .25 1700 6];
% saveas(fig, 'testplot4', 'pdf');
% winopen('testplot4.pdf')
% % add_src_num
figure(234)
colormap('jet');
sc=colorbar
% colorbar('Position',[500 76 21 571],'Units','pixels',...
%     'FontSize',18,...
%     'Color',[1 1 1])
caxis([min(xmrae2) max(xmrae2)+0.3])
set(gca,'fontsize',18,'fontweight','bold');
% sc.Position=[0.9083 0.1037 0.0163 0.709];
%%
print('s36_m46','-depsc')
% %%
% figure(12);
% aa=imread('s36_m46.png');
% imshow(aa)
% print('s36_m46','-dpdf')

%%
copyfile('s36_m46.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')



%
%
% figure(16);
% aa=imread('s36_m44.jpg');
% imshow(imcrop(aa,[180,0,1700,1050]))
% colorbar;colormap('jet')
% caxis([min(d) max(d)])
% set(gca,'fontsize',32,'fontweight','bold');
% annotation(gcf,'textbox',...
%     [0.899231046931409 0.935574963609898 0.175198555956669 0.0611353711790391],...
%     'String',{'\mu (ppb)'},...
%     'LineStyle','none',...
%     'FontWeight','bold',...
%     'FontSize',24,...
%     'FitBoxToText','off');
%
% xlim=get(gca,'XLim');
% ylim=get(gca,'YLim');
% ht = text(0.26*xlim(1)+0.74*xlim(2),0.8*ylim(1)+0.2*ylim(2),'wind');
% set(ht,'Rotation',52)
% set(ht,'FontSize',30,'color','y')
%
% dd=annotation(gcf,'arrow',[0.677370030581041 0.63914373088685],...
%     [0.871374527112232 0.802325581395349],'Color',[1 1 1],'LineWidth',18,...
%     'HeadStyle','cback2');
% set(dd,'HeadWidth',30)
% set(dd,'HeadLength',30)
% hold on
% % d = imread('snsr.png');
% % image(d, 'XData', [1100 1700], 'YData', [650 1080]);
%
% print('s36_m44','-dpng')
% copyfile('m44.png','D:\Dropbox\Apps\Overleaf\APR_2020_05_04\For_figures')
%%

fop=fopen('frlatex.txt','w');
for ii=1:4
%         for jj=1:4
    errsmat(ii,1)=(norm(errs(ii,:)))/(length(d)^0.5);
    errsmat(ii,2)=mean(abs(errs(ii,:)));
    errsmat(ii,3)=mean(abs(errs(ii,:))./d');
          errsmat(ii,4)=mean((abs(errs(ii,:))./d').^2);
%         end
    fprintf(fop,'%5.2f &  %5.2f& %5.2f& %5.2f \\\\',errsmat(ii,:));
    fprintf(fop,'\n')
end
% save('errsmat','errsmat')
%%

load Sdirect_fwd36.mat
load xmrae_sqp.mat
load xmse_sqp.mat
load xmae_sqp.mat
load xmsrae_sqp.mat

figure(1246)
stem(Sdirect_fwd36,'LineWidth',3,'Displayname','MSE-PI');
xlabel({'Source number'});
ylabel('Emission rate (g/s)');
set(gca,'fontsize',20,'fontweight','bold');
h=legend;
set(h,'location','northwest');
% Create legend
% ylim([0 1])
xlim([1 36])
set(gcf, 'Position', [100, 100, 800 370])
print('msePI','-depsc')
print('msePI','-dpng')
copyfile('msePI.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')

figure(1239)
% load xmse_sqp.mat
stem(xmse_sqp,'LineWidth',3,'Displayname','MSE');
xlabel({'Source number'});
ylabel('Emission rate (g/s)');
set(gca,'fontsize',20,'fontweight','bold');
% Create legend
h=legend;
set(h,'location','northwest');
ylim([0 1.5])
xlim([1 36.5])
set(gcf, 'Position', [100, 100, 800 370])
print('msesqp','-depsc')
print('msesqp','-dpng')
copyfile('msesqp.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')

figure(1249)
load xmrae_sqp.mat
stem(xmrae_sqp,'LineWidth',3,'Displayname','MRAE');
xlabel({'Source number'});
ylabel('Emission rate (g/s)');
set(gca,'fontsize',20,'fontweight','bold');
% Create legend
h=legend;
set(h,'location','northwest');
ylim([0 1.5])
xlim([1 36.5])
set(gcf, 'Position', [100, 100, 800 370])
print('mraesqp','-depsc')
print('mraesqp','-dpng')
copyfile('mraesqp.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')



figure(1279)
load xmae_sqp.mat
stem(xmae_sqp,'LineWidth',3,'Displayname','MAE');
xlabel({'Source number'});
ylabel('Emission rate (g/s)');
set(gca,'fontsize',20,'fontweight','bold');
% Create legend
h=legend;
set(h,'location','northwest');
ylim([0 1.5])
xlim([1 36.5])
set(gcf, 'Position', [100, 100, 800 370])
print('maesqp','-depsc')
print('maesqp','-dpng')
copyfile('maesqp.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')


figure(1291)
load xmsrae_sqp.mat
stem(xmsrae_sqp,'LineWidth',3,'Displayname','MRSE');
xlabel({'Source number'});
ylabel('Emission rate (g/s)');
set(gca,'fontsize',20,'fontweight','bold');
% Create legend
h=legend;
set(h,'location','northwest');
ylim([0 1.5])
xlim([1 36.5])
set(gcf, 'Position', [100, 100, 800 370])
print('msraesqp','-depsc')
print('msraesqp','-dpng')
copyfile('msraesqp.eps','D:\Dropbox\Apps\Overleaf\PHDTHESIS_2020_12_21\chapFSTHEL\Figures')

