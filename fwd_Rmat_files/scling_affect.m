clear all;
load ../../src_36.mat
% load ../../obs_2020_02_26_sep.mat
load ../vocvalppb.mat
load Rmat_fwd.mat
C=Rmat_fwd;options = optimoptions('fmincon');
options = optimoptions(options,'Display', 'off');
dd=vocvalppb;scl=[0.25:0.25:5];
for ii=1:length(scl)
    d=dd*scl(ii);
funchk = @(x) (C*x'-d);
funmse = @(x) norm(C*x'-d);
funmae = @(x) mean(abs(C*x'-d));
funmrae = @(x) mean(abs(C*x'-d)./d);


options = optimoptions(options,'Algorithm', 'sqp');
tic

    
% for ii=1:100
[xmrae_sqp(ii,:),~,~,~,~,~,~] = ...
    fmincon(funmrae,ones(1,36),[],[],[],[],zeros(1,36),[],[],options);
end
%%
figure(2761)
dtt=3;
for ii=1:dtt:length(scl)
    subplot(round(length(scl)/dtt),1,ceil(ii/dtt))
    stem(xmrae_sqp(ii,:));
end