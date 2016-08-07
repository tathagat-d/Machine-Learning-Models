function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)

% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% Identifying how it is learning.
for i = 1 : m
	% Training set size for i
	localX = X(1:i,:);
	localy = y(1:i);
	localm = size(localX,1);
	% Obtaining the hypothesis with i training examples.
	theta = trainLinearReg(localX,localy,lambda);
	%Compute error in training and validation.
	error_train(i) = sum((localX * theta - localy) .^ 2) / (2 * localm);
	error_val(i)   = sum((Xval * theta - yval) .^ 2) / (2 * size(Xval,1));
end % End of for loop.

end
