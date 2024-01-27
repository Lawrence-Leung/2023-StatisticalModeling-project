function idx = findClosestCentroids(X, centroids)
%找出每个点离那个聚类中心最近，就划分到哪一类
K = size(centroids, 1);
idx = zeros(size(X,1), 1);
for i=1:length(X)
    distance = inf;
    for j=1:K
        kDist = norm(X(i, :) - centroids(j, :));
        if (kDist < distance)
            distance = kDist;
            idx(i) = j;
        end
    end
end
end

