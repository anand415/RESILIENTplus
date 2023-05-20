% function [x,fval,exitflag,output,lambda,grad,hessian] = actveset(x0,lb,MaxFunctionEvaluations_Data,OptimalityTolerance_Data,ConstraintTolerance_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fmincon');
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'MaxFunctionEvaluations', 10000);
% options = optimoptions(options,'OptimalityTolerance', OptimalityTolerance_Data);
% options = optimoptions(options,'FunctionTolerance', OptimalityTolerance_Data);
options = optimoptions(options,'Algorithm', 'active-set');
% options = optimoptions(options,'ConstraintTolerance', ConstraintTolerance_Data);
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(@(x) 100*mean(abs(C*x'-vocvalppb)./vocvalppb),ones(1,36),[],[],[],[],zeros(1,36),[],[],options);



% SNN_fwd = lsqnonneg(R,d);
% opts.InitialPopulationMatrix = repmat(SNN_fwd',[1000 1]); % Add copies of initial value

[x,mae] = ga(fun,36,[],[],[],[],zeros(1,36),[],[],options);
	Sga=x;
