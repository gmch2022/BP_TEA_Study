function [intervals] = tempSplitInterval(obj, param)
%TEMPSPLITINTERVAL �˴���ʾ�йش˺�����ժҪ
%   Description
%   ��ʼ�������� �����һ���ṹ���� param������ÿ��Ԫ�ذ��� start �� end �ֶΣ��ֱ��������Ŀ�ʼ�ͽ�����
%   �����������飺 �㽫����һ���µ����� intervals ���洢��չ���������Ϣ��ÿһ�н������������䣺[param(i).start, param(i).end]��[param(i-1).end, param(i).start] �� [param(i).end, param(i+1).start]��
%   ����߽������ ���� i = 1 �� i = length(param) �ı߽������ʹ�ø����Ĺ�������������䡣


    % ��ȡ����������
    n = length(param);

    % ��ʼ����������
    intervals = zeros(n, 6);

    % ѭ������ÿ������
    for i = 1:n
        si = param(i).start;
        ei = param(i).end;

        if i == 1
            % ���� i = 1 ���������
            ei_minus_1 = si - (param(i+1).start - ei);
            intervals(i, :) = [ei_minus_1, si, si, ei, ei, param(i+1).start];
        elseif i == n
            % ���� i = n ���������
            si_plus_1 = ei + (si - param(i-1).end);
            intervals(i, :) = [param(i-1).end, si, si, ei, ei, si_plus_1];
        else
            % һ�����
            if isempty(param(i+1).start)
                temp = ei + 60000;
                intervals(i, :) = [param(i-1).end, si, si, ei, ei, temp];
            else
                intervals(i, :) = [param(i-1).end, si, si, ei, ei, param(i+1).start];
            end
        end
    end
    
end

