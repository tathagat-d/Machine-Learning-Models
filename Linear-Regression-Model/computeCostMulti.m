function J = computeCostMulti(X, y, theta)

% H = X * theta         gives the hypothesis.
% E = H - y             gives difference in prediction.
% E = E ^ 2             Takes the square of the error.
% S = sum(E)            Sums squared error.
% J = S / ( 2* m )      Gives the desired cost function.
% m                     Number of training  examples

m = length(y);

J = sum((X * theta - y) .^ 2 ) / ( 2 * m); 

end
