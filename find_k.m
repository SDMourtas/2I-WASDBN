function kk=find_k(x)
% Function for calculating the reaction coefficient based on DFC method

syms p k
[target,c,a,u,m,M,ep,d1,d2,b,v]=param(x);
alpha=a*(u-p)/((p-m+ep)^d1*(M+ep-p)^d2);
beta=b*(p-v);
p_new=p+c*(alpha+beta+k*(target-p));

r=solve(abs(diff(p_new,p))<1,k);
kk=subs(r,p,target);

if kk<0
    kk=0;
end