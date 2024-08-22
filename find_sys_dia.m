function [sys_pressure,sys_locs,dia_pressure,dia_locs] = find_sys_dia(bp_data)
%从中心动脉压中获取收缩压与舒张压
% center_pressure是中心动脉压的数据向量
center_pressure = bp_data;
[~, sys_locs] = findpeaks(center_pressure,'MinPeakWidth',30); % 找到峰值点的位置
sys_pressure = center_pressure(sys_locs); % 收缩压


[~, dia_locs] = findpeaks(-center_pressure,'MinPeakWidth',30); % 找到反向波形的谷值点的位置
dia_pressure = center_pressure(dia_locs); % 舒张压

end

