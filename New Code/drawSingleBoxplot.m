function [] = drawSingleBoxplot(paramsArray, stringValue)
    % paramsArray: minVal,Q1, medianVal, Q3, maxVal 
    % stringValue: 指定的数据日期， 指定的刺激位置， 刺激参数
    minVal    = paramsArray(1);     % 最小值
    Q1        = paramsArray(2);         % 第一个四分位数
    medianVal = paramsArray(3);  % 中位数
    Q3        = paramsArray(4);         % 第三个四分位数
    maxVal    = paramsArray(5);     % 最大值

    % 定义箱线图的宽度
    boxWidth = 0.5;

    % 绘制箱子 (Q1 到 Q3 的矩形)
    figure;
    hold on;
    rectangle('Position', [1 - boxWidth/2, Q1, boxWidth, Q3 - Q1], 'EdgeColor', 'b', 'LineWidth', 1.5);

    % 绘制中位数线
    plot([1 - boxWidth/2, 1 + boxWidth/2], [medianVal, medianVal], 'r', 'LineWidth', 2);

    % 绘制最小值和最大值的线 (须线)
    plot([1, 1], [minVal, Q1], 'k-', 'LineWidth', 1.5);  % 下须线
    plot([1, 1], [Q3, maxVal], 'k-', 'LineWidth', 1.5);  % 上须线

    % 绘制最小值和最大值的横线
    plot([1 - boxWidth/4, 1 + boxWidth/4], [minVal, minVal], 'k-', 'LineWidth', 1.5);
    plot([1 - boxWidth/4, 1 + boxWidth/4], [maxVal, maxVal], 'k-', 'LineWidth', 1.5);

    % 设置图形轴
    xlim([0.5, 1.5]);
    ylim([minVal - 5, maxVal + 5]);
    
    assginDate  = stringValue{1};
    acupunPoint = stringValue{2};
    stimulusInf = stringValue{3};
    titleName = sprintf('%s %s %s',assginDate, acupunPoint, stimulusInf);
    
    title(titleName);
    
    hold off;
end