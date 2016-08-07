function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
% First we need to fit in the derivative in terms of matrix
% E = ( X * theta - y )		Error [ a row vector ]
% E = E' * X			Multiply to get n dimesional vector
% D = alpha * E/ m;		Derivative
% theta = theta - D;		New values of theta
m = length(y);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
	D = alpha * ((X * theta  - y)' * X / m);
	theta = theta - D';
	% Save the cost J in every iteration    
	J_history(iter) = computeCost(X, y, theta);
end

end
