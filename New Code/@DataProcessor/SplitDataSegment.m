function [] = SplitDataSegment(obj, dataBP, savePath, nameOfPoint)
%SPLITDATASEGMENT 此处显示有关此函数的摘要
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
        % 提取当前区间的起点和终点
        interval_start = intervals(i, 1);
        interval_end   = intervals(i, 6);
        
        if(interval_start == 0 && interval_end == 0)
            continue;
        end
        
        if(interval_start < 1) 
            interval_start = 1;
        end

        % 提取信号片段
        if(interval_end > length(SegmentData))
            interval_end = length(SegmentData);
        end
        segment = SegmentData(interval_start:interval_end);
        parameter = Parameter(i);
        
        % 创建一个新的图形窗口
        figure;

        % 绘制信号片段
        plot(interval_start:interval_end, segment, 'b');
        hold on;

        % 获取标记线的位置
        mark_start = intervals(i, 3);
        mark_end   = intervals(i, 4);

        % 在指定的区间开始和结尾画出直线
        y_min = min(segment);
        y_max = max(segment);
        plot([mark_start, mark_start], [y_min, y_max], 'r--', 'LineWidth', 2); % 开始标记线
        plot([mark_end, mark_end], [y_min, y_max], 'r--', 'LineWidth', 2); % 结束标记线

        % 创建多行标题字符串
        title_str = sprintf('%s %s Sitmulus %d\n%.2f(mA) %d(Hz) %d(uS)', date, nameOfPoint, i, parameter.current, parameter.frequency, parameter.duration);

        % 设置标题
        title(title_str);

        % 等待用户点击后关闭当前图形窗口
%          disp('点击图形窗口以继续...');
%          waitforbuttonpress;
         
        % 保存图像
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

