clear all;
close all;

load mccv_partns_5000nn.mat

tic
rng default
lnn=13;
leav=[1:lnn];
%%
for ii=8:18
    ii
    tic
[sqp_mrae{ii},errall_mrae{ii}]=mccvtrain_mrae_sqp_comp(ii,CCtrain);
tm_sqp(ii)=toc;
end
% 

for ii=8:18
    tic
[ga_mrae{ii},errall_ga_mrae{ii}]=mccvtrain_mrae_comp(ii,CCtrain); 
tm_mrae(ii)=toc;
end