function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
[m n] = size(X);

% You need to return the following variables correctly.
idx = ones(size(X,1), 1);
sq_dis =[];

for i = [1:m]
  dis=0;
  for j =[1:n]
    dis+=(X(i,j)-centroids(1,j))^2;
  endfor
  sq_dis = [sq_dis; dis];
endfor


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for i=[1:m]
  for j = [2:K]
    dis=0;
    for c=[1:n]
      dis+=(X(i,c)-centroids(j,c))^2;
    endfor

    if dis<sq_dis(i)
      sq_dis(i)=dis;
      idx(i)=j;
    endif
  endfor
endfor

% =============================================================

end

