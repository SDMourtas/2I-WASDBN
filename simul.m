function simul(H,W,N,x)
% market simulation under the SERD model

stint=100; % start intervirance
total=200;p=zeros(total,1);p(1)=0.7;
p_DFC=zeros(total,1);p_DFC(1)=p(1);g_DFC=zeros(total-1,1);
p_OGY=zeros(total,1);p_OGY(1)=p(1);g_OGY=zeros(total-1,1);
p_WASD=zeros(total,1);p_WASD(1)=p(1);g_WASD=zeros(total-1,1);
[target,~,~,~,~,~,~,~,~,~,~,~,~,sigma]=param(x);
k=find_k(x);[Q,kh]=find_Q_kh(x);
for t=1:total-1
    
% No interventions  
p(t+1)=map_no_inter(p(t),x);

if t>stint

% stochastic noises
r=gbm(0.2,0.4);[~,~,w]=simulate(r,1);delta=w*sigma;
r=gbm(0.1,0.2);[~,~,w1]=simulate(r,1);r=gbm(0,0.3);[~,~,w2]=simulate(r,1);

% The delayed feedback control method (DFC): Targeting long run fundamentals
[p_DFC(t+1),g_DFC(t)]=map_DFC(p_DFC(t),t,delta,x,k,stint,w1,w2);


% The OGY method
[p_OGY(t+1),g_OGY(t)]=map_OGY(p_OGY(t),t,delta,x,Q,kh,stint,w1,w2);


% The 2I-WASDBN method
[p_WASD(t+1),g_WASD(t)]=map_2I_WASDBN(p_WASD(t),t,delta,x,H,W,N,stint,w1,w2);

else
    p_DFC(t+1)=p(t+1);p_OGY(t+1)=p(t+1);p_WASD(t+1)=p(t+1);
end

end

figure
Y=[sum(abs(target-p_DFC(stint+1:end)));sum(abs(target-p_OGY(stint+1:end)));...
    sum(abs(target-p_WASD(stint+1:end)))];
bar(Y);
text(1:length(Y),Y,num2str(Y),'vert','bottom','horiz','center'); 
box on
ylabel('Distortion in the Market')
xlabel('Chaos Control Method')
xticklabels({'DFC','OGY','2I-WASDBN'})
hold off

figure
plot(1:stint,p(1:stint),'k');hold on
plot(stint:total,[p(stint);p_DFC(stint+1:total)])
plot(stint:total,[p(stint);p_OGY(stint+1:total)],':')
plot(stint:total,[p(stint);p_WASD(stint+1:total)],'-.')
xlabel('$t$','Interpreter','latex');
ylabel('$P_{t+1}$','Interpreter','latex')
legend('No interventions','DFC','OGY','2I-WASDBN')
hold off

figure
plot(1:total-1,g_DFC);hold on
plot(1:total-1,g_OGY,':')
plot(1:total-1,g_WASD,'-.')
xlabel('$t$','Interpreter','latex');
ylabel('$\gamma(P_{t})$','Interpreter','latex')
legend('DFC','OGY','2I-WASDBN')
hold off

for i=2:total-1
    g_DFC(i)=g_DFC(i)+g_DFC(i-1);
    g_OGY(i)=g_OGY(i)+g_OGY(i-1);
    g_WASD(i)=g_WASD(i)+g_WASD(i-1);
end

figure
plot(1:total-1,g_DFC);hold on
plot(1:total-1,g_OGY,':')
plot(1:total-1,g_WASD,'-.')
xlabel('$t$','Interpreter','latex');
ylabel('$\sum\gamma(p_t)$','Interpreter','latex')
legend('DFC','OGY','2I-WASDBN')
hold off