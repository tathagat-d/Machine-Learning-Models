function Z = projectData(X, U, K)

% =============================================================

% MY CODE HERE.
% Because we are reducing to K parameters only.
Z = zeros(size(X, 1), K);
U_reduce = U(:,1:K);

% Computing the projection.
Z = X * U_reduce;

% END OF MY CODE.

% =============================================================

end
