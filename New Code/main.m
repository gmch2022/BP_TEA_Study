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

dataHelper  = DataHelper();
flag        = dataHelper.checkMatDataExist;

structNames = fieldnames(Experiment_overview_data_);

for i = 1:length(structNames)
    oneDayDate = Experiment_overview_data_.(structNames);
    
end



