clc
clear all;

load('F:\Experiment_data\data_acq\20230224\data5.mat');

variableNames = who;
ch_bp = variableNames{1};
ch_trigger = variableNames{2};

bp_data = data5_Ch1.values;
trigger_data = data5_Ch2.values;

start = [303114	1127509	1326742	1439271	2117067	2380357	2863955];
endd = [333114	1157509	1356741	1469271	2147067	2410357	2893955];
%[sys_pressure,sys_locs,dia_pressure,dia_locs] = find_sys_dia(bp_data);

l = length(start);
numSegments = l;  % 分段的数量

mean_of_bp = [];
std_of_bp = [];

mean_of_sys = [];
std_of_sys = [];

segments = cell(1, numSegments);
for i = 1:numSegments
    segments{i} = bp_data(start(i):endd(i));
    mean_of_bp(i) = mean(segments{i})';
    std_of_bp(i) = std(segments{i})';
    
    [sys_pressure,sys_locs,dia_pressure,dia_locs] = find_sys_dia(segments{i});
    
    mean_of_sys(i) = mean(sys_pressure)';
    std_of_sys(i) = std(sys_pressure)';
    
    mean_of_dia(i) = mean(dia_pressure)';
    std_of_dia(i) = std(dia_pressure)';
    
end

mean_of_bp = transpose(mean_of_bp)
std_of_bp = transpose(std_of_bp)
mean_of_sys = transpose(mean_of_sys)
std_of_sys = transpose(std_of_sys)
mean_of_dia = transpose(mean_of_dia)
std_of_dia = transpose(std_of_dia)







