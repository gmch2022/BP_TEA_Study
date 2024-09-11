function [statisticalValue] = getSegmentStatisticalValue(~, getBP)
%GETSEGMENTSTATISTICALVALUE 此处显示有关此函数的摘要
%   Description
%   In: getBP is a arrary 
%   out: statisticalValue is a struct that contains boxplotValue, mean,
%       var, std

    getBPQ1 = prctile(getBP, 25);
    getBPQ3 = prctile(getBP, 75);
    getBPMAX = getBPQ3 + 1.5*(getBPQ3 - getBPQ1);
    getBPMIN = getBPQ1 - 1.5*(getBPQ3 - getBPQ1);
    getBPMid = median(getBP);
    getBPMea = mean(getBP);
    getBPVar = var(getBP);
    getBPStd = std(getBP);
    
    statisticalValue.q1 = getBPQ1;
    statisticalValue.q3 = getBPQ3;
    statisticalValue.max = getBPMAX;
    statisticalValue.min = getBPMIN;
    statisticalValue.midden = getBPMid;
    statisticalValue.mean = getBPMea;
    statisticalValue.var = getBPVar;
    statisticalValue.std = getBPStd;
    
end

