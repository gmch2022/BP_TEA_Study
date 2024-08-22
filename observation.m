% ��m�ļ�����Ѫѹ������̼����ڵ�λ��
clc;
clear all

dataTime = '20230708';
dataName = 'data1'; % �µ���������

path = ['F:\Experiment_data\data_acq\' dataTime '\' dataName '.mat'];
load(path);

variableNames = who;    % who�÷���ȡ workshop �ı����� ������
ch_bp = variableNames{1};
ch_trigger = variableNames{2};

if ~strcmp(ch_bp, dataName) % ��ȡ�ֶ���
    dataName = ch_bp(1:5); % dataName ��ѡ��ڼ��� DataX ����
end
bp_data = eval([dataName '_Ch1.values']);
trigger_data = eval([dataName '_Ch2.values']);

%% trigger length and shape
% ���� trigger�ĳ��Ⱥ� Bp�ĳ���
[trigger_data,bp_data] = trigger_rectifier(trigger_data,bp_data);
% ��ö�����ʱ��
time = (1:length(bp_data))/1000;

%% ���������½���λ��
% ������һ�δ̼���ʼ��λ�ã��½���һ�δ̼�������λ��
[rising_edges, falling_edges] = trigger_edge(trigger_data); 

%% ��ͼ
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

%% �̼�ǰ ������������
%[segments_features_before] = feature_of_before_stimulation(bp_data,rising_edges,falling_edges);

%% �̼��� ������������
%[segments_features_after] = feature_of_after_stimulation(bp_data,rising_edges,falling_edges);

%% ����ͼ��
% �����Ѿ�������һ��Figure�����磺fig
% ���ñ���·�����ļ���
% savePath = 'F:\Experiment_data\';  % ���ñ���·��
% fileName = [dataTime '_' dataName];  % �����ļ�������������չ����
% 
% % ����FigureΪJPEG��ʽ
% saveas(fig, [savePath fileName '.jpg'], 'jpeg');

