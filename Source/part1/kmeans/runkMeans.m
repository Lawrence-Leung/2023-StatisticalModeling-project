function [centroids, idx] = runkMeans(X, initial_centroids, ...
                                      max_iters)
[m,n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
idx = zeros(m, 1);
for i=1:max_iters
    fprintf('K-Means 迭代 %d/%d...\n', i, max_iters);
    idx = findClosestCentroids(X, centroids);%找出最近的点属于哪一类
    centroids = computeCentroids(X, idx, K);%计算聚类中心
end
end

