%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Tag:           Update the mat file that save the data of BP           %
%   Author:        Mingcheng Gu                                           %
%   Created:       September 8, 2024                                      %
%   Version:       1.0                                                    %
%   MATLAB Version: R2019a                                                %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Revision History:                                                     %
%   Version 1.0 - Initial version (August 31, 2024)                       %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


dataHelper  = DataHelper();
flag        = dataHelper.checkMatDataExist;

% loadPath  = dataHelper.GetPath(); 
loadPath = [
            "F:\gmc\BP file\mat_240606"; 
            "F:\gmc\BP file\mat_240612"; 
            "F:\gmc\BP file\mat_240615";
            "F:\gmc\BP file\mat_240617"; 
            "F:\gmc\BP file\mat_240703";
            "F:\gmc\BP file\mat_240717"; 
            "F:\gmc\BP file\mat_240720"];

for i = 1:length(loadPath)
    disp(loadPath(i));
    dataAssembler  = DataAssembler(char(loadPath(i)));
    dataExperiment = dataAssembler.ProcessDataAssembling();
    operationDate  = dataAssembler.operation_date;
    validFieldName = matlab.lang.makeValidName(operationDate);
    Experiment_overview_data_.(validFieldName) = dataExperiment;
end

save(fullfile('DataRepository', 'Experiment_overview_data.mat'), 'Experiment_overview_data_', '-append', '-v7.3');

