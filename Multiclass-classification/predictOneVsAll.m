function p = predictOneVsAll(all_theta, X)

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

temp = sigmoid( X * all_theta');
temp = temp';

% here b will correspond to the class where this input belongs to.
[ a b ] = max(temp);
% taking transpose of the output.
p = b';
end
