function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% Cost without regularization.
J = sum((X * theta - y) .^ 2) / (2 * m);
% Applying regularization.
J = J + (lambda/(2 * m)) * (sum(theta .^ 2) - theta(1) .^ 2);

% Computing gradients without regularization.
grad = ((X * theta -y)' * X) / m;
% With regularization.
grad = grad' + (lambda/m) * theta;
grad(1) = grad(1) - (lambda/m) * theta(1);
grad = grad(:);

end
