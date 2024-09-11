function [] = drawTripleBoxplot(paramsArray, stringValue)
    % 给定的五数摘要（假设有三组数据）
    minVals    = paramsArray(1,:);   % 最小值
    Q1Vals     = paramsArray(2,:);   % 第一个四分位数
    medianVals = paramsArray(3,:);   % 中位数
    Q3Vals     = paramsArray(4,:);   % 第三个四分位数
    maxVals    = paramsArray(5,:);   % 最大值

    % 定义箱线图的宽度
    boxWidth = 0.5;

    % 创建图形窗口
    figure;
    hold on;

    % 遍历每组数据
    for i = 1:length(minVals)
        % 绘制箱子 (Q1 到 Q3 的矩形)
        rectangle('Position', [i - boxWidth/2, Q1Vals(i), boxWidth, Q3Vals(i) - Q1Vals(i)], 'EdgeColor', 'b', 'LineWidth', 1.5);

        % 绘制中位数线
        plot([i - boxWidth/2, i + boxWidth/2], [medianVals(i), medianVals(i)], 'r', 'LineWidth', 2);

        % 绘制须线 (whiskers)
        plot([i, i], [minVals(i), Q1Vals(i)], 'k-', 'LineWidth', 1.5);  % 下须线
        plot([i, i], [Q3Vals(i), maxVals(i)], 'k-', 'LineWidth', 1.5);  % 上须线

        % 绘制最小值和最大值的横线
        plot([i - boxWidth/4, i + boxWidth/4], [minVals(i), minVals(i)], 'k-', 'LineWidth', 1.5);
        plot([i - boxWidth/4, i + boxWidth/4], [maxVals(i), maxVals(i)], 'k-', 'LineWidth', 1.5);
    end

    % 设置图形轴和标签
    xlim([0.5, length(minVals) + 0.5]);
    xticks(1:length(minVals));
    xticklabels({'Pervious Stimulus', 'Under Stimulus', 'Posterior Stimulus'});  % 替换为实际数据组名称
    ylabel('mmHg');
    
    assginDate  = stringValue{1};
    acupunPoint = stringValue{2};
    stimulusInf = stringValue{3};
    orderValue  = stringValue{4};
    
    title_str = sprintf('%s %s Sitmulus %s\n%s', ...
        assginDate(2:end), acupunPoint, orderValue, stimulusInf);
    
    title(title_str);
    hold off;
end