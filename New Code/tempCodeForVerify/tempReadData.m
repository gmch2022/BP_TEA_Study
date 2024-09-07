function [allData] = tempReadData(mergedInfoBpAndParams)
%TEMPREADDATA 
% Description:
%   The structure `mergedInfoBpAndParams` should contain the file paths for 'bp' and
%       parameters along with the simulations of points. It is expected to hold the necessary
%       information linking the simulation data to its respective parameters and boundary points.
%
%   The `allData` is a structure that contains other structures as its fields. This allows for
%       organized storage of complex or interrelated data elements within a single structure.

    allData = struct();
    for i = 1:length(mergedInfoBpAndParams)    
        data = load(mergedInfoBpAndParams(i).bpPath);
        fieldName = mergedInfoBpAndParams(i).point + num2str(i); 
        allData.(fieldName) = data;

        if ~isempty(mergedInfoBpAndParams(i).paramPath)
            paramsList= txtParamList2matlist(mergedInfoBpAndParams(i).paramPath);
            allData.(fieldName).params = paramsList;
        end
    end
    % Todo: 这里可以直接读取刺激开始与结束直接假如到params中
    % 函数 tempSmoothSnycWave 与 tempConfirmSyncSegment 
end

