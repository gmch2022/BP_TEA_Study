function [segments_features] = feature_of_before_stimulation(bp_data,rising_edges,falling_edges)
%FEATURE_OF_BEFORE_STIMULATION ���ڼ���̼�ǰ�����Ķ���ѹ������ѹ������ѹ��ƽ��ֵ�ͱ�׼��
%   bp_data Ϊ����
%   rising_edges Ϊ�̼���ʼʱ��
%   falling_edges Ϊ�̼�����ʱ��
%   segments_features ��� 

% �������ݶεĿ�ʼ����ͽ�������
start_coords = rising_edges;
end_coords = falling_edges;

% ����ÿ��С��֮ǰ����������
num_segments = numel(start_coords);
num_features = 6;

segments_features = zeros(num_segments, num_features);
for i = 1:num_segments
    if i == 1
        prev_end_coord = 1;  % ��һ��С��ǰ����ʼ����
    else
        prev_end_coord = end_coords(i-1);  % ��һ��С�εĽ�������
    end
    
    num_points = start_coords(i) - prev_end_coord;  % ǰһ��С�ν��������뵱ǰС�ο�ʼ����֮��ĵ�����
    
    if num_points >= 60000
        start_coord = start_coords(i) - 60000;
    elseif num_points >= 30000
        start_coord = start_coords(i) - 30000;
    else
        start_coord = prev_end_coord + 1;
    end
    
    segment_data = bp_data(start_coord : start_coords(i));  % ��ȡС��ǰ������
    
    % ����С��ǰ�������������������ʾ��������Ը���ʵ�������޸�
    mean_of_bp = mean(segment_data);  % ��������ΪС��ǰ���ݵľ�ֵ
    std_of_bp = std(segment_data);
    
    [sys_pressure,~,dia_pressure,~] = find_sys_dia(segment_data);
    
    mean_of_sys = mean(sys_pressure);
    std_of_sys = std(sys_pressure);
    mean_of_dia = mean(dia_pressure);
    std_of_dia = std(dia_pressure);
    
    
    % �洢ÿ��С��ǰ����������
    segments_features(i, :) = [mean_of_bp, std_of_bp, mean_of_sys, std_of_sys, mean_of_dia, std_of_dia];
end

end

