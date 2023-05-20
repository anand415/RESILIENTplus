function [ovrall_err_train,ovrall_err_test]=mccvtest_mrae(ss,errall,Ctrain,Ctest)
load ../vocvalppb.mat
d=vocvalppb;

leav=[1:50];
CCtrain=[Ctrain{ss}];
CCtest=[Ctest{ss}];

CCtr=CCtrain(1:length(errall),:);
CCts=CCtest(1:length(errall),:);

%
% CCtr=CCtrain(1:10:end,:);
% CCts=CCtest(1:10:end,:);


Casctr=reshape(CCtr,length(errall)*(47-leav(ss)),1);
Cascts=reshape(CCts,length(errall)*(leav(ss)),1);
mt_errall=(errall);

for ii=1:length(errall)
    errall_train(ii,:)=mt_errall(ii,CCtr(ii,:));
    errall_test(ii,:)=mt_errall(ii,CCts(ii,:));
end
% length(errall)
Casc_err_test=reshape(errall_test,length(errall)*leav(ss),1);
Casc_err_train=reshape(errall_train,length(errall)*(47-leav(ss)),1);
for ii=1:47
    indvdl_err_train(ii)=nanmedian(abs(Casc_err_train(Casctr==ii))/d(ii));
%     length(Casc_err_test(Cascts==ii))
    indvdl_err_test(ii)=nanmedian(abs(Casc_err_test(Cascts==ii))/d(ii));
    
        indvdl_err_trainiqr(ii)=iqr(abs(Casc_err_train(Casctr==ii))/d(ii));
%     length(Casc_err_test(Cascts==ii))
    indvdl_err_testiqr(ii)=iqr(abs(Casc_err_test(Cascts==ii))/d(ii));
    %
    %     indvdl_err_train(ii)=nanmedian(abs(Casc_err_train(Casctr==ii)));
    %         indvdl_err_test(ii)=nanmedian(abs(Casc_err_test(Cascts==ii)));
    
    
    %     indvdl_err_train(ii)=norm(Casc_err_train(Casctr==ii))/length((Casc_err_train(Casctr==ii)))^(0.5);
    %         indvdl_err_test(ii)=norm(Casc_err_test(Cascts==ii))/length((Casc_err_train(Casctr==ii)))^(0.5);
end
%      ovrall_err_train=norm(indvdl_err_train)/(47)^(0.25);
%      ovrall_err_test=norm(indvdl_err_test)/(47)^(0.25);
%
ovrall_err_train=mean(indvdl_err_testiqr);
ovrall_err_test=mean(indvdl_err_test);
end
