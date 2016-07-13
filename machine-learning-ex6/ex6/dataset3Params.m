function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
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

%as suggested in the pdf for the assignment try these
params = [0.01 0.03 0.1 0.3 1 3 10 30];

%from the note above, using this to compute the prediction errror
error_min=inf;
error=inf;
C_final = 0;
sigma_final = 0;

%double loop over C and sigmaaaaa
for C = params
  for sigma = params
  
  %train model with this particular sigma and C
   model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
   
   %compute prediction error
   predictions = svmPredict(model, Xval);
   error = mean(double(predictions ~= yval));
   
   %if statement to organize error
   if (error<=error_min)
    C_final = C;
    sigma_final = sigma;
    error_min=error;
   end
  end
 end
 
 C=C_final;
 sigma=sigma_final;


fprintf('Best value C, sigma = [%f %f] with prediction error = %f\n', C, sigma, error_min);


% =========================================================================

end