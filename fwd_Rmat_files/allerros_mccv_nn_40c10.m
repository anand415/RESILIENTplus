clear all;
load err_mccv_40c10_8000_nn.mat
load mccv_partns_40c10_8000.mat
load ../vocvalppb.mat


for uu=1:500
ct=uu;
% inds=[aaind(1:ct)];
%     aa2ind aa3ind];
errall_nnct=[errall_nn(1:ct)];





CCtr=CCtrain(1:length(errall_nnct),:);
CCts=CCtest(1:length(errall_nnct),:);

Casctr=reshape(CCtr,length(errall_nnct)*30,1);
Cascts=reshape(CCts,length(errall_nnct)*11,1);

% for ii=1:41
%    atr(ii)=sum(Casctr==ii);
% end
% 
% for ii=1:41
%    ats(ii)=sum(Cascts==ii);
% end

mt_errall_nn=cell2mat(errall_nnct)';
% mt_errall_ga=cell2mat(errall_ga)';
% mt_errall_ga_mrae=cell2mat(errall_ga_MRAE)';
% mt_errall_ga_mae=cell2mat(errall_ga_mae)';

for ii=1:ct
errall_nn_train(ii,:)=mt_errall_nn(ii,CCtr(ii,:));
errall_nn_test(ii,:)=mt_errall_nn(ii,CCts(ii,:));
end
% errall_ga_test=mt_errall_ga(:,1:5);errall_ga_train=mt_errall_ga(:,6:end);
% errall_ga_mrae_test=mt_errall_ga_mrae(:,1:5);errall_ga_mrae_train=mt_errall_ga_mrae(:,6:end);
% errall_ga_mae_test=mt_errall_ga_mae(:,1:5);errall_ga_mae_train=mt_errall_ga_mae(:,6:end);



Casc_err_nn_test=reshape(errall_nn_test,ct*11,1);
% Casc_err_ga_test=reshape(errall_ga_test,length(CCtest)*5,1);
% Casc_err_ga_mrae_test=reshape(errall_ga_mrae_test,length(CCtest)*5,1);
% Casc_err_ga_mae_test=reshape(errall_ga_mae_test,length(CCtest)*5,1);


Casc_err_nn_train=reshape(errall_nn_train,ct*30,1);
% Casc_err_ga_train=reshape(errall_ga_train,length(CCtrain)*35,1);
% Casc_err_ga_mrae_train=reshape(errall_ga_mrae_train,length(CCtrain)*35,1);
% Casc_err_ga_mae_train=reshape(errall_ga_mae_train,length(CCtrain)*35,1);

for ii=1:41
    indvdl_err_nn_train(ii)=abs(median(Casc_err_nn_train(Casctr==ii)));
%        indvdl_err_ga_train(ii)=abs(median(Casc_err_ga_train(Casctr==ii))-vocvalppb(ii));
%     indvdl_err_ga_mrae_train(ii)=abs(median(Casc_err_ga_mrae_train(Casctr==ii))-vocvalppb(ii));
%     indvdl_err_ga_mae_train(ii)=abs(median(Casc_err_ga_mae_train(Casctr==ii))-vocvalppb(ii));
 
        indvdl_err_nn_test(ii)=abs(median(Casc_err_nn_test(Cascts==ii)));
%        indvdl_err_ga_test(ii)=abs(median(Casc_err_ga_test(Cascts==ii))-vocvalppb(ii));
%     indvdl_err_ga_mrae_test(ii)=abs(median(Casc_err_ga_mrae_test(Cascts==ii))-vocvalppb(ii));
%     indvdl_err_ga_mae_test(ii)=abs(median(Casc_err_ga_mae_test(Cascts==ii))-vocvalppb(ii));
%  
end

     ovrall_err_nn_train=mean(indvdl_err_nn_train);
%        ovrall_err_ga_train=mean(indvdl_err_ga_train);
%     ovrall_err_ga_mrae_train=mean(indvdl_err_ga_mrae_train);
%     ovrall_err_ga_mae_train=mean(indvdl_err_ga_mae_train);
%  
        ovrall_err_nn_test=mean(indvdl_err_nn_test);
%        ovrall_err_ga_test=mean(indvdl_err_ga_test);
%     ovrall_err_ga_mrae_test=mean(indvdl_err_ga_mrae_test);
%     ovrall_err_ga_mae_test=mean(indvdl_err_ga_mae_test);

ovrall_err_nn_trainA(uu)=ovrall_err_nn_train;
ovrall_err_nn_testA(uu)=ovrall_err_nn_test;

end
save('ovrall_err_nn_cumul','ovrall_err_nn_trainA','ovrall_err_nn_testA')
% ovrall_err_nn_testA=ovrall_err_nn_testA(ovrall_err_nn_testA~=0);
% ovrall_err_nn_trainA=ovrall_err_nn_trainA(ovrall_err_nn_trainA~=0);
