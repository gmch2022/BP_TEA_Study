function [SV] = getStimSegmentBoxplotValue(obj, dataBP)
%GETSTIMSEGMENTBOXPLOTVALUE 
%   Description

    intervals = dataBP.intervals;
    params    = dataBP.params;

    channelNames  = fieldnames(dataBP);
    bpChannelData = channelNames{contains(channelNames, 'Ch1')};
    bpWaveData = dataBP.(bpChannelData).values;
    
    if(intervals(1) <= 1)
        intervals(1) = 1000;
    end
    
    [getSBP,getSLocs,getDBP,getDLocs] = obj.findSBPAndDBP(bpWaveData);
    getSBP02 = roundn(getSBP, -2);
    getDBP02 = roundn(getDBP, -2);
    
    find_max_idx_SBP = @(x) find(getSLocs <= x, 1, 'last');
    find_max_idx_DBP = @(x) find(getDLocs <= x, 1, 'last');
    index_matrix_SBP = arrayfun(find_max_idx_SBP, intervals);
    index_matrix_DBP = arrayfun(find_max_idx_DBP, intervals);
    
    
    SV = {};
    for i = 1:length(params)
        Name = sprintf("z%.2fmA_%dHz_%duS", params(i).current, params(i).frequency, params(i).duration);
        strName = matlab.lang.makeValidName(Name);
        preStimuSBPvalue = getSBP02(index_matrix_SBP(i,1):index_matrix_SBP(i,2));
        uponStimuSBPvaule = getSBP02(index_matrix_SBP(i,3):index_matrix_SBP(i,4));
        postStimuSBPvaule = getSBP02(index_matrix_SBP(i,5):index_matrix_SBP(i,6));
        
        SV.SBP.(strName).pre = obj.getSegmentStatisticalValue(preStimuSBPvalue);
        SV.SBP.(strName).upon = obj.getSegmentStatisticalValue(uponStimuSBPvaule);
        SV.SBP.(strName).post = obj.getSegmentStatisticalValue(postStimuSBPvaule);
        
        preStimuDBPvalue = getDBP02(index_matrix_DBP(i,1):index_matrix_DBP(i,2));
        uponStimuDBPvaule = getDBP02(index_matrix_DBP(i,3):index_matrix_DBP(i,4));
        postStimuDBPvaule = getDBP02(index_matrix_DBP(i,5):index_matrix_DBP(i,6));
        
        SV.DBP.(strName).pre = obj.getSegmentStatisticalValue(preStimuDBPvalue);
        SV.DBP.(strName).upon = obj.getSegmentStatisticalValue(uponStimuDBPvaule);
        SV.DBP.(strName).post = obj.getSegmentStatisticalValue(postStimuDBPvaule);
         
    end

end

