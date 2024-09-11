function [allData] = ReadDataIntoStruct(obj, mergedInfoBpAndParams)
%READDATAINTOSTRUCT 
%   Description
%   In : (struct: bpPath paramPath Point segmentIdx)
%       mergedInfoBpAndParams
%   Out: (struct: the data of acupunture)
%       allData

    allData = struct();
    for i = 1:length(mergedInfoBpAndParams)    
        data = load(mergedInfoBpAndParams(i).bpPath);
        fieldName = mergedInfoBpAndParams(i).point + num2str(i); 
        
        if ~isempty(mergedInfoBpAndParams(i).paramPath)
            paramsList     = obj.txtParamList2matList(mergedInfoBpAndParams(i).paramPath);
            data.params    = paramsList;
            
            fieldNames     = fieldnames(data);
            strDataName    = fieldNames(~contains(fieldNames, 'Ch2001'));
            strChannelBp   = strDataName(contains(strDataName, 'Ch1'));
            strChannelSync = strDataName(contains(strDataName, 'Ch2'));
            
            readLength     = min(data.(strChannelBp{1}).length, data.(strChannelSync{1}).length);
            dataStimu      = obj.tempSmoothSnycWave(data.(strChannelSync{1}).values(1: readLength));
            syncInfo       = obj.tempConfirmSyncSegment(dataStimu);
            
            if(length(data.params) ~= length(syncInfo) )
                disp("The length of parameter record is not match the number of trigger");
                disp(fieldName);
            end
            
            for I = 1:size(syncInfo, 1)
                data.params(I).start = syncInfo(I, 1);
                data.params(I).end = syncInfo(I,2);
            end
            
            data.intervals = obj.tempSplitInterval(data.params);
        end
        allData.(fieldName) = data;
        obj.number_of_segment_experiment = length(allData);
        
        timeArray = data.file.start;
        year  = num2str(timeArray(1));
        month = sprintf('%02d', timeArray(2));
        day   = sprintf('%02d', timeArray(3));
        obj.operation_date = [year month day];   
 
    end
end

