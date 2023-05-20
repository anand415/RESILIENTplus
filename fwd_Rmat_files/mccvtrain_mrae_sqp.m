function [x1,errall_ga_mrae]=mccvtrain_mrae_sqp(ii,Ctrain)
load Rmat_fwd.mat
load ../vocvalppb.mat
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
    tic
Nind=CCtrain(jj,:);
allsetN=true(1,length(vocvalppb));allsetN(Nind)=0;
Ctr{jj}=Rmat_fwd([Nind],:);
dtr{jj}=vocvalppb([Nind]);
% if mod(jj,500)==1
    
% end
[x1{jj},fval1,~,~,~,~,~] = ...
fmincon(@(x) 100*mean(abs(Ctr{jj}*x'-dtr{jj})./dtr{jj}),ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
tmm=fun(x1{jj});
    errall_ga_mrae(jj,:)=tmm;
%     errall_ga_mrae(jj,:)=tmm;
toc
end
toc

end