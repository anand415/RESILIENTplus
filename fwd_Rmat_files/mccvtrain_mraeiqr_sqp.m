function [x1,errall_ga_mrae]=mccvtrain_mraeiqr_sqp(ii,Ctrain)
load Rmat_fwd.mat
load ../vocvalppb.mat
load alldata_corr.mat
% rng default
C=Rmat_fwd;
d=vocvalppb;
kk=1;
CCtrain=Ctrain{ii};
tic
options = optimoptions('fmincon');
options = optimoptions(options,'Display', 'off');
% options = optimoptions(options,'MaxFunctionEvaluations', 5000);
% options = optimoptions(options,'OptimalityTolerance', OptimalityTolerance_Data);
% options = optimoptions(options,'FunctionTolerance', OptimalityTolerance_Data);
options = optimoptions(options,'Algorithm', 'sqp');
fun = @(x) (abs(C*x'-d));
% options.UseParallel=1;
for jj=1:length(CCtrain)
    
Nind=CCtrain(jj,:);
allsetN=true(1,length(vocvalppb));allsetN(Nind)=0;
Ctr{jj}=Rmat_fwd([Nind],:);
dtr{jj}=vocvalppb([Nind]);
iqrVV{jj}=iqrV([Nind])';

% if mod(jj,500)==1
    
% end
[x1{jj},fval1,~,~,~,~,~] = ...
fmincon(@(x) 100*mean(abs(Ctr{jj}*x'-dtr{jj})./iqrVV{jj}),ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
tmm=fun(x1{jj});
    errall_ga_mrae(jj,:)=tmm;
%     errall_ga_mrae(jj,:)=tmm;

end
toc

end