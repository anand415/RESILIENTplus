function figiqr_allp(Svarf)



figure(24)
plot([1:8],Svarf(1,:),'r-*','DisplayName','NN');hold on;
plot([1:8],Svarf(2,:),'g-*','DisplayName','MAE')
plot([1:8],Svarf(3,:),'b-*','DisplayName','MRAE')
