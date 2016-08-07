function [lambda_vec, error_train, error_val] = ...
    validationCurve(X, y, Xval, yval)

% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

m1 = size(X,1);
m2 = size(Xval,1);

for i = 1 : size(lambda_vec,1);
	lambda = lambda_vec(i);
	% Obtain the hypothesis for the given value of lambda.
	theta = trainLinearReg(X,y,lambda);
	% use theta to compute training error and validation error.
	error_train(i) = sum((X * theta - y) .^ 2) / (2 * m1);
	error_val(i)   = sum((Xval * theta - yval) .^ 2) / (2 * m2);
end % end of my for loop.

end
