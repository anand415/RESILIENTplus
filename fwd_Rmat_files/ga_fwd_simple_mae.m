clear all;
close all;
load Rmat_fwd.mat
load ../vocvalppb.mat
load ../obs_2020_02_26.mat
% load ../../src_39.mat
R=Rmat_fwd;
d=vocvalppb;kk=1;


fun = @(x) sum(abs(R*x'-vocvalppb));tic
options = optimoptions('ga');
% SNN_fwd = lsqnonneg(R,d);
% options.InitialPopulationMatrix = repmat(SNN_fwd',[1000 1]); % Add copies of initial value

[x,mae] = ga(fun,36,[],[],[],[],zeros(1,36),[],[],options);
	Sga=x;
    
toc

% ,C=(colormap(jet(256)));

CU=round((Sga-min(Sga))*256/range(Sga));
% CU1=round((Sga1-min(Sga1))*256/range(Sga1));

CU(CU<1)=1;
% CU1(CU1<1)=1;

nme = blanks(length(CU)-1); 
nme2 = blanks(length(CU)-1);

   ltf=src_39_deg(:,1);
   lngf=src_39_deg(:,2);

icon='http://maps.google.com/mapfiles/kml/shapes/shaded_dot.png';

% kmlwritepoint('src_fwd',ltf,lngf,'IconSgacale', 2,'Icon',icon,'Color',C(round(CU),:),'Name',nme);winopen('src_fwd.kml')
kmlwritepoint('src_fwd_ga',ltf,lngf,'IconScale', 2,'Icon',icon,'Color',C(round(CU),:),'Name',nme);winopen('src_fwd_ga.kml')

% kmlwritepoint('src_fwd1',ltf,lngf,'IconSgacale', 2,'Icon',icon,'Color',C(round(CU1),:),'Name',nme);winopen('src_fwd1.kml')



