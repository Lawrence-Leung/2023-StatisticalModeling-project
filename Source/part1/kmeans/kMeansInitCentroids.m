function centroids = kMeansInitCentroids(X, K)
centroids = zeros(K, size(X, 2));%�����ʼ����������
randidx = randperm(size(X, 1));
centroids = X(randidx(1:K), :);%���ѡ����������
end

