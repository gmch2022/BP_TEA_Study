function [SV] = getWholeSegmentBoxplotValue(obj, dataBP)
%GETWHOLESEGMENTBOXPLOTVALUE
%   Description
%   in : the data of acu_point Data
%   out: strut -> two struct (SBP/DBP) -> q1 q2 mid mean ...
%   Acu_point data is struct that contains different channel data

    channelNames  = fieldnames(dataBP);
    bpChannelData = channelNames{contains(channelNames, 'Ch1')};
    bpWaveData = dataBP.(bpChannelData).values;
    
    [getSBP,~,getDBP,~] = obj.findSBPAndDBP(bpWaveData);
    getSBP02 = roundn(getSBP, -2);
    getDBP02 = roundn(getDBP, -2);
    
    getSBP_statisticalValue = obj.getSegmentStatisticalValue(getSBP02);
    getDBP_statisticalValue = obj.getSegmentStatisticalValue(getDBP02);
    
    SV.SBP = getSBP_statisticalValue;
    SV.DBP = getDBP_statisticalValue;
end

