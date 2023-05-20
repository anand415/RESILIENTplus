clear all;
load mccv_partns_40c10_8000.mat
load ../vocvalppb.mat

load errall_ga_mmrae8000.mat
errall_ga_mrae=errall_ga_mmrae;
aa=errall_ga_mrae;
aaind=1:length(aa);
% % load errall_ga_mrae_2kL.mat
% aa2=errall_ga(~cellfun(@isempty,errall_ga));
% aa2ind=find(~cellfun(@isempty,errall_ga));
% 
% load errall_ga_mrae_4k+.mat
% aa3=errall_ga(~cellfun(@isempty,errall_ga));
% aa3ind=find(~cellfun(@isempty,errall_ga));

for uu=1:500
ct=uu;
inds=[aaind(1:ct)];
%     aa2ind aa3ind];
allmrae=[aa(1:ct)];

%     aa2 aa3];

CCtr=CCtrain(inds,:);
CCts=CCtest(inds,:);


Casctr=reshape(CCtr,ct*30,1);
Cascts=reshape(CCts,ct*11,1);

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
mt_errall_ga_mrae=cell2mat(allmrae');


% errall_nn_test=mt_errall_nn(:,1:2);errall_nn_train=mt_errall_nn(:,3:end);
% errall_ga_test=mt_errall_ga(:,1:2);errall_ga_train=mt_errall_ga(:,3:end);
% errall_ga_mrae_test=mt_errall_ga_mrae(:,1:2);errall_ga_mrae_train=mt_errall_ga_mrae(:,3:end);
% errall_ga_mrae_test=mt_errall_ga_mrae(:,1:5);errall_ga_mrae_train=mt_errall_ga_mrae(:,6:end);
for ii=1:ct
errall_ga_mrae_test(ii,:)=mt_errall_ga_mrae(ii,CCtest(ii,:));
errall_ga_mrae_train(ii,:)=mt_errall_ga_mrae(ii,CCtrain(ii,:));
end

% Casc_err_nn_test=reshape(errall_nn_test,ct*2,1);
% Casc_err_ga_test=reshape(errall_ga_test,ct*2,1);
% Casc_err_ga_mrae_test=reshape(errall_ga_mrae_test,ct*2,1);
Casc_err_ga_mrae_test=reshape(errall_ga_mrae_test,ct*11,1);


% Casc_err_nn_train=reshape(errall_nn_train,ct*11,1);
% Casc_err_ga_train=reshape(errall_ga_train,ct*11,1);
% Casc_err_ga_mrae_train=reshape(errall_ga_mrae_train,ct*11,1);
Casc_err_ga_mrae_train=reshape(errall_ga_mrae_train,ct*30,1);

for ii=1:41
%     indvdl_err_nn_train(ii)=abs(median(Casc_err_nn_train(Casctr==ii))-vocvalppb(ii));
%        indvdl_err_ga_train(ii)=abs(median(Casc_err_ga_train(Casctr==ii))-vocvalppb(ii));
%     indvdl_err_ga_mrae_train(ii)=abs(median(Casc_err_ga_mrae_train(Casctr==ii))-vocvalppb(ii));
    indvdl_err_ga_mrae_train(ii)=abs(median(Casc_err_ga_mrae_train(Casctr==ii)));
 
%         indvdl_err_nn_test(ii)=abs(median(Casc_err_nn_test(Cascts==ii))-vocvalppb(ii));
%        indvdl_err_ga_test(ii)=abs(median(Casc_err_ga_test(Cascts==ii))-vocvalppb(ii));
%     indvdl_err_ga_mrae_test(ii)=abs(median(Casc_err_ga_mrae_test(Cascts==ii))-vocvalppb(ii));
    indvdl_err_ga_mrae_test(ii)=abs(median(Casc_err_ga_mrae_test(Cascts==ii)));
 
end

%      ovrall_err_nn_train=mean(indvdl_err_nn_train);
%        ovrall_err_ga_train=mean(indvdl_err_ga_train);
%     ovrall_err_ga_mrae_train=mean(indvdl_err_ga_mrae_train);
    ovrall_err_ga_mrae_train=mean(indvdl_err_ga_mrae_train);
 
%         ovrall_err_nn_test=mean(indvdl_err_nn_test);
%        ovrall_err_ga_test=mean(indvdl_err_ga_test);
%     ovrall_err_ga_mrae_test=mean(indvdl_err_ga_mrae_test);
    ovrall_err_ga_mrae_test=mean(indvdl_err_ga_mrae_test);

ovrall_err_ga_mrae_trainA(uu)=ovrall_err_ga_mrae_train;
ovrall_err_ga_mrae_testA(uu)=ovrall_err_ga_mrae_test;

end
save('ovrall_err_ga_mrae_cumul','ovrall_err_ga_mrae_trainA','ovrall_err_ga_mrae_testA')

