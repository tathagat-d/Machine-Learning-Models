function [all_theta] = oneVsAll(X, y, num_labels, lambda)
% ith row in all_theta is the classifier parameter for class i.

% Some useful variables
[m n] = size(X);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

options = optimset('GradObj', 'on', 'MaxIter', 50);
for i =1:num_labels
	initial_theta = zeros(n + 1,1);
%	[all_theta(i,:),cost] = ...
%		fminunc(@(t)(lrCostFunction(t, X, y == i,lambda)),...
%			initial_theta, options);
	[all_theta(i,:)] = ...
		fmincg (@(t)(lrCostFunction(t, X, (y == i), lambda)), ...
			initial_theta, options);

end

end
