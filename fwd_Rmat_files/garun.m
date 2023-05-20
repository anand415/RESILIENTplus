% function [x,fval,exitflag,output,population,score] = garun(nvars,lb,MaxStallGenerations_Data,FunctionTolerance_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
tic
load Rmat_fwd.mat
load ../vocvalppb.mat

% rng default
C=Rmat_fwd;
d=vocvalppb;
tic
toc
% options = optimoptions('fmincon');
% options = optimoptions(options,'Display', 'off');
% options = optimoptions(options,'MaxFunctionEvaluations', 10000);
% % options = optimoptions(options,'OptimalityTolerance', OptimalityTolerance_Data);
% % options = optimoptions(options,'FunctionTolerance', OptimalityTolerance_Data);
% options = optimoptions(options,'Algorithm', 'active-set');
% [x1,fval1,exitflag,output,lambda,grad,hessian] = ...
% fmincon(@(x) 100*mean(abs(C*x'-vocvalppb)./vocvalppb),ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
% tic
fun = @(x) (C*x'-d);

options = optimoptions('ga');
% options = optimoptions(options,'MaxGenerations', 5000);
% options = optimoptions(options,'FunctionTolerance', 1e-6);
% options = optimoptions(options,'Display', 'final');
% options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv });
options = optimoptions(options,'UseVectorized', true);
% options = optimoptions(options,'UseParallel', true);

for yy=1:200
rng(1,'twister')
options.resetoptions('InitialPopulationMatrix');
[x11,fval2,exitflag,~,population,~] = ...
ga(@(x) 100*mean(abs(C*x'-vocvalppb)./vocvalppb),36,[],[],[],[],zeros(1,36),[],[],[],options);
% [x1s,fvals]=fmincon(@(x) 100*mean(abs(C*x'-vocvalppb)./vocvalppb),ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
toc

% stream = RandStream.getGlobalStream;
% stream.State = output.rngstate.State;
fval2
for ii=1:20
    x2=x11;
options.InitialPopulationMatrix = population;
[x2,fval3,exitflag,output,population,score] = ...
ga(@(x) 100*mean(abs(C*x'-vocvalppb)./vocvalppb),36,[],[],[],[],zeros(1,36),[],[],[],options);
fval3
end
err1=fun(x11);
err2=fun(x2);

cfv2=mean(abs(err2))
cfv1=mean(abs(err1))
mn2(yy)=mean(abs(err1));

rng(2,'twister')

options = optimoptions('ga');
% options = optimoptions(options,'MaxGenerations', 5000);
% options = optimoptions(options,'FunctionTolerance', 1e-6);
% options = optimoptions(options,'Display', 'final');
% options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv });
options = optimoptions(options,'UseVectorized', true);

for ii=1:20
%     options.InitialPopulationMatrix = [];
% 
[x1(ii,:)] =ga(@(x) 100*mean(abs(C*x'-vocvalppb)./vocvalppb),36,[],[],[],[],zeros(1,36),[],[],[],options);
% end
% ttm=(x1(ii,:));
err1=fun(x1(ii,:));
ccv2(ii)=mean(abs(err1));
end
%     errall_ga_mrae(jj,:)=tmm;
toc
% for ii=1:10
% options.InitialPopulationMatrix = x2;
% [x2,fval3,exitflag,output,population,score] = ...
% ga(@(x) 100*mean(abs(C*x'-vocvalppb)./vocvalppb),36,[],[],[],[],zeros(1,36),[],[],[],options);
% end
toc
