function centroids = computeCentroids(X, idx, K)

% =============================================================

% MY CODE HERE
[m n] = size(X);
centroids = zeros(K, n);
count     = zeros(K,1);

% For each and every example
for i = 1 : m
	% Because X(i,:) belongs to class idx(i)
	centroids(idx(i),:) = centroids(idx(i),:) + X(i,:);
	% Increasing the count of that cluster.
	count(idx(i)) = count(idx(i)) + 1;
end

% Take the mean of the centroids.
for i = 1 : K
	for j = 1 : n
		centroids(i,j) = centroids(i,j) / count(i);
	end
end
% END OF MY CODE.

% =============================================================

end
