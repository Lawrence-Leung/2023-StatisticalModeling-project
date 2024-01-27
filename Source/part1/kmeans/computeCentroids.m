function centroids = computeCentroids(X, idx, K)
%����������ģ�����ͬһ��ȡƽ��ֵ
[~,n] = size(X);
centroids = zeros(K, n);
for i=1:K
    indices = idx == i;
    for j=1:n
        centroids(i, j) = sum(X(:, j) .* indices) / sum(indices);
    end
end
end

