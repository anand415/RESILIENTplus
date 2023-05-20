% clear all
load mccv_mrae_errs_Q310_1000_10_E.mat
ga_m_mrae_tn10=ovrall_err_ga_mrae_train;
ga_m_mrae_ts10=ovrall_err_ga_mrae_test;
load mccv_mrae_errs_Q326_1000_5_E.mat
ga_m_mrae_tn5=ovrall_err_ga_mrae_train;
ga_m_mrae_ts5=ovrall_err_ga_mrae_test;
load mccv_mrae_errs_Q18_1000_2_E.mat
ga_m_mrae_tn2=ovrall_err_ga_mrae_train;
ga_m_mrae_ts2=ovrall_err_ga_mrae_test;


load mccv_mrae_errs_Q_Merge3.mat
ga_m_mrae_2ktn2=ovrall_err_ga_mrae_train;
ga_m_mrae_2kts2=ovrall_err_ga_mrae_test;

load mrae_AS_nn.mat
As_m_mrae_tn=ovrall_err_ga_mrae_trainn;
As_m_mrae_ts=ovrall_err_ga_mrae_testn;




xlim([3 26])
figure(212)

hold on;plot(ga_m_mrae_tn10,'b','DisplayName','gammraetn10');plot(ga_m_mrae_tn5,'m','DisplayName','gammraetn5');
plot(ga_m_mrae_tn2,'g','DisplayName','gammraetn2');
plot(As_m_mrae_tn,'k','DisplayName','Asmmraetn');



hold on;plot(ga_m_mrae_ts10,'b*-','DisplayName','gammraets10');plot(ga_m_mrae_ts5,'m*-','DisplayName','gammraets5');
plot(ga_m_mrae_ts2,'g*-','DisplayName','gammraets2');
plot(As_m_mrae_ts,'k*-','DisplayName','Asmmraets');
legend

% ylim([0.5 0.55])