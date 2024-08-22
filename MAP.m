clc;
clear all

dataTime = '20230224';
dataName = 'data5'; % 新的数据名称

path = ['F:\Experiment_data\data_acq\' dataTime '\' dataName '.mat'];
load(path);

variableNames = who;
ch_bp = variableNames{1};
ch_trigger = variableNames{2};

% if ~strcmp(ch_bp, dataName)
%     dataName = ch_bp(1:15);
% end

bp_data = eval([dataName '_Ch1.values']);
trigger_data = eval([dataName '_Ch2.values']);

%% trigger length and shape
[trigger_data,bp_data] = trigger_rectifier(trigger_data,bp_data);
time = (1:length(bp_data))/1000;

%% 上升沿与下降沿位置
[rising_edges, falling_edges] = trigger_edge(trigger_data); 
% rising_edges = [28304
% 111157
% 182385
% 290242
% ];
% falling_edges = [58304
% 141157
% 212385
% 320242
% ];
%% sys and dia
[sys_pressure,sys_locs,dia_pressure,dia_locs] = find_sys_dia(bp_data);

% figure; % 没有进行插值前的图像
% plot(time,bp_data);hold on
% plot(sys_locs/1000,sys_pressure);hold on
% plot(dia_locs/1000,dia_pressure)

%% 三次样条插值
sys_spline = spline(sys_locs/1000,sys_pressure,time);
dia_spline = spline(dia_locs/1000,dia_pressure,time);
pp = sys_spline - dia_spline; %pp 脉压
map = pp*0.333 + dia_spline;

%%
% figure; %进行三次样条插值后的图像
% plot(time,bp_data);hold on
% scatter(sys_locs/1000,sys_pressure);hold on
% scatter(dia_locs/1000,dia_pressure);hold on
% plot(time,map);hold on
% plot(time,sys_spline);hold on
% plot(time,dia_spline)

%%
% 排除只有刺激开始，没有刺激结束的情况
if numel(rising_edges) > numel(falling_edges)
    num_stimulate = numel(falling_edges);
    fprintf('%s', "warning");
else
    num_stimulate = numel(rising_edges);
end

num_features = 14;

statistics = [ ];

rising_edges_1000 = rising_edges-1000;
falling_edges_1000 = falling_edges-1000;

for i = 1: num_stimulate 
    be_sys = sys_spline(rising_edges_1000(i): rising_edges(i)); %be_sys 为 开始刺激时刻点的收缩压值
    af_sys = sys_spline(falling_edges_1000(i): falling_edges(i)); %af_sys 为 结束刺激时刻点的收缩压值
    
    be_sys_mean = mean(be_sys);
    af_sys_mean = mean(af_sys);
    
    be_sys_std = std(be_sys);
    af_sys_std = std(af_sys);
    
    be_dia = dia_spline(rising_edges_1000(i): rising_edges(i));
    af_dia = dia_spline(falling_edges_1000(i): falling_edges(i));
    
    be_dia_mean = mean(be_dia);
    af_dia_mean = mean(af_dia);
    
    be_dia_std = std(be_dia);
    af_dia_std = std(af_dia);
    
    be_map = map(rising_edges_1000(i): rising_edges(i));
    af_map = map(falling_edges_1000(i): falling_edges(i));
    
    be_map_mean = mean(be_map);
    af_map_mean = mean(af_map);
    
    be_map_std = std(be_map);
    af_map_std = std(af_map);  
    
    statistics( i ,:) = [be_sys_mean,af_sys_mean,be_sys_std,af_sys_std,...
       " " ,be_dia_mean,af_dia_mean,be_dia_std,af_dia_std,...
       " " ,be_map_mean,af_map_mean,be_map_std,af_map_std,...
    ];
    
end

%%
plot(time,map);hold on
plot(time,sys_spline);hold on
plot(time,dia_spline);hold on
plot(time ,trigger_data*50);




