function [x,fval,exitflag,output,population,score] = untitled(nvars,lb)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'UseVectorized', false);
options = optimoptions(options,'UseParallel', true);
[x,fval,exitflag,output,population,score] = ...
ga(@(x)mean(abs(C*x'-vocvalppb)./vocvalppb),nvars,[],[],[],[],lb,[],[],[],options);
