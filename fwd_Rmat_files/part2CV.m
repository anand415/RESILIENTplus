clear SS_q1 SS_q3 SS_q2 qcd_ss qcd_ssal
load mccv_sqp_mrae_5kn.mat
load xmrae_sqp.mat
for ii=8:18
SS=cell2mat(sqp_mrae{1,ii}');
actvind=find(xmrae_sqp>0.001);
atctv=SS(:,xmrae_sqp>0.001);
SS_q1(ii,:)=prctile(atctv,25);
SS_q2(ii,:)=prctile(atctv,50);
SS_q3(ii,:)=prctile(atctv,75);
qcd_ssal(ii,:)=(SS_q3(ii,:)-SS_q1(ii,:))./(2+(SS_q3(ii,:)+SS_q1(ii,:)));
end

qcd_ss=(SS_q3(end,:)-SS_q1(end,:))./(1.8+(SS_q3(end,:)+SS_q1(end,:)));
qcd_ssC=(SS_q3(end,:)-SS_q1(end,:))./((SS_q3(end,:)+SS_q1(end,:)));
actvind(~(qcd_ss<=0.3))
iqr_ss=iqr(atctv);
% actvind(~(iqr_ss<1))
%%
% find(~(qcd_ss<0.85))
figure(675)
for jj=9:16
%     actvind(jj)
plot([9:16],SS_q1(9:end,jj),'r','DisplayName',sprintf('SS_q1_%d',jj));hold on
plot([9:16],SS_q3(9:end,jj),'b','DisplayName',sprintf('SS_q3_%d',jj));
% hold off
end



for jj=13:16
%     actvind(jj)
SS_q3(13:16,:)-SS_q1(13:16,:);
end



