function [sys_pressure,sys_locs,dia_pressure,dia_locs] = find_sys_dia(bp_data)
%�����Ķ���ѹ�л�ȡ����ѹ������ѹ
% center_pressure�����Ķ���ѹ����������
center_pressure = bp_data;
[~, sys_locs] = findpeaks(center_pressure,'MinPeakWidth',30); % �ҵ���ֵ���λ��
sys_pressure = center_pressure(sys_locs); % ����ѹ


[~, dia_locs] = findpeaks(-center_pressure,'MinPeakWidth',30); % �ҵ������εĹ�ֵ���λ��
dia_pressure = center_pressure(dia_locs); % ����ѹ

end

