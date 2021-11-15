function [target,c,a,u,m,M,ep,d1,d2,b,v,h,q,sigma]=param(x)
% function for setting parameters value in the SERD model

m=0;M=1;ep=0.01;d1=0.5;d2=0.5;q=0.744;c=1;

if x>=1 && x<=3
target=0.5;u=0.5;v=0.5;a=0.2;b=0.88;
else 
target=0.6;u=0.55;v=0.4;a=0.3;b=0.86;
end

if x==1 || x==4
    h=0;sigma=0;
elseif x==2 || x==5
    h=0.01;sigma=0;
else
    h=0.01;sigma=0.01;
end

if x==7
    target=0.8;
elseif x==8
    target=80;
elseif x==9
    target=0.8;
end