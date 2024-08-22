clc
clear all;

load('F:\Experiment_data\data_acq\20230307\data4.mat');
variableNames = who;
ch_bp = variableNames{1};
ch_trigger = variableNames{2};

bp_data = data4_Ch1.values;
trigger_data = data4_Ch2.values;

%% trigger length and shape
[trigger_data,bp_data] = trigger_rectifier(trigger_data,bp_data);
time = (1:length(bp_data))/1000;

%% 上升沿与下降沿位置
[rising_edges, falling_edges] = trigger_edge(trigger_data); 

%%
figure;
yyaxis left;
plot(time,bp_data);
yyaxis right;
plot(time,trigger_data);

falling_edges - rising_edges