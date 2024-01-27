function centroids = computeCentroids(X, idx, K)
%计算聚类中心，就是同一类取平均值
[~,n] = size(X);
centroids = zeros(K, n);
for i=1:K
    indices = idx == i;
    for j=1:n
        centroids(i, j) = sum(X(:, j) .* indices) / sum(indices);
    end
end
end

