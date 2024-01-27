%-- 分省中国地图在MATLAB中的画法 --%
% Author: gaospecial@gmail.com
% Date: 2012-6-5 14:04:01
% 地图数据来源：国家基础地理信息系统网站
% 人口数据来源：国家统计年鉴2011版
% modeified by weng. 2018.1




colour_totall=128; 

% 载入地图数据 --各省的多边形数据
shp_data=shaperead('maps/bou2_4p.shp', 'UseGeoCoords', true);% 省

%{
// matlab 2016b已经解决这个问题了
% 检查数据发现中午名称为乱码，可能是由于字符编码引起的，需要纠正文件导入时出现的乱码
% 中文名称记录在相应的dbf文件中，可以使用Excel打开，并且不会出现乱码，截取其中的中文保存为文本文件
% 然后在导入工作区，并将其保存为*.mat格式文件，随用随取。
% 依次替换sheng数据中的乱码【算是变通之法，有谁知道更好的方法一定告诉我哦】
load chinese_name.mat % 省，省会，主要城市的正确中文
for i=1:length(sheng)
    sheng(i).NAME=sheng_chinese_name{i}; % 纠正中文显示错误
end
unique(sheng_chinese_name) % 含有34个省（直辖市）的数据
length(sheng) % 共分为925个区块
%}

% 使用importdata向导导入2011年全国31个省的人口数据
% data为人口数目 textdata为省名称
d=importdata('sortresult.txt');
data=d.data; % 海拔高度
province_arr=d.textdata; % 相对应的省的名称

% 定义地图参数
% 针对不同省份，分别设置不同的颜色（FaceColor）
mycolormap=parula(colour_totall); %  定义颜色

% 生成不同区域按大小的颜色，按照人口数目多少分别指定不同的颜色.人口越多，颜色越突出
geo_name={shp_data.NAME}';
max_height = max(data);
n=length(data); % provice num
symbol_spec=cell(1,n); % 预定义变量可以加快处理速度
for i=1:n
    height_tmp=data(i);
    c_index=floor( colour_totall * height_tmp / max_height );
    c_index(c_index<1)=1;
    tmp_pn=province_arr{i};
    geoidx= find(strncmp(tmp_pn, geo_name, length(tmp_pn)) == 1);
    if numel(geoidx) > 0
        province_name=geo_name( geoidx(1) );
        symbol_spec{i} = {'NAME', char(province_name), 'FaceColor', mycolormap( c_index, :) };
    end
end


% 显示地图
figure
ax=worldmap('china'); % 使用worldmap的坐标轴作图
setm(ax,'grid','off') % 关闭grid
setm(ax,'frame','off') % 关闭边框
setm(ax,'parallellabel','off') % 关闭坐标轴标记
setm(ax,'meridianlabel','off') % 关闭坐标轴标记

% 最关键的两个语句
symbols=makesymbolspec('Polygon',{'default','FaceColor',[0.9 0.9 0.8],...
    'LineStyle','--','LineWidth',0.2,...
    'EdgeColor',[0.8 0.9 0.9]},...
    symbol_spec{:}...
    );
geoshow(shp_data,'SymbolSpec',symbols); % 此处用mapshow投影会不正确

% 图的标注
% 在图像右侧显示bar
colormap(parula(colour_totall))
hcb=colorbar('EastOutside');
ks = max_height-1;
step=round(max_height/ks);
set(hcb,'YTick',(0:1/ks:1))
set(hcb,'YTickLabel',num2cell(1:step:max_height))

% 给图像加标题
title('中国各省份聚类分类结果')