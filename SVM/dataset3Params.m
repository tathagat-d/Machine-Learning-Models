function [C, sigma] = dataset3Params(X, y, Xval, yval)

C = [ 0.01 0.03 0.1 0.3 1 3 10 30]';
sigma  = [ 0.01 0.03 0.1 0.3 1 3 10 30]';
predictionError = zeros(size(C,1),size(sigma,1));

for i = 1 : size(C,1)
	localC = C(i);
	for j = 1 : size(sigma,1)
		localSigma = sigma(j);
		% Calculate training error and validation error with localC and
		% localSigma.
		% Model with localC and localSigma
		model= svmTrain(X, y, localC, @(x1, x2) gaussianKernel(x1, x2, localSigma));
		predictions = svmPredict(model,Xval);
		predictionError(i,j) = mean(double(predictions ~= yval));
	end
end

% Obtaining the minimum for each row
% a gives the values
% b gives the index.
[a b] = min(predictionError);
[c column] = min(a);
row = b(column);

% Obtaining the values for C and sigma
C = C(row);
sigma = sigma(column);

% =========================================================================

end
