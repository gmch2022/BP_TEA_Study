classdef DataAssembler
    %DATAASSEMBLER Created by Mincheng Gu
    %   This class handles the processing and assembly of experiment data.  
    properties(Access = public)
        dir_path  
        experiment_data
        operation_date
        number_of_segment_experiment
    end        
        
    properties (Access = private)
        taiChong = [0, 0];
        quChi    = [0, 0];
        zuSanLi  = [0, 0];
        renYin   = [0, 0];
        heGu     = [0, 0];

    end
%--------------------------------------------------------------------------    
    methods
        function obj = DataAssembler(dirPath)
            %DATAASSEMBLER ���캯��
            %   �������ݵ�Ŀ¼·��������·����
            obj.dir_path = dirPath;
        end
        
        function OneExperimentData = ProcessDataAssembling(obj)
            % The main process
            [bpFileInfo, paramFileInfo]   =    obj.DistinctBpAndParamFile(obj.dir_path);
            [bpFilePath, paramFilePath]   =    obj.FindPathOfData(bpFileInfo, paramFileInfo); 
            mergedInfo                    =    obj.MatchPathOfBpAndParam(bpFilePath, paramFilePath); 
            obj.experiment_data           =    obj.ReadDataIntoStruct(mergedInfo);
            OneExperimentData             =    obj.experiment_data ;
        end
        
        [bpFileInfo, paramFileInfo] = DistinctBpAndParamFile(obj, dirPath)   
        [bpFilePath, paramFilePath] = FindPathOfData(obj, bpFileInfo, paramFileInfo)   % ��������·��  
        mergedFileInfo = MatchPathOfBpAndParam(obj, bpFilePath, paramFilePath) % ƥ��BP�ļ��Ͳ����ļ���·��  
        OneExperimentData = ReadDataIntoStruct(obj, mergedFileInfo) % �����ݶ���ṹ��
%----------------------------------------------------------------------------
        params = txtParamList2matList(obj, paramPath)   % ���ı������б�ת��Ϊ�����б�
        dataPathList = tempFindPathOfdata(obj, Typelist, Type)  % Used In FindPathOfData
        [intervals] = tempSplitInterval(param) % Spliting the interval in BP segment,
        
        function [outSnychronizeWave] = tempSmoothSnycWave(sychronizeWave)
            % sychronizeWave should be an array
            outSnychronizeWave(sychronizeWave >= 1.5) = 3;
            outSnychronizeWave(sychronizeWave < 1.5)  = 0;    
        end
        
        function [syncInfo] = tempConfirmSyncSegment(SynchronizeWave)
            % Find the beginning and end of the Synchronized signal
            threshold = 0.5; 
            rising_edges   = find(diff(SynchronizeWave > threshold) > 0); 
            falling_edges  = find(diff(SynchronizeWave < threshold) > 0); 
            syncInfo(:, 1) = rising_edges; 
            syncInfo(:, 2) = falling_edges;
        end
        

    end
end
