function [] = SplitDataSegment(obj, dataBP, savePath, nameOfPoint)
%SPLITDATASEGMENT �˴���ʾ�йش˺�����ժҪ
%  Description

    intervals = dataBP.intervals;
    Parameter = dataBP.params;
    date      = obj.OperationDate;
    % savePath
    % name = nameOfPoint
        strContainName  = fieldnames(dataBP);
        nameInCell      = strContainName(contains(strContainName, 'Ch1'));
        nameOfChannelBp = nameInCell{1};    
    SegmentData     = dataBP.(nameOfChannelBp).values;

    % Below code need 
    % SegmentData, Name, Date, Parameter, intervals, savePath
    for i = 1:length(intervals)
        % ��ȡ��ǰ����������յ�
        interval_start = intervals(i, 1);
        interval_end   = intervals(i, 6);
        
        if(interval_start == 0 && interval_end == 0)
            continue;
        end
        
        if(interval_start < 1) 
            interval_start = 1;
        end

        % ��ȡ�ź�Ƭ��
        if(interval_end > length(SegmentData))
            interval_end = length(SegmentData);
        end
        segment = SegmentData(interval_start:interval_end);
        parameter = Parameter(i);
        
        % ����һ���µ�ͼ�δ���
        figure;

        % �����ź�Ƭ��
        plot(interval_start:interval_end, segment, 'b');
        hold on;

        % ��ȡ����ߵ�λ��
        mark_start = intervals(i, 3);
        mark_end   = intervals(i, 4);

        % ��ָ�������俪ʼ�ͽ�β����ֱ��
        y_min = min(segment);
        y_max = max(segment);
        plot([mark_start, mark_start], [y_min, y_max], 'r--', 'LineWidth', 2); % ��ʼ�����
        plot([mark_end, mark_end], [y_min, y_max], 'r--', 'LineWidth', 2); % ���������

        % �������б����ַ���
        title_str = sprintf('%s %s Sitmulus %d\n%.2f(mA) %d(Hz) %d(uS)', date, nameOfPoint, i, parameter.current, parameter.frequency, parameter.duration);

        % ���ñ���
        title(title_str);

        % �ȴ��û������رյ�ǰͼ�δ���
%          disp('���ͼ�δ����Լ���...');
%          waitforbuttonpress;
         
        % ����ͼ��
        nameStr    = sprintf('%s_%s_%d_%.2fmA_%dHz_%duS', date, nameOfPoint, i, parameter.current, parameter.frequency, parameter.duration);
        folderPath = sprintf('%s/%s/%s',savePath,date,nameOfPoint);
        imagePath  = sprintf('%s/%s/%s/%s.png',savePath,date,nameOfPoint,nameStr);
        if ~exist(folderPath, 'dir')
            mkdir(folderPath);
        end
        
        if ~exist(imagePath, 'png')
            saveas(gcf, imagePath);         
        end

        pause(0.5);
        close;
    end
    
end

