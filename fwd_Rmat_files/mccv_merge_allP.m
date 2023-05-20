clear ga_maeM errall_ga_maeM



load  mccv_mae_errs_Q1111_1000_10all.mat
ga_maeM(11:11)=ga_mae(11:11);
errall_ga_maeM(11:11)=errall_ga_mae(11:11);
xgaallM{11}=xgaall;

% load  mccv_mae_errs_Q99_1000_10all.mat
% ga_maeM(9:9)=ga_mae(9:9);
% errall_ga_maeM(9:9)=errall_ga_mae(9:9);
% xgaallM(9:9)=xgaall(9:9);


load  mccv_mae_errs_Q1010_1000_10all.mat
ga_maeM(10:10)=ga_mae(10:10);
errall_ga_maeM(10:10)=errall_ga_mae(10:10);
xgaallM{10}=xgaall;

load  mccv_mae_errs_Q1212_1000_10all.mat
ga_maeM(12:12)=ga_mae(12:12);
errall_ga_maeM(12:12)=errall_ga_mae(12:12);
xgaallM{12}=xgaall;

load  mccv_mae_errs_Q1313_1000_10all.mat
ga_maeM(13:13)=ga_mae(13:13);
errall_ga_maeM(13:13)=errall_ga_mae(13:13);
xgaallM{13}=xgaall;

load  mccv_mae_errs_Q1414_1000_10all.mat
ga_maeM(14:14)=ga_mae(14:14);
errall_ga_maeM(14:14)=errall_ga_mae(14:14);
xgaallM{14}=xgaall;
% load  mccv_mae_errs_Q1515_1000_10all.mat
% ga_maeM(14:15)=ga_mae(15:15);
% errall_ga_maeM(15:15)=errall_ga_mae(15:15);
% xgaallM(15:15)=xgaall(15:15);
% 
% 
% load  mccv_mae_errs_Q1616_1000_10all.mat
% ga_maeM(16:16)=ga_mae(16:16);
% errall_ga_maeM(16:16)=errall_ga_mae(16:16);
% xgaallM(16:16)=xgaall(16:16);
% 
% 
% load  mccv_mae_errs_Q1717_1000_10all.mat
% ga_maeM(17:17)=ga_mae(17:17);
% errall_ga_maeM(17:17)=errall_ga_mae(17:17);
% xgaallM(17:17)=xgaall(17:17);
% 
% 
% load  mccv_mae_errs_Q1818_1000_10all.mat
% ga_maeM(18:18)=ga_mae(18:18);
% errall_ga_maeM(18:18)=errall_ga_mae(18:18);
% xgaallM(18:18)=xgaall(18:18);
% 
% load  mccv_mae_errs_Q1919_1000_10all.mat
% ga_maeM(19:19)=ga_mae(19:19);
% errall_ga_maeM(19:19)=errall_ga_mae(19:19);
% xgaallM(19:19)=xgaall(19:19);
% 
% 
% load  mccv_mae_errs_Q2020_1000_10all.mat
% ga_maeM(20:20)=ga_mae(20:20);
% errall_ga_maeM(20:20)=errall_ga_mae(20:20);
% xgaallM(20:20)=xgaall(20:20);
% 
% load  mccv_mae_errs_Q2121_1000_10all.mat
% ga_maeM(21:21)=ga_mae(21:21);
% errall_ga_maeM(21:21)=errall_ga_mae(21:21);
% xgaallM(21:21)=xgaall(21:21);

ga_mae=ga_maeM;
errall_ga_mae=errall_ga_maeM;
xgaall=xgaallM;

save('mccv_mae_errs_Q1014_1000_10all','errall_ga_mae','ga_mae','xgaall')

%%
clear ga_mraeM errall_ga_mraeM



load  mccv_mrae_errs_Q1111_1000_10all.mat
ga_mraeM(11:11)=ga_mrae(11:11);
errall_ga_mraeM(11:11)=errall_ga_mrae(11:11);
xgaallM(11:11)=xgaall(11:11);

load  mccv_mrae_errs_Q99_1000_10all.mat
ga_mraeM(9:9)=ga_mrae(9:9);
errall_ga_mraeM(9:9)=errall_ga_mrae(9:9);
xgaallM(9:9)=xgaall(9:9);


load  mccv_mrae_errs_Q1010_1000_10all.mat
ga_mraeM(10:10)=ga_mrae(10:10);
errall_ga_mraeM(10:10)=errall_ga_mrae(10:10);
xgaallM(10:10)=xgaall(10:10);

load  mccv_mrae_errs_Q1212_1000_10all.mat
ga_mraeM(12:12)=ga_mrae(12:12);
errall_ga_mraeM(12:12)=errall_ga_mrae(12:12);
xgaallM(12:12)=xgaall(12:12);

load  mccv_mrae_errs_Q1313_1000_10all.mat
ga_mraeM(13:13)=ga_mrae(13:13);
errall_ga_mraeM(13:13)=errall_ga_mrae(13:13);
xgaallM(13:13)=xgaall(13:13);

load  mccv_mrae_errs_Q1414_1000_10all.mat
ga_mraeM(14:14)=ga_mrae(14:14);
errall_ga_mraeM(14:14)=errall_ga_mrae(14:14);
xgaallM(14:14)=xgaall(14:14);


load  mccv_mrae_errs_Q1515_1000_10all.mat
ga_mraeM(14:15)=ga_mrae(15:15);
errall_ga_mraeM(15:15)=errall_ga_mrae(15:15);
xgaallM(15:15)=xgaall(15:15);


load  mccv_mrae_errs_Q1616_1000_10all.mat
ga_mraeM(16:16)=ga_mrae(16:16);
errall_ga_mraeM(16:16)=errall_ga_mrae(16:16);
xgaallM(16:16)=xgaall(16:16);


load  mccv_mrae_errs_Q1717_1000_10all.mat
ga_mraeM(17:17)=ga_mrae(17:17);
errall_ga_mraeM(17:17)=errall_ga_mrae(17:17);
xgaallM(17:17)=xgaall(17:17);


load  mccv_mrae_errs_Q1818_1000_10all.mat
ga_mraeM(18:18)=ga_mrae(18:18);
errall_ga_mraeM(18:18)=errall_ga_mrae(18:18);
xgaallM(18:18)=xgaall(18:18);

load  mccv_mrae_errs_Q1919_1000_10all.mat
ga_mraeM(19:19)=ga_mrae(19:19);
errall_ga_mraeM(19:19)=errall_ga_mrae(19:19);
xgaallM(19:19)=xgaall(19:19);


load  mccv_mrae_errs_Q2020_1000_10all.mat
ga_mraeM(20:20)=ga_mrae(20:20);
errall_ga_mraeM(20:20)=errall_ga_mrae(20:20);
xgaallM(20:20)=xgaall(20:20);

load  mccv_mrae_errs_Q2121_1000_10all.mat
ga_mraeM(21:21)=ga_mrae(21:21);
errall_ga_mraeM(21:21)=errall_ga_mrae(21:21);
xgaallM(21:21)=xgaall(21:21);

ga_mrae=ga_mraeM;
errall_ga_mrae=errall_ga_mraeM;
xgaall=xgaallM;

save('mccv_mrae_errs_Q921_1000_10all','errall_ga_mrae','ga_mrae','xgaall')


% ------------------------




clear ga_mraeM errall_ga_mraeM

load  mccv_mrae_errs_Qnohun1415_1000_10all.mat
ga_mraeM(14:15)=ga_mrae(14:15);
errall_ga_mraeM(14:15)=errall_ga_mrae(14:15);
xgaallM(14:15)=xgaall(14:15);


load  mccv_mrae_errs_Qnohun1616_1000_10all.mat
ga_mraeM(16:16)=ga_mrae(16:16);
errall_ga_mraeM(16:16)=errall_ga_mrae(16:16);
xgaallM(16:16)=xgaall(16:16);


load  mccv_mrae_errs_Qnohun1718_1000_10all.mat
ga_mraeM(17:18)=ga_mrae(17:18);
errall_ga_mraeM(17:18)=errall_ga_mrae(17:18);
xgaallM(17:18)=xgaall(17:18);


load  mccv_mrae_errs_Qnohun2020_1000_10all.mat
ga_mraeM(20:20)=ga_mrae(20:20);
errall_ga_mraeM(20:20)=errall_ga_mrae(20:20);
xgaallM(20:20)=xgaall(20:20);



ga_mrae=ga_mraeM;
errall_ga_mrae=errall_ga_mraeM;
xgaall=xgaallM;

save('mccv_mrae_errs_Qnohun1420_1000_10','errall_ga_mrae','ga_mrae','xgaall')





load mccv_mrae_errs_Q1010_1000_10.mat
clear ga_mraeM errall_ga_mraeM
ga_mraeM(10:10)=ga_mrae(10:10);
errall_ga_mraeM(10:10)=errall_ga_mrae(10:10);


load  mccv_mrae_errs_Q89_1000_10.mat
ga_mraeM(8:9)=ga_mrae(8:9);
errall_ga_mraeM(8:9)=errall_ga_mrae(8:9);


 load mccv_mrae_errs_Q67_1000_10.mat
 ga_mraeM(6:7)=ga_mrae(6:7);
errall_ga_mraeM(6:7)=errall_ga_mrae(6:7);
 
 
 
 load  mccv_mrae_errs_Q45_1000_10.mat
 ga_mraeM(4:5)=ga_mrae(4:5);
errall_ga_mraeM(4:5)=errall_ga_mrae(4:5);
 
 
 load  mccv_mrae_errs_Q33_1000_10.mat
ga_mraeM(3:3)=ga_mrae(3:3);
errall_ga_mraeM(3:3)=errall_ga_mrae(3:3);

ga_mrae=ga_mraeM;
errall_ga_mrae=errall_ga_mraeM;

save('mccv_mrae_errs_Q310_1000_10','errall_ga_mrae','ga_mrae')













load mccv_mae_errs_Q913_1000_2.mat
ga_maeM=ga_mae;
errall_ga_maeM=errall_ga_mae;


load mccv_mae_errs_Q18_1000_3.mat
ga_maeM(1:8)=ga_mae(1:8);
errall_ga_maeM(1:8)=errall_ga_mae(1:8);



ga_mae=ga_maeM;
errall_ga_mae=errall_ga_maeM;
save('mccv_mae_errs_Q113M_1000_2','errall_ga_mae','ga_mae')



% 
% load mccv_mrae_errs_Q710_1000_5.mat
% ga_mraeM(7:10)=ga_mrae(7:10);
% errall_ga_mraeM(7:10)=errall_ga_mrae(7:10);
% 
% 
% load mccv_mrae_errs_Q36_1000_5.mat
% ga_mraeM(3:6)=ga_mrae(3:6);
% errall_ga_mraeM(3:6)=errall_ga_mrae(3:6);
% 
% 
% 
% ga_mrae=ga_mraeM;
% errall_ga_mrae=errall_ga_mraeM;
% save('mccv_mrae_errs_Q310_1000_5','errall_ga_mrae','ga_mrae')



load mccv_mrae_errs_Q2526_1000_5.mat
ga_mraeM(25:26)=ga_mrae(25:26);
errall_ga_mraeM(25:26)=errall_ga_mrae(25:26);


load mccv_mrae_errs_Q2324_1000_5.mat
ga_mraeM(23:24)=ga_mrae(23:24);
errall_ga_mraeM(23:24)=errall_ga_mrae(23:24);

load mccv_mrae_errs_Q2222_1000_5.mat
ga_mraeM(22)=ga_mrae(22);
errall_ga_mraeM(22)=errall_ga_mrae(22);

load mccv_mrae_errs_Q1821_1000_5.mat
ga_mraeM(18:21)=ga_mrae(18:21);
errall_ga_mraeM(18:21)=errall_ga_mrae(18:21);

load mccv_mrae_errs_Q1517_1000_5.mat
ga_mraeM(15:17)=ga_mrae(15:17);
errall_ga_mraeM(15:17)=errall_ga_mrae(15:17);

load mccv_mrae_errs_Q1114_1000_5.mat
ga_mraeM(11:14)=ga_mrae(11:14);
errall_ga_mraeM(11:14)=errall_ga_mrae(11:14);

load mccv_mrae_errs_Q310_1000_5.mat
ga_mraeM(3:10)=ga_mrae(3:10);
errall_ga_mraeM(3:10)=errall_ga_mrae(3:10);

ga_mrae=ga_mraeM;
errall_ga_mrae=errall_ga_mraeM;

save('mccv_mrae_errs_Q326_1000_5','errall_ga_mrae','ga_mrae')




% *****

load mccv_mae_errs_Q57_1000_2.mat
ga_maeM=ga_mae;
errall_ga_maeM=errall_ga_mae;

load mccv_mae_errs_Q1_1000_2.mat
ga_maeM(1:4)=ga_mae(1:4);
errall_ga_maeM(1:4)=errall_ga_mae(1:4);





ga_mae=ga_maeM;
errall_ga_mae=errall_ga_maeM;
save('mccv_mae_errs_QM_1000_2','errall_ga_mae','ga_mae')