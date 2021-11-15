function [Q,kh]=find_Q_kh(x)
% Function for calculating the reaction coefficient based on OGY method

syms p q
[target,c,a,u,m,M,ep,d1,d2,b,v,~,qq]=param(x);
alpha=a*(u-p)/((p-m+ep)^d1*(M+ep-p)^d2);
beta=b*(p-v);
p_new=p+c*(alpha+beta+q);

kh=subs(diff(p_new,p),p,target)./c;
Q=[target-qq/kh;target+qq/kh];