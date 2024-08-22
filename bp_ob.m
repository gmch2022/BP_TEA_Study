
path = 'H:\data_old\20210522\BP\data3.mat';
load(path);

variableNames = who;
ch_bp = variableNames{1};
ch_trigger = variableNames{2};

bp_data = data3_Ch1.values;
trigger_data = data3_Ch2.values;

%% trigger length and shape
[trigger_data,bp_data] = trigger_rectifier(trigger_data,bp_data);
time = (1:length(bp_data))/1000;

%% 上升沿与下降沿位置
[rising_edges, falling_edges] = trigger_edge(trigger_data); 
%%
fig = figure;
plot(time, bp_data);hold on
