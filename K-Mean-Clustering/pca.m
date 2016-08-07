function [U, S] = pca(X)

% =========================================================================

% MY CODE HERE
[m, n] = size(X);
U = zeros(n);
S = zeros(n);
% covariance matrix of dimension n X n
sigma = ( 1 / m ) * X' * X;

% Using SVD to compute U, S and V
[ U S V ] = svd(sigma);

% END OF MY CODE.

% =========================================================================

end
