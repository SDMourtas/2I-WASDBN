function [X_train,Y_train,X_test,Y_test,p,Y_test_final]=problem(x)
% Input and preparation of the training and testing data for the 2I-WASDBN model

[target,c]=param(x);
[price,alpha,beta,delta]=no_inter(x);
Y=(target-price)/c-(alpha+beta+delta);
T=[Y,price,target-price,alpha,beta,delta];

% training-testing data
p=0.75;col1=1;col2=2:3;
train_row=1:round(size(T,1)/2); test_row=round(size(T,1)/2)+1:size(T,1); 
X_train=T(train_row,col2); Y_train=T(train_row,col1);
X_test=T(test_row,col2); Y_test=T(test_row,col1);Y_test_final=T(test_row,4:end);