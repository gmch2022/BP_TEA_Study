function [outputArg1,outputArg2] = trigger_edge(trigger_data)
%% 用找的方波trigger 的上升沿和下降沿
%% TDT输出的dan'm
threshold = 0.5; % 阈值
rising_edges = find(diff(trigger_data > threshold) > 0); % 上升沿
falling_edges = find(diff(trigger_data < threshold) > 0); % 下降沿

outputArg1 = rising_edges;
outputArg2 = falling_edges;

end

