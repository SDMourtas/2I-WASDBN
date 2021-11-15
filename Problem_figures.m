function Problem_figures(pred,predEGPR,predEBT,predSVM,X,Y,E,N,YY,x)

[target,c]=param(x);
len=length(Y);pt1=X(:,1)+c*(sum(YY,2)+pred);
pt1_EGPR=X(:,1)+c*(sum(YY,2)+predEGPR);
pt1_EBT=X(:,1)+c*(sum(YY,2)+predEBT);
pt1_SVM=X(:,1)+c*(sum(YY,2)+predSVM);
[Ys,ind1]=sort(Y);[Xs,ind2]=sort(X(:,1));

figure
plot(1:len,pred(ind1),'Color',[0 0.4470 0.7410]);hold on
plot(1:len,predEGPR(ind1),':','Color',[0.8500 0.3250 0.0980]);
plot(1:len,predEBT(ind1),'-.','Color',[0.9290 0.6940 0.1250]);
plot(1:len,predSVM(ind1),':','Color',[0.4660 0.6740 0.1880]);
plot(1:len,Ys,'--k');xlim([1 len]);xt=xticks;xticks([1,xt])
xlabel('Samples');ylabel('$\gamma(P_{t})$','Interpreter','latex')
legend('2I-WASDBN Prediction','EGPR Prediction',...
    'EBT Prediction','SVM Prediction','Target')
hold off

figure
plot(1:len,Xs,'Color',[0.4940 0.1840 0.5560]);hold on
plot(1:len,pt1(ind2),'Color',[0 0.4470 0.7410])
plot(1:len,pt1_EGPR(ind1),':','Color',[0.8500 0.3250 0.0980]);
plot(1:len,pt1_EBT(ind1),'-.','Color',[0.9290 0.6940 0.1250]);
plot(1:len,pt1_SVM(ind1),':','Color',[0.4660 0.6740 0.1880]);
plot(1:len,target*ones(len,1),'--k');xlim([1 len]);xt=xticks;xticks([1,xt])
xlabel('Samples');ylabel('$P_{t+1}$','Interpreter','latex')
legend('No intervention','2I-WASDBN intervention','EGPR intervention',...
    'EBT intervention','SVM intervention','Target')
hold off

figure
plot(1:len,YY(ind2,1));hold on
plot(1:len,YY(ind2,2));
plot(1:len,YY(ind2,3));
legend('$\alpha(P_{t})$','$\beta(P_{t})$','$\delta(P_{t})$','Interpreter','latex')
xlabel('Samples');ylabel('Net Orders');xlim([1 len]);xt=xticks;xticks([1,xt])
hold off

figure
semilogy(0:length(E)-1,E,'DisplayName','Error on investors Net Orders')
hold on
semilogy(N,E(N+1),'.','Color',[0.8500 0.3250 0.0980],...
    'MarkerSize',16,'DisplayName','$v$')
set(legend,'Interpreter','latex')
xlabel('$N$','Interpreter','latex');
ylabel('RMSE')
legend
hold off