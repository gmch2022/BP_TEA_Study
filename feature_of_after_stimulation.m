function [segments_features] = feature_of_after_stimulation(bp_data,inputArg1,inputArg2)
%FEATURE_OF_AFTER_STIMULATION 此处显示有关此函数的摘要
%   此处显示详细说明

start_coords = inputArg1;
end_coords = inputArg2;

num_segments = numel(start_coords);
num_features = 6;

segments_features = zeros(num_segments, num_features);

for i = 1:num_segments
    if i == num_segments
        next_start_coord = numel(bp_data);
    else
        next_start_coord = start_coords(i+1);
    end
    
    num_points = next_start_coord - end_coords(i);
    
    if num_points >= 60000
        end_coord = end_coords(i) + 60000;
    elseif num_points >= 30000
        end_coord = end_coords(i) + 30000;
    else
        end_coord = next_start_coord - 1;
    end
    
    segment_data = bp_data(end_coords(i) : end_coord);
    
    % 假设有两个特征，分别计算均值和标准差
    mean_of_bp = mean(segment_data);  % 假设特征为小段前数据的均值
    std_of_bp = std(segment_data);
    
    [sys_pressure,~,dia_pressure,~] = find_sys_dia(segment_data);
    
    mean_of_sys = mean(sys_pressure);
    std_of_sys = std(sys_pressure);
    mean_of_dia = mean(dia_pressure);
    std_of_dia = std(dia_pressure);
    
    % 将特征值添加到矩阵中的对应行
    segments_features(i, :) = [mean_of_bp, std_of_bp, mean_of_sys, std_of_sys, mean_of_dia, std_of_dia];
end

end

