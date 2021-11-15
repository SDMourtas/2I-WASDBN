function [W,Em,N,E]=WASD(X,Y,G,M,p,dmax)
% function for finding the optimal hidden-layer neurons weights of the
% neuronet

% Initialization
N=[]; % the neurons number of the hidden layer (i.e., hidneurons)
Em=inf; E=zeros(dmax,1);
G1=round(p*G); % size of data fitting
G2=G-G1; % size of data validation

for d=0:dmax-1
% WDD Method
Q=Qmatrix(X,M,G,[N;d]);
W=pinv(Q(1:G1,:))*Y(1:G1); 
Ev=sqrt(sum((Q(G1+1:G,:)*W-Y(G1+1:G)).^2)/G2); % RMSE
E(d+1)=min(Ev);
if E(d+1)<Em
    Em=E(d+1);N=[N;d];
end
end

% output
Q=Qmatrix(X,M,G,N);
W=pinv(Q)*Y; 