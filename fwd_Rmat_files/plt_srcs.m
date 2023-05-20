
load xmrae
load ../../src_36.mat

% CU=round((SNN_fwd-min(SNN_fwd))*256/range(SNN_fwd));
CU1=round((xmrae-min(xmrae))*256/range(xmrae));
CU1=ones(length(xmrae),3);
CU2=ones(1,length(xmrae));
CU1(xmrae>0.2,:)=repmat([255 255 51],sum(xmrae>0.2),1);
CU1(~(xmrae>0.2),:)=repmat([255 255 255],sum(xmrae<=0.2),1);
CU1=CU1./255;
% CU(CU<1)=1;
% CU1(CU1<1)=1;

 nme_num = string([1:length(CU1)]); 

nonm = blanks(length(CU1)-1);

   ltf=src_36(:,1);
   lngf=src_36(:,2);
   

   
icon='https://maps.google.com/mapfiles/kml/shapes/triangle.png';
% % 
% kmlwritepoint('src_36_NN_6H',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU),:),'Name',nonmae);winopen('src_36_NN_6H.kml')
% kmlwritepoint('src_36_MRAE_6H',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU1),:),'Name',nonmae);winopen('src_36_MRAE_6H.kml')


% kmlwritepoint('src_36_NN_6Hnonm',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU),:),'Name',nme_num);winopen('src_36_NN_6Hnm.kml')
% kmlwritepoint('src_36_MRAE_4Hnm',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU1),:),'Name',nme_num,'AltitudeMode','clampToGround');winopen('src_36_MRAE_4Hnm.kml')
kmlwritepoint('src_36_MRAE_4Hnm_BW',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',CU1,'Name',nme_num,'AltitudeMode','clampToGround');winopen('src_36_MRAE_4Hnm_BW.kml')

% kmlwritepoint('src_36_MRAE_4Hnonm',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU1),:),'Name',nonm);winopen('src_36_MRAE_4Hnonm.kml')

% kmlwritepoint('src_36_NN_6H_num',ltf,lngf,'IconScale', 2.5,'Icon',icon,'Color',C(round(CU),:),'Name',nme_num);winopen('src_36_NN_6H_num.kml')
% 
% kmlwritepoint('src_36_pinv_6H',ltf,lngf,'IconScale', 2,'Icon',icon,'Color',C(round(CU1),:),'Name',nonmae);winopen('src_36_pinv_6H.kml')
% 