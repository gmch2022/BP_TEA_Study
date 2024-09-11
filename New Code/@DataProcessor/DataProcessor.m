classdef DataProcessor
    %DATAPROCESSOR 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties (Access = public)
        DataExperiment;
        SavePath;
        OperationDate;
        SatisticalInfo;
    end
    
    methods
        function obj = DataProcessor(Data, SavePath)
            %DATAPROCESSOR 
            %   In: OneDayData and SavePath
            %   OneDayData is struct that contains acu_point data
            obj.DataExperiment = Data;
            obj.SavePath       = SavePath;
        end
        
        function obj = ProcessDataAnalysisSegment(obj) 
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
        
        function [SV] = ProcessDataStatisticAnalysis(obj)
            dataName = fieldnames(obj.DataExperiment);
            SV = {};
            for i = 1:length(dataName)
                if ( any(contains(dataName{i}, 'Base')) )
                    % calculate per minute static data
                    wholeSegmentSv = obj.getWholeSegmentBoxplotValue(obj.DataExperiment.(dataName{i}));
                    SV.(dataName{i}) = wholeSegmentSv;
                    obj.SatisticalInfo.(dataName{i}) = wholeSegmentSv;
                else
                    % 寻找区间中的SBP与DBP
                    wholeSegmentSv = {};
                    PreStimulusSV    = obj.getBaseSegmentBoxplotValue(obj.DataExperiment.(dataName{i}));
                    UponStimulusSV   = obj.getStimSegmentBoxplotValue(obj.DataExperiment.(dataName{i}));
                    PostStimulusSV   = obj.getPostSegmentBoxplotValue(obj.DataExperiment.(dataName{i}));
            
                    wholeSegmentSv.base_time = PreStimulusSV.base_time;
                    wholeSegmentSv.last_time = PostStimulusSV.last_time;
                    
                    wholeSegmentSv.SBP = UponStimulusSV.SBP;
                    wholeSegmentSv.DBP = UponStimulusSV.DBP;
                    
                    wholeSegmentSv.SBP.base = PreStimulusSV.SBP.base;
                    wholeSegmentSv.DBP.base = PreStimulusSV.DBP.base;
                    wholeSegmentSv.SBP.last = PostStimulusSV.SBP.last;
                    wholeSegmentSv.DBP.last = PostStimulusSV.DBP.last;
                    
                    SV.(dataName{i}) = wholeSegmentSv;
                    obj.SatisticalInfo.(dataName{i}) = wholeSegmentSv;
                end
            end
            
        end
        
        
        

        [] = SplitDataSegment(obj, dataBP, savePath, nameOfPoint)
        wholeSegmentSV   = getWholeSegmentBoxplotValue(obj, dataBpOfOnePoint);
        PreStimulusSV    = getBaseSegmentBoxplotValue(obj, dataBpOfOnePoint);
        OnStimulusSV     = getStimSegmentBoxplotValue(obj, dataBpOfOnePoint);
        PostStimulusSV   = getPostSegmentBoxplotValue(obj, dataBpOfOnePoint);
        
        [sBP,sLocs,dBP,dLocs] = findSBPAndDBP(~, dataOfBpWave)        
        statisticalValue = getSegmentStatisticalValue(~, dataOfBpWave);
        
        
        
    end
end

