function [p_new,alpha,beta,delta]=map_no_inter(p,x)
% Function for mapping with no intervations

r=gbm(0.2,0.4);[~,~,w]=simulate(r,1);
r=gbm(0,0.3);[~,~,w2]=simulate(r,1);
[~,c,a,u,m,M,ep,d1,d2,b,v,h,~,sigma]=param(x);
delta=w*sigma;beta=b*(p-v)+h*w2;
if p>M
    p_new=M;alpha=0;
elseif p<m
    p_new=m;alpha=0;
else
    r=gbm(0.1,0.2);[~,~,w1]=simulate(r,1);
    alpha=a*(u-p)/((p-m+ep)^d1*(M+ep-p)^d2)+h*w1;
    gamma=0; 
    p_new=p+c*(alpha+beta+gamma+delta);
end

if p_new>1
    p_new=1;
elseif p_new<0
    p_new=0;
end