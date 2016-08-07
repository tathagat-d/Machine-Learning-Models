function centroids = kMeansInitCentroids(X, K)

% =============================================================

centroids = zeros(K, size(X, 2));

% Using random permutations to obtain set of random IDs.
randidx = randperm(size(X,1));
% Choose K of those random IDs.
centroids = X(randidx(1:K),:);

% =============================================================

end

