%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Tag:           Calculate the statistical value (boxplot params and 
%                                            mean var std )               %
%   Author:        Mingcheng Gu                                           %
%   Created:       September 11, 2024                                     %
%   Version:       1.0                                                    %
%   MATLAB Version: R2019a                                                %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   Revision History:                                                     %
%   Version 1.0 - Initial version (August 31, 2024)                       %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

savePath       = 'F:\gmc\BP result';

AssignDate = 'x20240704';
oneDayDate = Experiment_overview_data_.(AssignDate);
dataProcessor  = DataProcessor(oneDayDate, savePath);
SV = dataProcessor.ProcessDataStatisticAnalysis();


field_name = fieldnames(SV);
for i = 1:length(field_name)
    if(any(contains(field_name{i}, 'Base')))
        valueArray = [SV.(field_name{i}).SBP.min,  SV.(field_name{i}).SBP.q1, ...
            SV.(field_name{i}).SBP.midden, SV.(field_name{i}).SBP.q3, SV.(field_name{i}).SBP.max];
        stringValue = [AssignDate, field_name{i},"*"];
        drawSingleBoxplot(valueArray, stringValue);
        
        assignDateForSave = AssignDate(2:end);
        folderPath = sprintf('%s/%s/%s',savePath,assignDateForSave,field_name{i});
        imagePath  = sprintf('%s/%s/%s/%s.png',savePath,assignDateForSave,field_name{i},'OverView_Boxplot');
        
        if ~exist(folderPath, 'dir')
            mkdir(folderPath);
        end
        if ~exist(imagePath,'file')
            saveas(gcf, imagePath);         
        end
        pause(0.5);
        close;
    else
        speical_name = fieldnames(SV.(field_name{i}).SBP);
        for k = 1:length(speical_name)
            
            if speical_name{k} == "base" || speical_name{k} == "last"
                continue;
            end
            
            prevData = SV.(field_name{i}).SBP.(speical_name{k}).pre;
            uponData = SV.(field_name{i}).SBP.(speical_name{k}).upon;
            postData = SV.(field_name{i}).SBP.(speical_name{k}).post;
            
            valueArray = [];
            valueArray(1,:) = [prevData.min    , uponData.min    , postData.min    ];
            valueArray(2,:) = [prevData.q1     , uponData.q1     , postData.q1     ];
            valueArray(3,:) = [prevData.midden , uponData.midden , postData.midden ];
            valueArray(4,:) = [prevData.q3     , uponData.q3     , postData.q3     ];
            valueArray(5,:) = [prevData.max    , uponData.max    , postData.max    ];
            
     
            str = speical_name{i};
            match1 = regexp(str, 'z(\d+)_(\d+)mA', 'tokens');
            if ~isempty(match1)
                num1 = strcat(match1{1}{1}, '.', match1{1}{2});
            else
                num1 = ' ';
            end
            
            match2 = regexp(str, 'mA_(\d+)Hz', 'tokens');
            if ~isempty(match2)
                num2 = match2{1}{1};
            else
                num2 = ' ';
            end

            match3 = regexp(str, 'Hz_(\d+)uS', 'tokens');
            if ~isempty(match3)
                num3 = match3{1}{1};
            else
                num3 = ' ';
            end
            paramString = sprintf('%s(mA) %s(Hz) %s(uS)', num1, num2, num3);
            
            date = string(AssignDate);
            stringValue = [date, field_name{i}, paramString, k];
            drawTripleBoxplot(valueArray, stringValue);
            
            assignDateForSave = AssignDate(2:end);
            folderPath = sprintf('%s/%s/%s',savePath,assignDateForSave,field_name{i});
            
            imageNameString = sprintf('%s_%s_%d_%smA_%sHz_%suS_Boxplot',assignDateForSave,field_name{i},k , num1, num2, num3);
            imagePath  = sprintf('%s/%s/%s/%s.png',savePath,assignDateForSave,field_name{i},imageNameString);
            
            if ~exist(folderPath, 'dir')
                mkdir(folderPath);
            end
            if ~exist(imagePath,'file')
                saveas(gcf, imagePath);
            end
            pause(0.5);
            close;
        end
    end

end
;