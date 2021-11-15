function [p_new,gamma]=map_DFC(p,t,delta,x,kk,stint,w1,w2)
% Function for mapping with intervations under the DFC method

[target,c,a,u,m,M,ep,d1,d2,b,v,h]=param(x);
if p>M
    p_new=M;
    gamma=0;
elseif p<m
    p_new=m;
    gamma=0;
else
    if t>stint
        k=kk;
    else
        k=0;
    end
    alpha=a*(u-p)/((p-m+ep)^d1*(M+ep-p)^d2)+h*w1;
    beta=b*(p-v)+h*w2;
    gamma=k*(target-p); 
    p_new=p+c*(alpha+beta+gamma+delta);
end

if p_new>1
    p_new=1;
elseif p_new<0
    p_new=0;
end