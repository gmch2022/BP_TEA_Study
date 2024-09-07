function [intervals] = tempSplitInterval(param)
%TEMPSPLITINTERVAL 此处显示有关此函数的摘要
%   Description
%   初始化参数： 你会有一个结构数组 param，其中每个元素包含 start 和 end 字段，分别代表区间的开始和结束。
%   创建区间数组： 你将创建一个新的数组 intervals 来存储扩展后的区间信息。每一行将包含三个区间：[param(i).start, param(i).end]、[param(i-1).end, param(i).start] 和 [param(i).end, param(i+1).start]。
%   处理边界情况： 对于 i = 1 和 i = length(param) 的边界情况，使用给定的规则计算额外的区间。


    % 获取参数的数量
    n = length(param);

    % 初始化区间数组
    intervals = zeros(n, 6);

    % 循环遍历每个参数
    for i = 1:n
        si = param(i).start;
        ei = param(i).end;

        if i == 1
            % 处理 i = 1 的特殊情况
            ei_minus_1 = si - (param(i+1).start - ei);
            intervals(i, :) = [ei_minus_1, si, si, ei, ei, param(i+1).start];
        elseif i == n
            % 处理 i = n 的特殊情况
            si_plus_1 = ei + (si - param(i-1).end);
            intervals(i, :) = [param(i-1).end, si, si, ei, ei, si_plus_1];
        else
            % 一般情况
            intervals(i, :) = [param(i-1).end, si, si, ei, ei, param(i+1).start];
        end
    end
    
end

