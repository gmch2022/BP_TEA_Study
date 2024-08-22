% 该m文件用于血压波形与刺激所在的位置
clc;
clear all

dataTime = '20230708';
dataName = 'data1'; % 新的数据名称

path = ['F:\Experiment_data\data_acq\' dataTime '\' dataName '.mat'];
load(path);

variableNames = who;    % who用法获取 workshop 的变量的 变量名
ch_bp = variableNames{1};
ch_trigger = variableNames{2};

if ~strcmp(ch_bp, dataName) % 获取字段名
    dataName = ch_bp(1:5); % dataName 的选择第几个 DataX 就行
end
bp_data = eval([dataName '_Ch1.values']);
trigger_data = eval([dataName '_Ch2.values']);

%% trigger length and shape
% 对齐 trigger的长度和 Bp的长度
[trigger_data,bp_data] = trigger_rectifier(trigger_data,bp_data);
% 获得对齐后的时间
time = (1:length(bp_data))/1000;

%% 上升沿与下降沿位置
% 上升是一次刺激开始的位置，下降是一次刺激结束的位置
[rising_edges, falling_edges] = trigger_edge(trigger_data); 

%% 画图
fig = figure;
plot(time, bp_data);hold on
for i = 1:length(rising_edges)
    line([rising_edges(i)/1000, rising_edges(i)/1000], ylim, 'Color', 'r', 'LineStyle', '-','LineWidth',1);
    line([falling_edges(i), falling_edges(i)], ylim, 'Color', 'black', 'LineStyle', '-','LineWidth',1);
    xPos = (rising_edges(i) + falling_edges(i))/2;
    yPos = 100;
    text(xPos, yPos, num2str(i));
    endf
title(path);

%% 刺激前 数据特征计算
%[segments_features_before] = feature_of_before_stimulation(bp_data,rising_edges,falling_edges);

%% 刺激后 数据特征计算
%[segments_features_after] = feature_of_after_stimulation(bp_data,rising_edges,falling_edges);

%% 保存图像
% 假设已经生成了一个Figure，例如：fig
% 设置保存路径和文件名
% savePath = 'F:\Experiment_data\';  % 设置保存路径
% fileName = [dataTime '_' dataName];  % 设置文件名（不包括扩展名）
% 
% % 保存Figure为JPEG格式
% saveas(fig, [savePath fileName '.jpg'], 'jpeg');

