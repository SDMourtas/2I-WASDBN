function gamma=predictNN(X,M,W,N)
% function for predicting

Q=Qmatrix(X,M,size(X,1),N);
gamma=Q*W; 