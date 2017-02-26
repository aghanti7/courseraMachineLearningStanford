function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% distance matrix
dist = zeros(size(X,1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% for each centroid ...
for i = 1:K
    % compute distance for each X (vectorized) from the centroid
    dist(:, i) = sum((X - centroids(i, :)).^2, 2);
end

[minDist, idx] = min(dist, [], 2);

% this wont work; min returns last index in case of duplicate minimums
%for i = 1:size(X,1)
    % get the min of (Xi - MUi)^2 and taking row sums
    %[minX, minIdx] = min(sum((X(i,:) - centroids).^2, 2));
    
    % minX has the row index of the min
    % in case of multiple centroids being equidistant, take the first one
    %idx(i) = minIdx(1);
%end

% =============================================================

end

