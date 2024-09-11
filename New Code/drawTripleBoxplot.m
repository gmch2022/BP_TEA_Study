function [] = drawTripleBoxplot(paramsArray, stringValue)
    % ����������ժҪ���������������ݣ�
    minVals    = paramsArray(1,:);   % ��Сֵ
    Q1Vals     = paramsArray(2,:);   % ��һ���ķ�λ��
    medianVals = paramsArray(3,:);   % ��λ��
    Q3Vals     = paramsArray(4,:);   % �������ķ�λ��
    maxVals    = paramsArray(5,:);   % ���ֵ

    % ��������ͼ�Ŀ��
    boxWidth = 0.5;

    % ����ͼ�δ���
    figure;
    hold on;

    % ����ÿ������
    for i = 1:length(minVals)
        % �������� (Q1 �� Q3 �ľ���)
        rectangle('Position', [i - boxWidth/2, Q1Vals(i), boxWidth, Q3Vals(i) - Q1Vals(i)], 'EdgeColor', 'b', 'LineWidth', 1.5);

        % ������λ����
        plot([i - boxWidth/2, i + boxWidth/2], [medianVals(i), medianVals(i)], 'r', 'LineWidth', 2);

        % �������� (whiskers)
        plot([i, i], [minVals(i), Q1Vals(i)], 'k-', 'LineWidth', 1.5);  % ������
        plot([i, i], [Q3Vals(i), maxVals(i)], 'k-', 'LineWidth', 1.5);  % ������

        % ������Сֵ�����ֵ�ĺ���
        plot([i - boxWidth/4, i + boxWidth/4], [minVals(i), minVals(i)], 'k-', 'LineWidth', 1.5);
        plot([i - boxWidth/4, i + boxWidth/4], [maxVals(i), maxVals(i)], 'k-', 'LineWidth', 1.5);
    end

    % ����ͼ����ͱ�ǩ
    xlim([0.5, length(minVals) + 0.5]);
    xticks(1:length(minVals));
    xticklabels({'Pervious Stimulus', 'Under Stimulus', 'Posterior Stimulus'});  % �滻Ϊʵ������������
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