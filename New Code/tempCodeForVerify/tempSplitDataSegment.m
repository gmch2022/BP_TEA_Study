function [] = tempSplitDataSegment(SegmentData, Name, Date, Parameter, intervals, savePath)
%TEMPSPLITDATASEGMENT �˴���ʾ�йش˺�����ժҪ
%   Description
%   SegmentData is Bp or Sync info
%   Todo: interval, Name, Data ����Ϊ��Ա����

    for i = 1:length(intervals)
        % ��ȡ��ǰ����������յ�
        interval_start = intervals(i, 1);
        interval_end = intervals(i, 6);

        % ��ȡ�ź�Ƭ��
        segment = SegmentData(interval_start:interval_end);
        parameter = Parameter(i);
        
        % ����һ���µ�ͼ�δ���
        figure;

        % �����ź�Ƭ��
        plot(interval_start:interval_end, segment, 'b');
        hold on;

        % ��ȡ����ߵ�λ��
        mark_start = intervals(i, 3);
        mark_end = intervals(i, 4);

        % ��ָ�������俪ʼ�ͽ�β����ֱ��
        y_min = min(segment);
        y_max = max(segment);
        plot([mark_start, mark_start], [y_min, y_max], 'r--', 'LineWidth', 2); % ��ʼ�����
        plot([mark_end, mark_end], [y_min, y_max], 'r--', 'LineWidth', 2); % ���������

        % �������б����ַ���
        title_str = sprintf('%s %s Sitmulus %d\n%.2f(mA) %d(Hz) %d(uS)', Date, Name, i, parameter.current, parameter.frequency, parameter.duration);

        % ���ñ���
        title(title_str);

        % �ȴ��û������رյ�ǰͼ�δ���
%          disp('���ͼ�δ����Լ���...');
%          waitforbuttonpress;
         
        % ����ͼ��
        nameStr = sprintf('%s_%s_%d_%.2fmA_%dHz_%duS', Date, Name, i, parameter.current, parameter.frequency, parameter.duration);
        folderPath = sprintf('%s/%s/%s',savePath,Date,Name);
        imagePath = sprintf('%s/%s/%s/%s.png',savePath,Date,Name,nameStr);
        if ~exist(folderPath, 'dir')
            mkdir(folderPath);
        end
        saveas(gcf, imagePath);
        close;
    end
end

