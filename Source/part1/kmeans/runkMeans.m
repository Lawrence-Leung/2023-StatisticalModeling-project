function [centroids, idx] = runkMeans(X, initial_centroids, ...
                                      max_iters)
[m,n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
idx = zeros(m, 1);
for i=1:max_iters
    fprintf('K-Means ���� %d/%d...\n', i, max_iters);
    idx = findClosestCentroids(X, centroids);%�ҳ�����ĵ�������һ��
    centroids = computeCentroids(X, idx, K);%�����������
end
end

