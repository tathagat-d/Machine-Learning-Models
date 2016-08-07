function [J, grad] = costFunction(theta, X, y)

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
J = -J/m;

% Need to compute gradient descent
grad = ( (sigmoid(X * theta) - y)' * X ) / m;
end
