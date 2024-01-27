function idx = findClosestCentroids(X, centroids)
%�ҳ�ÿ�������Ǹ���������������ͻ��ֵ���һ��
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

