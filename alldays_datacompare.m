clear all;
close all;
 load PGdatawitharmd.mat
 load PG_met.mat
 load ind_obs_ZA_alldays.mat
%  for ii=1:length(data_existsfcmet)
% obs_loc=[data_existsfcmet{ii}.cart_R_Conc(:,1) data_existsfcmet{ii}.cart_R_Conc(:,2)];
% % medx(ii)=mean(obs_loc(:,1));
% % medy(ii)=mean(obs_loc(:,2));
% % angle(ii)=mod(90-cart2pol(medx(ii),medy(ii))*(180/pi)+180,360);
% % [vl,mxlc(ii)]=max(data_existsfcmet{ii}.cart_R_Conc(:,3));
% % angle(ii)=mod(90-cart2pol(obs_loc(mxlc(ii),1),obs_loc(mxlc(ii),2))*(180/pi)+180,360);
%  end
     
 windir=PGSURFfull(2:end,18);
 
fileID = fopen('../PGSURF_full.SFC','r');tlin1=fgets(fileID);
 for ii=1:length(data_existsfcmet)
     fname=sprintf('%s%2.2d%2.2d%2.2d%2.2d%s','PGSURF',data_existsfcmet{ii}.stattime.Month,data_existsfcmet{ii}.stattime.Day,data_existsfcmet{ii}.stattime.Hour,data_existsfcmet{ii}.stattime.Minute,'.SFC');
fileID2(ii) = fopen(fname,'w');   fprintf(fileID2(ii),tlin1);
 end

  for ii=1:length(data_existsfcmet)
     fname=sprintf('%s%2.2d%2.2d%2.2d%2.2d%s','PGSURF',data_existsfcmet{ii}.stattime.Month,data_existsfcmet{ii}.stattime.Day,data_existsfcmet{ii}.stattime.Hour,data_existsfcmet{ii}.stattime.Minute,'.SFC');
fileID2(ii) = fopen(fname,'a');  
  end
 
for ii=1:length(data_existsfcmet)
tlin2=fgets(fileID);
tlin2(95:99)=sprintf('%4.1f',act_direc(ii));fprintf(fileID2(ii),tlin2);
end

fileID = fopen('../PGPROF_full.PFL','r');
for ii=1:length(data_existsfcmet)
   fname=sprintf('%s%2.2d%2.2d%2.2d%2.2d%s','PGPROF',data_existsfcmet{ii}.stattime.Month,data_existsfcmet{ii}.stattime.Day,data_existsfcmet{ii}.stattime.Hour,data_existsfcmet{ii}.stattime.Minute,'.PFL');
fileID2(ii) = fopen(fname,'w');  
end
 
for ii=1:length(data_existsfcmet)
tlin1=fgets(fileID);tlin1(23:27)=sprintf('%4.1f',act_direc(ii));
tlin2=fgets(fileID);
tlin3=fgets(fileID);
tlin4=fgets(fileID);
tlin5=fgets(fileID);
alllines=strcat(tlin1,"\n",tlin2,"\n",tlin3,"\n",tlin4,"\n",tlin5);
fprintf(fileID2(ii),alllines);
end


for ii=1:length(data_existsfcmet)
fname1=sprintf('%s%2.2d%2.2d%2.2d%2.2d','MET',data_existsfcmet{ii}.stattime.Month,data_existsfcmet{ii}.stattime.Day,data_existsfcmet{ii}.stattime.Hour,data_existsfcmet{ii}.stattime.Minute);
% fname2=sprintf('%s%2.2d%2.2d%2.2d%2.2d%s','PGSURF',data_existsfcmet{ii}.stattime.Month,data_existsfcmet{ii}.stattime.Day,data_existsfcmet{ii}.stattime.Hour,data_existsfcmet{ii}.stattime.Minute,'.SFC');
% fname3=sprintf('%s%2.2d%2.2d%2.2d%2.2d%s','PGPROF',data_existsfcmet{ii}.stattime.Month,data_existsfcmet{ii}.stattime.Day,data_existsfcmet{ii}.stattime.Hour,data_existsfcmet{ii}.stattime.Minute,'.PFL');

mkdir(fname1);
% mkdir(strcat(fname1,'/BASE'));
% pause(1);
copyfile('../BASE',fname1);
%     strcat(fname1,'/BASE')
end














% ss(100:272)
% ss(274:274+150)