function X_rec = recoverData(Z, U, K)
               

% ====================== YOUR CODE HERE ======================

X_rec = zeros(size(Z, 1), size(U, 1));
U_reduce = U(:,1:K);
X_rec = Z * U_reduce';

% =============================================================

end
