function centroids = kMeansInitCentroids(X, K)
centroids = zeros(K, size(X, 2));%随机初始化聚类中心
randidx = randperm(size(X, 1));
centroids = X(randidx(1:K), :);%随机选出聚类中心
end

