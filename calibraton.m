load ../../../obs_2020_02_26_sep.mat
voc_NOcalib=obs_2020_02_26_2(:,3);
% Sensor3 -200ppb 61.7,50ppm 2.385,1ppm-114.3;base-54
% 61.7-54=7.7->200;60->1ppm;2331->50ppm

vocvalppb_base=voc_NOcalib-50;
vocvalppb=vocvalppb_base*5.625;

% vocvalppb=zeros(1,length(vocvalppb_base))';
% ind1=(vocvalppb_base>0 & vocvalppb_base<=8);C1 = polyfit([0, 8], [0, 200], 1);vocvalppb(ind1)=C1(1)*vocvalppb_base(ind1)+C1(2);
% ind2=(vocvalppb_base<=60 & vocvalppb_base>8);C2 = polyfit([8, 60], [200, 1000], 1);vocvalppb(ind2)=C2(1)*vocvalppb_base(ind2)+C2(2);
% ind3=(vocvalppb_base>60);C3 = polyfit([60, 2331],[1000, 50000], 1);vocvalppb(ind3)=C3(1)*vocvalppb_base(ind3)+C3(2);
save('vocvalppb','vocvalppb')

C=(colormap(jet(256)));
C2=(colormap(jet(256)));

%sirs
% suggestion that all color axis should be the same. SO we useaermod
% profile scales
AZ=readmatrix('../../../../../../AERMODVIEW/pash_20202_02_26_36_passivecal/clrlevels.txt');
clr_lvls=flipud(AZ(:,1));
clr_lvls2=1:length(clr_lvls);
CU_af=max((clr_lvls2-min(clr_lvls2)),1)*256/range(clr_lvls2);CU_af(CU_af<1)=1;
clrmp=discretize(vocvalppb,clr_lvls);
% CU_af=max((clr_lvls-min(clr_lvls)),1)*256/range(clr_lvls);CU_af(CU_af<1)=1;

% CU=max((vocvalppb-min(vocvalppb)),1)*256/range(vocvalppb);CU(CU<1)=1;

nonme_af = blanks(length(CU_af)-1); 


icon1='http://maps.google.com/mapfiles/kml/shapes/road_shield3.png';
icon2='https://maps.google.com/mapfiles/kml/shapes/donut.png';

nonme = blanks(length(obs_2020_02_26)-1);
%%
% indchng=[1:8 10:16 9 17:20 46:47 21:25 28:34 26:27 35:37 39:42 38 43:45];
nmeV=[1:length(vocvalppb)];
nme = string(nmeV);
kmlwritepoint('sme_scl_thresh_cal',obs_2020_02_26_2(indchng,1),obs_2020_02_26_2(indchng,2),'IconScale', 1.3,'Icon',icon1,'Color',C(round(CU_af(clrmp(indchng))),:),'Name',nme,'AltitudeMode','clampToGround');winopen('sme_scl_thresh_cal.kml')

%%

nme_aft = string(1:length(vocvalppb)-40);

% kmlwritepoint('sme_scl_thresh_cal_nonmnc',obs_2020_02_26_2(:,1),obs_2020_02_26_2(:,2),'IconScale', 1.6,'Icon',icon1,'Color',C(round(CU_af(clrmp)),:),'Name',nonme);winopen('sme_scl_thresh_cal_nonmnc.kml')
% kmlwritepoint('sme_scl_thresh_cal_nonmnc_sml2',obs_2020_02_26_2(:,1),obs_2020_02_26_2(:,2),'IconScale', 1.2,'Icon',icon1,'Color',C(round(CU_af(clrmp)),:),'Name',nonme);winopen('sme_scl_thresh_cal_nonmnc_sml2.kml')
% kmlwritepoint('sme_scl_thresh_cal_nonmnc_sml1',obs_2020_02_26_2(:,1),obs_2020_02_26_2(:,2),'IconScale', 1,'Icon',icon1,'Color',C(round(CU_af(clrmp)),:),'Name',nonme);winopen('sme_scl_thresh_cal_nonmnc_sml1.kml')
% kmlwritepoint('sme_scl_cal_nonm1I12a7',obs_2020_02_26_2(:,1),obs_2020_02_26_2(:,2),'IconScale', 0.8,'Icon',icon1,'Color',C(round(CU_af(clrmp)),:),'Name',nonme,'alpha',0.7);winopen('sme_scl_cal_nonm1I12a7.kml')
%%

% ax = axes;
% c = colorbar(ax,'Ticks',linspace(0,1,12),...
%          'TickLabels',[clr_lvls;1601]); %1601 is the max value of profile
% colormap(jet(13
ff=figure(2123);
% yyaxis right
for ii=1:11;plot([1:2],ii+ones(1,2),'Color',C(dxc(ii),:),'LineWidth',55);hold on;end
% 
% ax.Visible = 'off';
% 

yticklabels('')
xticklabels('')
ylim([1 12])
% yyaxis right
yticks([1:12]+0.5)
yticklabels(clr_lvls)
set(gca,'fontsize',20,'fontweight','bold');
set(gcf, 'Position', [200, 200, 125, 900])
print('clrbr_obs','-dpng')

