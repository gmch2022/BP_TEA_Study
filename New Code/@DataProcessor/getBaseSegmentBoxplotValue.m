function [SV] = getBaseSegmentBoxplotValue(obj, dataBP)
%getBaseSegmentBoxplotValue
%   Description
                    
    params    = dataBP.params;
    startIdx  = params(1).start;

    channelNames  = fieldnames(dataBP);
    bpChannelData = channelNames{contains(channelNames, 'Ch1')};
    bpWaveData = dataBP.(bpChannelData).values;

    [getSBP,getSLocs,getDBP,getDLocs] = obj.findSBPAndDBP(bpWaveData);
    
    transIndex01 = find(getSLocs <= startIdx, 1, 'last');
    transIndex02 = find(getDLocs <= startIdx, 1, 'last');
    if(getSLocs(transIndex01) > getDLocs(transIndex02))
        transIndex = transIndex01;
    else
        transIndex = transIndex02;
    end
    
    getSBP02 = roundn(getSBP(1: transIndex), -2);
    getDBP02 = roundn(getDBP(1: transIndex), -2);

    getSBP_statisticalValue = obj.getSegmentStatisticalValue(getSBP02);
    getDBP_statisticalValue = obj.getSegmentStatisticalValue(getDBP02);
    
    SV.SBP.base = getSBP_statisticalValue;
    SV.DBP.base = getDBP_statisticalValue;
    SV.base_time = startIdx;
    
end

