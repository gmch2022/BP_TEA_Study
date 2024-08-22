function [segments_features] = feature_of_before_stimulation(bp_data,rising_edges,falling_edges)
%FEATURE_OF_BEFORE_STIMULATION 用于计算刺激前的中心动脉压、收缩压、舒张压的平均值和标准差
%   bp_data 为输入
%   rising_edges 为刺激开始时间
%   falling_edges 为刺激结束时间
%   segments_features 存放 

% 定义数据段的开始坐标和结束坐标
start_coords = rising_edges;
end_coords = falling_edges;

% 计算每个小段之前的数据特征
num_segments = numel(start_coords);
num_features = 6;

segments_features = zeros(num_segments, num_features);
for i = 1:num_segments
    if i == 1
        prev_end_coord = 1;  % 第一个小段前的起始坐标
    else
        prev_end_coord = end_coords(i-1);  % 上一个小段的结束坐标
    end
    
    num_points = start_coords(i) - prev_end_coord;  % 前一个小段结束坐标与当前小段开始坐标之间的点数量
    
    if num_points >= 60000
        start_coord = start_coords(i) - 60000;
    elseif num_points >= 30000
        start_coord = start_coords(i) - 30000;
    else
        start_coord = prev_end_coord + 1;
    end
    
    segment_data = bp_data(start_coord : start_coords(i));  % 提取小段前的数据
    
    % 计算小段前的数据特征，这里仅作示例，你可以根据实际需求修改
    mean_of_bp = mean(segment_data);  % 假设特征为小段前数据的均值
    std_of_bp = std(segment_data);
    
    [sys_pressure,~,dia_pressure,~] = find_sys_dia(segment_data);
    
    mean_of_sys = mean(sys_pressure);
    std_of_sys = std(sys_pressure);
    mean_of_dia = mean(dia_pressure);
    std_of_dia = std(dia_pressure);
    
    
    % 存储每个小段前的数据特征
    segments_features(i, :) = [mean_of_bp, std_of_bp, mean_of_sys, std_of_sys, mean_of_dia, std_of_dia];
end

end

