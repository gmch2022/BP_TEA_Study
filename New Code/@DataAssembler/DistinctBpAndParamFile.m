function [BpFileInfo, ParamFileInfo] = DistinctBpAndParamFile(obj, dirPath)
%DISTINCTBPANDPARAMFILE 
%   Description
    BpFileInfo   = dir(fullfile(dirPath, '*.mat'));
    ParamFileInfo = dir(fullfile(dirPath, '*.txt'));
end

