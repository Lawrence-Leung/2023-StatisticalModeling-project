%-- ��ʡ�й���ͼ��MATLAB�еĻ��� --%
% Author: gaospecial@gmail.com
% Date: 2012-6-5 14:04:01
% ��ͼ������Դ�����һ���������Ϣϵͳ��վ
% �˿�������Դ������ͳ�����2011��
% modeified by weng. 2018.1




colour_totall=128; 

% �����ͼ���� --��ʡ�Ķ��������
shp_data=shaperead('maps/bou2_4p.shp', 'UseGeoCoords', true);% ʡ

%{
// matlab 2016b�Ѿ�������������
% ������ݷ�����������Ϊ���룬�����������ַ���������ģ���Ҫ�����ļ�����ʱ���ֵ�����
% �������Ƽ�¼����Ӧ��dbf�ļ��У�����ʹ��Excel�򿪣����Ҳ���������룬��ȡ���е����ı���Ϊ�ı��ļ�
% Ȼ���ڵ��빤�����������䱣��Ϊ*.mat��ʽ�ļ���������ȡ��
% �����滻sheng�����е����롾���Ǳ�֮ͨ������˭֪�����õķ���һ��������Ŷ��
load chinese_name.mat % ʡ��ʡ�ᣬ��Ҫ���е���ȷ����
for i=1:length(sheng)
    sheng(i).NAME=sheng_chinese_name{i}; % ����������ʾ����
end
unique(sheng_chinese_name) % ����34��ʡ��ֱϽ�У�������
length(sheng) % ����Ϊ925������
%}

% ʹ��importdata�򵼵���2011��ȫ��31��ʡ���˿�����
% dataΪ�˿���Ŀ textdataΪʡ����
d=importdata('sortresult.txt');
data=d.data; % ���θ߶�
province_arr=d.textdata; % ���Ӧ��ʡ������

% �����ͼ����
% ��Բ�ͬʡ�ݣ��ֱ����ò�ͬ����ɫ��FaceColor��
mycolormap=parula(colour_totall); %  ������ɫ

% ���ɲ�ͬ���򰴴�С����ɫ�������˿���Ŀ���ٷֱ�ָ����ͬ����ɫ.�˿�Խ�࣬��ɫԽͻ��
geo_name={shp_data.NAME}';
max_height = max(data);
n=length(data); % provice num
symbol_spec=cell(1,n); % Ԥ����������Լӿ촦���ٶ�
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


% ��ʾ��ͼ
figure
ax=worldmap('china'); % ʹ��worldmap����������ͼ
setm(ax,'grid','off') % �ر�grid
setm(ax,'frame','off') % �رձ߿�
setm(ax,'parallellabel','off') % �ر���������
setm(ax,'meridianlabel','off') % �ر���������

% ��ؼ����������
symbols=makesymbolspec('Polygon',{'default','FaceColor',[0.9 0.9 0.8],...
    'LineStyle','--','LineWidth',0.2,...
    'EdgeColor',[0.8 0.9 0.9]},...
    symbol_spec{:}...
    );
geoshow(shp_data,'SymbolSpec',symbols); % �˴���mapshowͶӰ�᲻��ȷ

% ͼ�ı�ע
% ��ͼ���Ҳ���ʾbar
colormap(parula(colour_totall))
hcb=colorbar('EastOutside');
ks = max_height-1;
step=round(max_height/ks);
set(hcb,'YTick',(0:1/ks:1))
set(hcb,'YTickLabel',num2cell(1:step:max_height))

% ��ͼ��ӱ���
title('�й���ʡ�ݾ��������')