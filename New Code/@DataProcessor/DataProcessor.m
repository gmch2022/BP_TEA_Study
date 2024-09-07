classdef DataProcessor
    %DATAPROCESSOR 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties (Access = public)
        DataExperiment;
        SavePath;
        OperationDate;
    end
    
    methods
        function obj = DataProcessor(Data, SavePath)
            %DATAPROCESSOR 
            %   In: Data and SavePath
            obj.DataExperiment = Data;
            obj.SavePath       = SavePath;
        end
        
        function [] = ProcessDataAnalysisSegment(obj) 
            dataName            = fieldnames(obj.DataExperiment);
            dataNameWithoutBase = dataName(~contains(dataName, 'Base'));

            timeArray = obj.DataExperiment.(dataName{1}).file.start;
            year  = num2str(timeArray(1));
            month = sprintf('%02d', timeArray(2));
            day   = sprintf('%02d', timeArray(3));
            obj.OperationDate = [year month day]; 
            
            for i = 1:length(dataNameWithoutBase)
                SplitDataSegment(obj, obj.DataExperiment.(dataNameWithoutBase{i}), obj.SavePath, dataNameWithoutBase{i});
            end
            
        end
        
        [] = SplitDataSegment(obj, dataBP, savePath, nameOfPoint)

        
    end
end

