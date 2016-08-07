function [X_norm, mu, sigma] = featureNormalize(X)

mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

m = size(X,1); % Number of rows
n = size(X,2); % number of column

% take the sum of all the features and divide by m.
mu = sum(X) / m;

% getting the standard devation for all features.
sigma = std(X);

% This should work for any number of features.
for iter = 1:n
	X_norm(:,iter) = (X(:,iter) - mu(1,iter)) / sigma(1,iter);
end

end
