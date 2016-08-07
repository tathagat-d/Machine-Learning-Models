function idx = findClosestCentroids(X, centroids)

% Set K and idx
K = size(centroids, 1);
idx = zeros(size(X,1), 1);

% MY CODE
m = size(X,1);
local_cost = zeros(K,1);
for i = 1 : m
	% Figure out to what centroid ith example belongs.
	% Computing the cost for each centroid
	for j = 1 : K
		local_cost(j) = sum((X(i,:) - centroids(j,:)) .^ 2);
	end
	% J is the minimum cost and idx(i) gives K.
	[ J idx(i) ] = min(local_cost);
end
% END OF MY CODE
% =============================================================

end

