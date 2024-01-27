%clc;
%clear;
%load('k1secs.mat');
data=k1sec2_new;
k=5;%设置聚类数目
max_iters=10000; %设置迭代次数；
initial_centroids = kMeansInitCentroids(data, k);%聚类中心初始化
[centroids, idx] = runkMeans(data, initial_centroids, max_iters);%运行k均值，返回聚类中心和类别
%select=[1,2,3,4,5,6];%选择要展示的特征
%biaoji=['bo';'r*';'k+';'g^';'y+'];%画图的标记
%figure;
%这是画图的部分
%hold on;
%grid on;
%for i=1:k
%    plot3(data(idx==i,select(1)),data(idx==i,select(2)),data(idx==i,select(3)),data(idx==i,select(4)),data(idx==i,select(5)),data(idx==i,select(6)),biaoji(i,:));
%end
%[idx2,centroids2]=kmeans(data,k);
