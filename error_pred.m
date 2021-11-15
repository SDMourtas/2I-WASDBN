function E=error_pred(X,XEGPR,XEBT,XSVM,Y)
% Function for calculating the models statistics

yh=mean(X); 
SStot=sum((X-yh).^2);
SSres=sum((X-Y).^2);
R2=1-SSres/SStot; % R-squared
fprintf('The R-squared of the 2I-WASDBN model on the test data is: %f \n',R2) 

R=X-Y; Z=length(R);
E=sum(abs(R))/Z; % MAE
fprintf('The MAE of the 2I-WASDBN model on the test data is: %f \n',E)

E=sqrt(sum(R.^2)/Z); % RMSE
fprintf('The RMSE of the 2I-WASDBN model on the test data is: %f \n',E)


yh=mean(XEGPR); 
SStot=sum((XEGPR-yh).^2);
SSres=sum((XEGPR-Y).^2);
R2=1-SSres/SStot; % R-squared
fprintf('The R-squared of the EGPR model on the test data is: %f \n',R2) 

R=XEGPR-Y; Z=length(R);
E=sum(abs(R))/Z; % MAE
fprintf('The MAE of the EGPR model on the test data is: %f \n',E)

E=sqrt(sum(R.^2)/Z); % RMSE
fprintf('The RMSE of the EGPR model on the test data is: %f \n',E)


yh=mean(XEBT); 
SStot=sum((XEBT-yh).^2);
SSres=sum((XEBT-Y).^2);
R2=1-SSres/SStot; % R-squared
fprintf('The R-squared of the EBT model on the test data is: %f \n',R2) 

R=XEBT-Y; Z=length(R);
E=sum(abs(R))/Z; % MAE
fprintf('The MAE of the EBT model on the test data is: %f \n',E)

E=sqrt(sum(R.^2)/Z); % RMSE
fprintf('The RMSE of the EBT model on the test data is: %f \n',E)


yh=mean(XSVM); 
SStot=sum((XSVM-yh).^2);
SSres=sum((XSVM-Y).^2);
R2=1-SSres/SStot; % R-squared
fprintf('The R-squared of the SVMFG model on the test data is: %f \n',R2) 

R=XSVM-Y; Z=length(R);
E=sum(abs(R))/Z; % MAE
fprintf('The MAE of the SVMFG model on the test data is: %f \n',E)

E=sqrt(sum(R.^2)/Z); % RMSE
fprintf('The RMSE of the SVMFG model on the test data is: %f \n',E)