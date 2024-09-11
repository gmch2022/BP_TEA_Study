function [params] = txtParamList2matList(obj, paramPath)
%TXTPARAMLIST2MATLIST created by Mingcheng.Gu
%   Description
%   from txtParamList2matlist
%   in : paramPath - a text file
%   out: params    - a mat struct contains params infornmation

    fileID = fopen(paramPath, 'r', 'n', 'UTF-8'); 
    textData = textscan(fileID, '%s', 'Delimiter', '\n');
    textData = textData{1};
    
    params = struct('group', [], 'frequency', [], 'current', [], 'duration', []);
    patternParam = '第\s*(\d+)\s*组刺激开始，刺激参数:\s*([\d.]+)Hz\s*([\d.e+-]+)mA\s*(\d+)ms';

    index = 1;
    for i = 1:length(textData)
        line = textData{i};
        
        paramTokens = regexp(line, patternParam, 'tokens');
        if ~isempty(paramTokens)
            paramTokens = paramTokens{1}; 
            groupNumber = str2double(paramTokens{1});
            frequency = str2double(paramTokens{2});
            current = str2double(paramTokens{3});
            duration = str2double(paramTokens{4});

            params(index) = struct( ...
                'group', groupNumber, ...
                'frequency', frequency, ...
                'current', current, ...
                'duration', duration ...
            );
            index = index + 1;
        end
    end
    params = params(~cellfun(@isempty, {params.group}));
    
    endIndex = params(end).group;
    groupEndPattern = sprintf('第\\s*%d\\s*组刺激结束', endIndex);
    hasEnd = any(cellfun(@(line) ~isempty(regexp(line, groupEndPattern, 'once')), textData));
    if hasEnd == 0
        params(end) = [];
    end
end

