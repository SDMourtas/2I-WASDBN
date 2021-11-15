function [p,alpha,beta,delta]=no_inter(x)
% function for the SERD model simulation with no intervations

total=1e3;
p=zeros(total+1,1);p(1)=0.7;
alpha=zeros(total-1,1);beta=alpha;delta=alpha;
for t=1:total
    [p(t+1),alpha(t),beta(t),delta(t)]=map_no_inter(p(t),x);
end
p=p(1:end-1);