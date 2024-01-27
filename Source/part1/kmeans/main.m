%clc;
%clear;
%load('k1secs.mat');
data=k1sec2_new;
k=5;%���þ�����Ŀ
max_iters=10000; %���õ���������
initial_centroids = kMeansInitCentroids(data, k);%�������ĳ�ʼ��
[centroids, idx] = runkMeans(data, initial_centroids, max_iters);%����k��ֵ�����ؾ������ĺ����
%select=[1,2,3,4,5,6];%ѡ��Ҫչʾ������
%biaoji=['bo';'r*';'k+';'g^';'y+'];%��ͼ�ı��
%figure;
%���ǻ�ͼ�Ĳ���
%hold on;
%grid on;
%for i=1:k
%    plot3(data(idx==i,select(1)),data(idx==i,select(2)),data(idx==i,select(3)),data(idx==i,select(4)),data(idx==i,select(5)),data(idx==i,select(6)),biaoji(i,:));
%end
%[idx2,centroids2]=kmeans(data,k);
