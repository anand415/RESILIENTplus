clear all;
load mccv_partns_40c5_8000.mat
load ../vocvalppb.mat

load errall_40c5_ga_mae500.mat

aaind=find(~cellfun(@isempty,errall_ga_mae));
aa=errall_ga_mae;

% % load errall_ga_mae_2kL.mat
% aa2=errall_ga(~cellfun(@isempty,errall_ga));
% aa2ind=find(~cellfun(@isempty,errall_ga));
% 
% load errall_ga_mae_4k+.mat
% aa3=errall_ga(~cellfun(@isempty,errall_ga));
% aa3ind=find(~cellfun(@isempty,errall_ga));
for uu=5:500
ct=uu;
inds=[aaind(1:ct)];
%     aa2ind aa3ind];
allmae=[aa(1:ct)];
%     aa2 aa3];

CCtr=CCtrain(inds,:);
CCts=CCtest(inds,:);


Casctr=reshape(CCtr,ct*35,1);
Cascts=reshape(CCts,ct*6,1);

% for ii=1:39
%    atr(ii)=sum(Casctr==ii);
% end
% 
% for ii=1:39
%    ats(ii)=sum(Cascts==ii);
% end


% mt_errall_nn=cell2mat(errall_nn)';
% mt_errall_ga=cell2mat(errall_ga)';
% mt_errall_ga_mrae=cell2mat(errall_ga_MRAE)';
mt_errall_ga_mae=cell2mat(allmae)';


% errall_nn_test=mt_errall_nn(:,1:2);errall_nn_train=mt_errall_nn(:,3:end);
% errall_ga_test=mt_errall_ga(:,1:2);errall_ga_train=mt_errall_ga(:,3:end);
% errall_ga_mrae_test=mt_errall_ga_mrae(:,1:2);errall_ga_mrae_train=mt_errall_ga_mrae(:,3:end);
% errall_ga_mae_test=mt_errall_ga_mae(:,1:5);errall_ga_mae_train=mt_errall_ga_mae(:,6:end);
for ii=1:ct
errall_ga_mae_test(ii,:)=mt_errall_ga_mae(ii,CCtest(ii,:));
errall_ga_mae_train(ii,:)=mt_errall_ga_mae(ii,CCtrain(ii,:));
end

% Casc_err_nn_test=reshape(errall_nn_test,ct*2,1);
% Casc_err_ga_test=reshape(errall_ga_test,ct*2,1);
% Casc_err_ga_mrae_test=reshape(errall_ga_mrae_test,ct*2,1);
Casc_err_ga_mae_test=reshape(errall_ga_mae_test,ct*6,1);


% Casc_err_nn_train=reshape(errall_nn_train,ct*6,1);
% Casc_err_ga_train=reshape(errall_ga_train,ct*6,1);
% Casc_err_ga_mrae_train=reshape(errall_ga_mrae_train,ct*6,1);
Casc_err_ga_mae_train=reshape(errall_ga_mae_train,ct*35,1);

for ii=1:41
%     indvdl_err_nn_train(ii)=abs(median(Casc_err_nn_train(Casctr==ii))-vocvalppb(ii));
%        indvdl_err_ga_train(ii)=abs(median(Casc_err_ga_train(Casctr==ii))-vocvalppb(ii));
%     indvdl_err_ga_mrae_train(ii)=abs(median(Casc_err_ga_mrae_train(Casctr==ii))-vocvalppb(ii));
    indvdl_err_ga_mae_train(ii)=abs(median(Casc_err_ga_mae_train(Casctr==ii)));
 
%         indvdl_err_nn_test(ii)=abs(median(Casc_err_nn_test(Cascts==ii))-vocvalppb(ii));
%        indvdl_err_ga_test(ii)=abs(median(Casc_err_ga_test(Cascts==ii))-vocvalppb(ii));
%     indvdl_err_ga_mrae_test(ii)=abs(median(Casc_err_ga_mrae_test(Cascts==ii))-vocvalppb(ii));
    indvdl_err_ga_mae_test(ii)=abs(median(Casc_err_ga_mae_test(Cascts==ii)));
 
end

%      ovrall_err_nn_train=mean(indvdl_err_nn_train);
%        ovrall_err_ga_train=mean(indvdl_err_ga_train);
%     ovrall_err_ga_mrae_train=mean(indvdl_err_ga_mrae_train);
    ovrall_err_ga_mae_train=mean(indvdl_err_ga_mae_train);
 
%         ovrall_err_nn_test=mean(indvdl_err_nn_test);
%        ovrall_err_ga_test=mean(indvdl_err_ga_test);
%     ovrall_err_ga_mrae_test=mean(indvdl_err_ga_mrae_test);
    ovrall_err_ga_mae_test=mean(indvdl_err_ga_mae_test);

ovrall_err_ga_mae_trainA(uu)=ovrall_err_ga_mae_train;
ovrall_err_ga_mae_testA(uu)=ovrall_err_ga_mae_test;

end
save('ovrall_err_40c5_ga_mae_cumul','ovrall_err_ga_mae_trainA','ovrall_err_ga_mae_testA')