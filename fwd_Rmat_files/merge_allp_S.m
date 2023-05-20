clear s_mraeM errall_s_mraeM

load  s_mrae_5k_12A16_E.mat
s_mraeM([12,16])=S_mrae5k([12,16]);
errall_s_mraeM([12,16])=errall_mrae5k([12,16]);


load  s_mrae_5k_1718_E.mat
s_mraeM(17:18)=S_mrae5k(17:18);
errall_s_mraeM(17:18)=errall_gmrae5k(17:18);


load  s_mrae_5k_1315_E.mat
s_mraeM(13:15)=S_mrae5k(13:15);
errall_s_mraeM(13:15)=errall_mrae5k(13:15);


S_mrae=s_mraeM;
errall_S_mrae=errall_s_mraeM;

save('mccv_mrae_S_5k','S_mrae','errall_S_mrae')


