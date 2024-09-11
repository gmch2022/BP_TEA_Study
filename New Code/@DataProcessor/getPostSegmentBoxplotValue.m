function [SV] = getPostSegmentBoxplotValue(obj, dataBP)
%getPostSegmentBoxplotValue
%   Description

    params    = dataBP.params;
    endIdx  = params(end).end;

    channelNames  = fieldnames(dataBP);
    bpChannelData = channelNames{contains(channelNames, 'Ch1')};
    bpWaveData = dataBP.(bpChannelData).values(1: endIdx);

    [getSBP,~,getDBP,~] = obj.findSBPAndDBP(bpWaveData);

    getSBP02 = roundn(getSBP, -2);
    getDBP02 = roundn(getDBP, -2);

    getSBP_statisticalValue = obj.getSegmentStatisticalValue(getSBP02);
    getDBP_statisticalValue = obj.getSegmentStatisticalValue(getDBP02);
    
    SV.SBP.last = getSBP_statisticalValue;
    SV.DBP.last = getDBP_statisticalValue;
    SV.last_time = endIdx;
end