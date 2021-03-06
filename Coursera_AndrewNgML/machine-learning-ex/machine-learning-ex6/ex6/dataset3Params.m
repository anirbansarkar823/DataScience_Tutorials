function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

choices = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30;];
min_Error = Inf;
cur_C = Inf;
cur_sigma = Inf;

# finding that combination of C,sigma for which error is minimum
for i = 1:8 % i for C
	for j = 1:8 % j for sigma
		model = svmTrain(X, y, choices(i), @(x1, x2) gaussianKernel(x1, x2, choices(j))); 
		predictions = svmPredict(model,Xval);
		error = mean(double(predictions ~= yval)); % ~= is the comparison operator; 1 if not-equal; 0 if equal
		if error < min_Error
			min_Error = error;
			cur_C = choices(i);
			cur_sigma = choices(j);
		end
	end
end		

C = cur_C;
sigma = cur_sigma;







% =========================================================================

end
