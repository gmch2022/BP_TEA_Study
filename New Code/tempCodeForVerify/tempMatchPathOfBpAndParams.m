function [mergedStruct] = tempMatchPathOfBpAndParams(bpFilePath,paramFilePath)
%Temp Match Path Of Bp And Params
% Description:
%   This function matches information between 'bp' and 'params' data sets.
%   It returns the matched paths for 'bp' and 'params', along with the corresponding
%   simulation parameters and indices.
%
% Struct:
%   - bpPath: Path to the matched 'bp' data file.
%   - paramPath: Path to the matched 'params' data file.
%   - point: The simulation point.
%   - idx: The index of data.

    mergedStruct = struct('bpPath', [], 'paramPath', [], 'point', [], 'segmentIdx', []);
    for i = 1:length(bpFilePath)
        mergedStruct(i).bpPath = bpFilePath(i).path;
        mergedStruct(i).point = bpFilePath(i).point;
        mergedStruct(i).segmentIdx = bpFilePath(i).segmentIdx;

        paramMatch = find([paramFilePath.segmentIdx] == bpFilePath(i).segmentIdx, 1);
        if ~isempty(paramMatch)
            if(mergedStruct(i).point ~= paramFilePath(paramMatch).point)
                warning("Parameter of Acu-positions do not match");
            end
            mergedStruct(i).paramPath = paramFilePath(paramMatch).path;
        end
    end
    
end

