function [x,fval,exitflag,output,population,score] = gga(nvars,lb,MaxStallGenerations_Data,FunctionTolerance_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'MaxStallGenerations', MaxStallGenerations_Data);
options = optimoptions(options,'FunctionTolerance', FunctionTolerance_Data);
options = optimoptions(options,'Display', 'final');
options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv });
options = optimoptions(options,'UseVectorized', true);
[x,fval,exitflag,output,population,score] = ...
ga(@(x)mean(abs(C*x'-vocvalppb)./vocvalppb),nvars,[],[],[],[],lb,[],[],[],options);
