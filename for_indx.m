clear all;
close all;
load recs_120_75_30x.mat
load ../../../obs_2020_02_26_sep.mat


[x,y]=deg2utm(obs_2020_02_26_2(:,1),obs_2020_02_26_2(:,2));
D = squeeze(sqrt(sum(bsxfun(@minus,recs_120_75_30x,permute([x y],[3 2 1])).^2,2)));



[mn,fid]=min(D);
indx_120_75_30x=fid;
save('indx_120_75_30x','indx_120_75_30x')


ss=fileread('modules2I.f');

fileID = fopen('modules2.f','w');
 writetomod(ss,indx_120_75_30x,fileID);   
 
 copyfile('modules2.f','aermod/')



