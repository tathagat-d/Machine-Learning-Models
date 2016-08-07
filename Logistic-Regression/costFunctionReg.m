function [J, grad] = costFunctionReg(theta, X, y, lambda)

m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% My stuff here.
% z = X * theta.
% h = g = sigmoid(z);
% y .* log(h) - ( 1 - y) .* log(1 - h);

% This looks scary. But always read the comment to break down the problem
J = sum(y .* log(sigmoid(X * theta)) + (1 - y) .* log(1 - sigmoid(X * theta)));

% without regularization
% J = -J/m;

% With regularization on J
J = -J/m + (lambda/(2 * m)) * (sum(theta .* theta) - theta(1) * theta(1));

% Need to compute gradient descent without regularization.
% grad = ( (sigmoid(X * theta) - y)' * X ) / m;

% With regularization
grad = ( (sigmoid(X * theta) - y)' * X + (lambda * theta)' ) / m;
% grad 1 should remain unaltered.
grad(1) = grad(1) - (lambda * theta(1) / m);

end
