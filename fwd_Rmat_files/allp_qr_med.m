for ii=1:20
   xx=S_nn{ii};
   xxallp(ii)=mean(iqr(xx));
end
xxmed10=median(S_nn{10});
xxmed5=median(S_nn{5});


for ii=1:20
   zz=sest_mrae{ii};
   zzallp(ii)=mean(iqr(zz));
end
zzmed10=median(sest_mrae{10});
zzmed5=median(sest_mrae{5});

load('mccv_mrae_errs_Q326_1000_5.mat')
for ii=1:26
   aa=ga_mrae{ii};
   aaallp(ii)=mean(iqr(aa));
end
aamed10=median(ga_mrae{10});
aamed5=median(ga_mrae{5});

load('mccv_mrae_errs_Q18_1000_2.mat')
for ii=1:8
   aa2=ga_mrae{ii};
   aa2allp(ii)=mean(iqr(aa2));
end
aa2med10=median(ga_mrae{8});
aa2med5=median(ga_mrae{5});


load('mccv_mrae_errs_Q310_1000_10.mat')
for ii=1:10
   aaN2=ga_mrae{ii};
   aaN2allp(ii)=mean(iqr(aaN2));
end
aaN2med10=median(ga_mrae{10});
aaN2med5=median(ga_mrae{5});


load('mccv_mrae_errs_Q66_1000_10.mat')
for ii=6:6
   aa3=ga_mrae{ii};
   aa3allp(ii)=mean(iqr(aa3));
end
aamed6=median(ga_mrae{6});
aamed5=median(ga_mrae{5});


load('mccv_mae_errs_Q113M_1000_2.mat')
for ii=1:13
   bb=ga_mae{ii};
   bballp(ii)=mean(iqr(bb));
end
bbmed10=median(ga_mae{10});
bbmed5=median(ga_mae{5});


load('mccv_mse_errs_Q18_1000_2.mat')
for ii=1:8
   cc=ga_mse{ii};
   ccallp(ii)=mean(iqr(cc));
end
ccmed10=median(ga_mse{8});
ccmed5=median(ga_mse{5});


figure(243)
hold on;plot(aaallp,'b','DisplayName','gamrae');plot(bballp,'m','DisplayName','gamae');
plot(ccallp,'g','DisplayName','gamse');plot(aa2allp,'k','DisplayName','gamrae2');plot(aaN2allp,'k-*','DisplayName','gamrae2');
plot(zzallp,'r','DisplayName','mrae');hold on;
plot(xxallp,'k--','DisplayName','mse');



legend

figure(2)
subplot(2,1,1)
hold on;plot(aamed5,'b','DisplayName','gamrae');plot(bbmed5,'m','DisplayName','gamae');
plot(ccmed5,'g','DisplayName','gamse');
plot(zzmed5,'r','DisplayName','mrae');hold on;
plot(xxmed5,'k','DisplayName','mse');legend

subplot(2,1,2)

% figure(2)
hold on;plot(aamed10,'b--','DisplayName','gamrae');
hold on;plot(aa2med10,'b-*','DisplayName','gamrae2');
hold on;plot(aamed6,'r-*','DisplayName','gamrae2');

% ;plot(bbmed10,'m--','DisplayName','gamae');
% plot(ccmed10,'g--','DisplayName','gamse');
% plot(zzmed10,'r--','DisplayName','mrae');hold on;
% plot(xxmed10,'k--','DisplayName','mse');
legend

