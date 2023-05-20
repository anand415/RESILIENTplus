
load('mccv_mrae_errs_Qnohun1420_1000_10all.mat')
load mccv_partns_1000nn.mat
for ii=[14:18]
[xgamn10{ii},errall_ga_mraemn10{ii},xgamin10{ii},errall_ga_mraemin10{ii},xgamn5{ii},errall_ga_mraemn5{ii},xgamin5{ii},errall_ga_mraemin5{ii},...
    xga1{ii},errall_ga_mrae1{ii}]=tmpmccvtrain_mrae(ii,xgaall,CCtrain); 
[ovrall_err_ga_mraemn10_train(ii),ovrall_err_ga_mraemn10_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemn10{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemin10_train(ii),ovrall_err_ga_mraemin10_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemin10{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemn5_train(ii),ovrall_err_ga_mraemn5_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemn5{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemin5_train(ii),ovrall_err_ga_mraemin5_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemin5{ii},CCtrain,CCtest);  
[ovrall_err_ga_mrae1_train(ii),ovrall_err_ga_mrae1_test(ii)]=mccvtest_mrae(ii,errall_ga_mrae1{ii},CCtrain,CCtest);  
end
load tmpp1.mat
for ii=[20:20]
[xgamn10{ii},errall_ga_mraemn10{ii},xgamin10{ii},errall_ga_mraemin10{ii},xgamn5{ii},errall_ga_mraemn5{ii},xgamin5{ii},errall_ga_mraemin5{ii},...
    xga1{ii},errall_ga_mrae1{ii}]=tmpmccvtrain_mrae(ii,xgaall,CCtrain); 
[ovrall_err_ga_mraemn10_train(ii),ovrall_err_ga_mraemn10_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemn10{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemin10_train(ii),ovrall_err_ga_mraemin10_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemin10{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemn5_train(ii),ovrall_err_ga_mraemn5_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemn5{ii},CCtrain,CCtest);  
[ovrall_err_ga_mraemin5_train(ii),ovrall_err_ga_mraemin5_test(ii)]=mccvtest_mrae(ii,errall_ga_mraemin5{ii},CCtrain,CCtest);  
[ovrall_err_ga_mrae1_train(ii),ovrall_err_ga_mrae1_test(ii)]=mccvtest_mrae(ii,errall_ga_mrae1{ii},CCtrain,CCtest);  
end


figure(1534)
xlim([14 21])
ylim([0.5 0.6])
hold on
plot(ovrall_err_ga_mrae1_test,'r','DisplayName','mrae1')
plot(ovrall_err_ga_mraemin10_test,'g','DisplayName','mraemin10')
plot(ovrall_err_ga_mraemin5_test,'b','DisplayName','mraemin5')
plot(ovrall_err_ga_mraemn10_test,'k','DisplayName','mraemn10')
plot(ovrall_err_ga_mraemn5_test,'m','DisplayName','mraemn5')
legend