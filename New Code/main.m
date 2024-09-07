%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Tag:           The main process for operating acupunture data         %
%   Author:        Mingcheng Gu                                           %
%   Created:       August 31, 2024                                        %
%   Version:       1.0                                                    %
%   MATLAB Version: R2019a                                                %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Revision History:                                                     %
%   Version 1.0 - Initial version (August 31, 2024)                       %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dataHelper     = DataHelper();
% loadPath       = dataHelper.GetPath();
% "F:\gmc\BP file\mat_240615"; 
loadPath = ["F:\gmc\BP file\mat_240615";
            "F:\gmc\BP file\mat_240617"; 
            "F:\gmc\BP file\mat_240717"; 
            "F:\gmc\BP file\mat_240720"];


for i = 4:4
    dataAssembler  = DataAssembler(char(loadPath(i)));
    dataExperiment = dataAssembler.ProcessDataAssembling();

    % savePath       = dataHelper.GetPath();
    savePath       = 'F:\gmc\BP result';
    dataProcessor  = DataProcessor(dataExperiment, savePath);
    dataProcessor.ProcessDataAnalysisSegment();
end


