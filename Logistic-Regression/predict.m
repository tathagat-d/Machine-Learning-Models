function p = predict(theta, X)

m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);

% First we compute hypothesis H(x)
% This prediction decides the classification.
% If threshold is probability 0.5 then every prediction with probability
% greater than 0.5 is classified as class y == 1
% otherwise they belong to class 0.
p = sigmoid(X * theta) >= 0.5;

end
