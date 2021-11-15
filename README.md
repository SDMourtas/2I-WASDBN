# 2I-WASDBN
Implementation of a 3-layer feed-forward 2-input WASD-based neuronet (2I-WASDBN) model is introduced, for controlling chaos in stochastic exchange rate dynamics (SERD) under central bank intervention.\
The purpose of this package is to examine a machine learning approach as a control chaos method in order to stabilize the SERD model, and a comparison between the
machine learning approach and the DFC and OGY methods is offered.
By considering this problem's approach through neuronet and by using the weight direct determination (WDD) method, the novel WASD algorithm handles the fitting and validation of the 2I-WASDBN model throughout the training process by employing a power activation function.\
The main articles used are the followings:
*	S.D.Mourtas, V.N.Katsikis, E.Drakonakis, S.Kotsios, "Stabilization of Stochastic Exchange Rate Dynamics under Central Bank Intervention using a Weight Direct Determination Neuronet", (submitted)

# M-files Description
*	Main_2I_WASDBN.m: the main function
*	problem.m: input data and parameters of the MI-FUZWASDN
*	Problem_figures.m: figures illustrating the problem's findings
*	WASD.m: function for finding the optimal number of hidden-layer neurons, along with the optimal activation function power at each hidden-layer neuron
*	Qmatrix.m: function for calculating the matrix Q
*	predictN.m: function for predicting
*	error_pred.m: function for calculating the MAE, RMSE and R-squared of the prediction
*	trainSVM.mat: neural network model under SVM Fine Gaussian method
*	trainEGPR.mat: neural network model under Exponential GPR method
*	trainEBT.mat: neural network model under Ensemble Bagged Trees method

# Installation
*	Unzip the file you just downloaded and copy the 2I-WASDBN directory to a location,e.g.,/my-directory/
*	Run Matlab/Octave, Go to /my-directory/2I-WASDBN/ at the command prompt
*	run 'Main_2I_WASDBN (Matlab/Octave)

# Results
After running the 'Main_2I_WASDBN.m file, the package outputs are the following:
*	The optimal number of hidden-layer neurons.
*	The optimal activation function power of each hidden-layer neuron.
*	The prediction, simulation and statistics of the testing samples.
*	The graphic illustration of the testing and predicting performance.

# Environment
The 2I-WASDBN kit has been tested in Matlab 2018b on OS: Windows 10 64-bit.
