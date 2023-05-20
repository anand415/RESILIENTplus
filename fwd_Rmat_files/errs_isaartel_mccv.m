clear all;
close all

load mccv_partns_40c10_2000.mat
load ../../../inverse_adj_simple/adj_Rmat_files/Rmat_adj.mat
load Sphi_mccv.mat

load ../vocvalppb.mat
R=Rmat_adj';
d=vocvalppb;kk=1;

CCtr=CCtrain(1:length(Sphi),:);
CCts=CCtest(1:length(Sphi),:);



Casctr=reshape(CCtr,length(CCts)*30,1);
Cascts=reshape(CCts,length(CCts)*10,1);

% for ii=1:39
%    atr(ii)=sum(Casctr==ii);
% end
% 
% for ii=1:39
%    ats(ii)=sum(Cascts==ii);
% end
for ii=1:length(CCtr)
mt_errall_issartel(ii,:)=R*Sphi{ii}-vocvalppb;
end
% mt_errall_nn=cell2mat(errall_nn)';
% mt_errall_ga=cell2mat(errall_ga)';
% mt_errall_ga_mrae=cell2mat(errall_ga_MRAE)';
% mt_errall_issartel=cell2mat(allmae');


% errall_nn_test=mt_errall_nn(:,1:2);errall_nn_train=mt_errall_nn(:,3:end);
% errall_ga_test=mt_errall_ga(:,1:2);errall_ga_train=mt_errall_ga(:,3:end);
% errall_ga_mrae_test=mt_errall_ga_mrae(:,1:2);errall_ga_mrae_train=mt_errall_ga_mrae(:,3:end);
% errall_issartel_test=mt_errall_issartel(:,1:5);errall_issartel_train=mt_errall_issartel(:,6:end);
for ii=1:length(CCtr)
errall_issartel_test(ii,:)=mt_errall_issartel(ii,CCtest(ii,:));
errall_issartel_train(ii,:)=mt_errall_issartel(ii,CCtrain(ii,:));
end

% Casc_err_nn_test=reshape(errall_nn_test,length(CCts)*2,1);
% Casc_err_ga_test=reshape(errall_ga_test,length(CCts)*2,1);
% Casc_err_ga_mrae_test=reshape(errall_ga_mrae_test,length(CCts)*2,1);
Casc_err_issartel_test=reshape(errall_issartel_test,length(CCts)*10,1);


% Casc_err_nn_train=reshape(errall_nn_train,length(CCtr)*11,1);
% Casc_err_ga_train=reshape(errall_ga_train,length(CCtr)*11,1);
% Casc_err_ga_mrae_train=reshape(errall_ga_mrae_train,length(CCtr)*11,1);
Casc_err_issartel_train=reshape(errall_issartel_train,length(CCtr)*30,1);

for ii=1:40
%     indvdl_err_nn_train(ii)=abs(median(Casc_err_nn_train(Casctr==ii))-vocvalppb(ii));
%        indvdl_err_ga_train(ii)=abs(median(Casc_err_ga_train(Casctr==ii))-vocvalppb(ii));
%     indvdl_err_ga_mrae_train(ii)=abs(median(Casc_err_ga_mrae_train(Casctr==ii))-vocvalppb(ii));
    indvdl_err_issartel_train(ii)=abs(mean(Casc_err_issartel_train(Casctr==ii)));
 
%         indvdl_err_nn_test(ii)=abs(median(Casc_err_nn_test(Cascts==ii))-vocvalppb(ii));
%        indvdl_err_ga_test(ii)=abs(median(Casc_err_ga_test(Cascts==ii))-vocvalppb(ii));
%     indvdl_err_ga_mrae_test(ii)=abs(median(Casc_err_ga_mrae_test(Cascts==ii))-vocvalppb(ii));
    indvdl_err_issartel_test(ii)=abs(mean(Casc_err_issartel_test(Cascts==ii)));
 
end

%      ovrall_err_nn_train=mean(indvdl_err_nn_train);
%        ovrall_err_ga_train=mean(indvdl_err_ga_train);
%     ovrall_err_ga_mrae_train=mean(indvdl_err_ga_mrae_train);
    ovrall_err_issartel_train=mean(indvdl_err_issartel_train);
 
%         ovrall_err_nn_test=mean(indvdl_err_nn_test);
%        ovrall_err_ga_test=mean(indvdl_err_ga_test);
%     ovrall_err_ga_mrae_test=mean(indvdl_err_ga_mrae_test);
    ovrall_err_issartel_test=mean(indvdl_err_issartel_test);



