%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A 2-input 3-layer feed-forward neuronet model, trained by a WASD %
%  algorithm. (version 1.0)                                         %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: S.D.Mourtas, V.N.Katsikis,                %
%                         E.Drakonakis, S.Kotsios                   %
%                                                                   %
%   e-Mail: spirosmourtas@gmail.com                                 %
%           vaskatsikis@econ.uoa.gr                                 %
%           manosdrakwnakhs@gmail.com                               %
%           skotsios@econ.uoa.gr                                    %
%                                                                   %
%   Main paper: S.D.Mourtas, V.N.Katsikis, E.Drakonakis, S.Kotsios  %
%               "Stabilization of Stochastic Exchange Rate Dynamics %
%               under Central Bank Intervention using a Weight      %
%               Direct Determination Neuronet",(submitted)          %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

x=1; % select scenario (x: 1 to 6)

[X_train,Y_train,X_test,Y_test,p,YY]=problem(x);
[G,H]=size(X_train);
dmax=31; % maximum number of hidden-layer

%% Training

% Neuronet model
tic
[W,Em,N,E]=WASD(X_train,Y_train,G,H,p,dmax); % 2I-WASDBN optimal hidden-layer structure
toc
tic
EGPRModel=trainEGPR([X_train,Y_train]);      % Exponential GPR model 
toc
tic
EBTModel=trainEBT([X_train,Y_train]);        % Ensemble Bagged Trees model 
toc
tic
SVMModel=trainSVM([X_train,Y_train]);        % SVM Fine Gaussian model 
toc

%% Predict
pred=predictNN(X_test,H,W,N);                % 2I-WASDBN prediction
predEGPR = EGPRModel.predictFcn(X_test);     % EGPR prediction
predEBT = EBTModel.predictFcn(X_test);       % EBT prediction
predSVM = SVMModel.predictFcn(X_test);       % SVM prediction

Et=error_pred(pred,predEGPR,predEBT,predSVM,Y_test); % Error of test data

%% Figures
Problem_figures(pred,predEGPR,predEBT,predSVM,X_test,Y_test,E,N,YY,x)

%% Simulation
simul(H,W,N,x)