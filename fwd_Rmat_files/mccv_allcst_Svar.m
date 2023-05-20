clear all;
close all;

load mccv_partns_1000.mat
% load mccv_mae_errs_Q_1000M.mat
load mccv_mrae_errs_Q_Merge3.mat
% load mccv_nn_errs_Q_1000.mat

% for ii=1:8
% Smed(1,:)=cellfun(@median,S_nn,'UniformOutput',false);
% Smed(2,:)=cellfun(@median,ga_mae(1:8),'UniformOutput',false);
Smed=cellfun(@median,ga_mrae,'UniformOutput',false);
Smedgd=Smed{4};
Smedf=(cell2mat(cellfun(@(x) x',Smed,'UniformOutput',false)));

% Svar(1,:)=cellfun(@iqr,S_nn,'UniformOutput',false);
% Svar(2,:)=cellfun(@iqr,ga_mae(1:8),'UniformOutput',false);
Svar=cellfun(@iqr,ga_mrae,'UniformOutput',false);
Svar25=cellfun(@(x) prctile(x,25),ga_mrae,'UniformOutput',false);
Svar75=cellfun(@(x) prctile(x,75),ga_mrae,'UniformOutput',false);



% for ii=3:3
Svar2=cell2mat(cellfun(@(x) x',Svar,'UniformOutput',false));
Svarf=mean(Svar2);
% end


Svarr25=cell2mat(cellfun(@(x) x',Svar25,'UniformOutput',false));
Svarr75=cell2mat(cellfun(@(x) x',Svar75,'UniformOutput',false));
QQcd=Svar2./(Svarr25+Svarr75);







% cmap(4,:) = cmap2(4,:);

% 
% figboxplt_nn(S_nn,Smed)
% 
% figzerosrc_nn(S_nn,Smed)


figboxplt_mrae(ga_mrae,Smed)

figzerosrc_mrae(ga_mrae,Smed)


 figiqr_allp(Svarf)
 
 
 load ../../src_36
 
C=(colormap(jet(256)));

CU1=round((Smedgd-min(Smedgd))*256/range(Smedgd));CU1(CU1<1)=1;
nme_num = blanks(length(CU1)-1);
   ltf=src_36(:,1);
   lngf=src_36(:,2);
icon='https://maps.google.com/mapfiles/kml/shapes/triangle.png';
% kmlwritepoint('src_36_NN_6H',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU),:),'Name',nonmae);winopen('src_36_NN_6H.kml')
% kmlwritepoint('src_36_MRAE_6H',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU1),:),'Name',nonmae);winopen('src_36_MRAE_6H.kml')


kmlwritepoint('src_MRAE_6Hnm_CV',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU1),:),'Name',nme_num);winopen('src_MRAE_6Hnm_CV.kml')

