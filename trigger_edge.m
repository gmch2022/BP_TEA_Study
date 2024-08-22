function [outputArg1,outputArg2] = trigger_edge(trigger_data)
%% ���ҵķ���trigger �������غ��½���
%% TDT�����dan'm
threshold = 0.5; % ��ֵ
rising_edges = find(diff(trigger_data > threshold) > 0); % ������
falling_edges = find(diff(trigger_data < threshold) > 0); % �½���

outputArg1 = rising_edges;
outputArg2 = falling_edges;

end

