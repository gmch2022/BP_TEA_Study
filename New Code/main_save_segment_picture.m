%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Tag:           save the picture of stimulus segment                   %
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

% savePath       = dataHelper.GetPath();
savePath       = 'F:\gmc\BP result';

AssignDate = 'x20240704';
oneDayDate = Experiment_overview_data_.(AssignDate);
dataProcessor  = DataProcessor(oneDayDate, savePath);
SV = dataProcessor.ProcessDataStatisticAnalysis();
