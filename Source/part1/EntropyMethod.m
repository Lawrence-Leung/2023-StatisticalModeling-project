%%
% 熵权法评价函数
function [scores, evaluation] = EntropyMethod (givendata)
%%
% 输入矩阵: givendata[m, n]
% m 行：对象(样本)
% n 列：各个对象的相关指标
givendata = transpose(givendata);
tempdata = mapminmax(givendata', 0.002, 1); %标准化到0.002-1区间
tempdata = tempdata';

%%
% 得到信息熵
[m, n] = size(tempdata);
p = zeros(m,n);
for j = 1 : n
    p(:, j) = tempdata(:, j) / sum(tempdata(:, j));
end
for j = 1 : n
    % EE是一个行向量，一共有n个元素，对应得到的是每一个指标的信息熵。
    % 这里所针对的是每一个指标，而不是每一个样本！
    EE(j) = -1 / log(m) * sum(p(:, j) .* log(p(:, j)));
end

%%
% 计算权重
% 
evaluation = (1 - EE) / sum(1 - EE);

%%
% 计算得分
scal = tempdata * evaluation';
scores = 100 * scal / max(scal);
%scores = mapminmax(log(log(log(log(log(100 * scal / max(scal) + 1)+1)+1)+1)+1), 0, 1);
%scores = mapminmax((log(100 * scal / max(scal) + 1)), 0, 1);


%%
% 输出：行向量，scores
end

