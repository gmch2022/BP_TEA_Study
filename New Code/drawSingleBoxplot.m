function [] = drawSingleBoxplot(paramsArray, stringValue)
    % paramsArray: minVal,Q1, medianVal, Q3, maxVal 
    % stringValue: ָ�����������ڣ� ָ���Ĵ̼�λ�ã� �̼�����
    minVal    = paramsArray(1);     % ��Сֵ
    Q1        = paramsArray(2);         % ��һ���ķ�λ��
    medianVal = paramsArray(3);  % ��λ��
    Q3        = paramsArray(4);         % �������ķ�λ��
    maxVal    = paramsArray(5);     % ���ֵ

    % ��������ͼ�Ŀ��
    boxWidth = 0.5;

    % �������� (Q1 �� Q3 �ľ���)
    figure;
    hold on;
    rectangle('Position', [1 - boxWidth/2, Q1, boxWidth, Q3 - Q1], 'EdgeColor', 'b', 'LineWidth', 1.5);

    % ������λ����
    plot([1 - boxWidth/2, 1 + boxWidth/2], [medianVal, medianVal], 'r', 'LineWidth', 2);

    % ������Сֵ�����ֵ���� (����)
    plot([1, 1], [minVal, Q1], 'k-', 'LineWidth', 1.5);  % ������
    plot([1, 1], [Q3, maxVal], 'k-', 'LineWidth', 1.5);  % ������

    % ������Сֵ�����ֵ�ĺ���
    plot([1 - boxWidth/4, 1 + boxWidth/4], [minVal, minVal], 'k-', 'LineWidth', 1.5);
    plot([1 - boxWidth/4, 1 + boxWidth/4], [maxVal, maxVal], 'k-', 'LineWidth', 1.5);

    % ����ͼ����
    xlim([0.5, 1.5]);
    ylim([minVal - 5, maxVal + 5]);
    
    assginDate  = stringValue{1};
    acupunPoint = stringValue{2};
    stimulusInf = stringValue{3};
    titleName = sprintf('%s %s %s',assginDate, acupunPoint, stimulusInf);
    
    title(titleName);
    
    hold off;
end