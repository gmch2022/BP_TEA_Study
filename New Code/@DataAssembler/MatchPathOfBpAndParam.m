function [mergedFileInfo] = MatchPathOfBpAndParam(obj, bpFilePath, paramFilePath)
%MATCHPATHOFBPANDPARAM 此处显示有关此函数的摘要
%   In: (Struct [path, point, segmentIdx])
%       bpFilePath    :
%       paramFilePath :
%   Out:(Struct [bpPath, paramPath, point, segmentIdx])
%       mergedFileInfo: BP and Parameter path in a struct, which used to
%           read the data.

    mergedFileInfo = struct('bpPath', [], 'paramPath', [], 'point', [], 'segmentIdx', []);
    for i = 1:length(bpFilePath)
        mergedFileInfo(i).bpPath = bpFilePath(i).path;
        mergedFileInfo(i).point = bpFilePath(i).point;
        mergedFileInfo(i).segmentIdx = bpFilePath(i).segmentIdx;

        paramMatch = find([paramFilePath.segmentIdx] == bpFilePath(i).segmentIdx, 1);
        if ~isempty(paramMatch)
            if(mergedFileInfo(i).point ~= paramFilePath(paramMatch).point)
                warning("Parameter of Acu-positions do not match");
            end
            mergedFileInfo(i).paramPath = paramFilePath(paramMatch).path;
        end
    end
end

