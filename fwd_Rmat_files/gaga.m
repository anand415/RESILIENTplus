function [x,fval,exitflag,output,population,score] = gaga(nvars)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
[x,fval,exitflag,output,population,score] = ...
ga(@(x)100*mean(abs(C*x'-vocvalppb)./vocvalppb),nvars,[],[],[],[],[],[],[],[],options);
