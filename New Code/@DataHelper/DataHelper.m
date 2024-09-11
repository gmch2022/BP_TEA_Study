classdef DataHelper
    %DATAHELPER 
    %   Description
    %   Auxiliar Tools
    properties
        
    end
    
    methods
        function obj = DataHelper()
            %DATAHELPER 
        end
        
        function path = GetPath(obj)
            path = uigetdir;
            if(isempty(path)) 
                return;
            end
        end
        
        function flag = checkMatDataExist(~)
            fileExists = exist(fullfile('DataRepository', 'Experiment_overview_data.mat'), 'file');
            varExists  = exist('Experiment_overview_data_', 'var');
            global Experiment_overview_data_ ;
            if fileExists || varExists
                flag = true;
                if fileExists
                    load(fullfile('DataRepository', 'Experiment_overview_data.mat'));
                else
                    Experiment_overview_data_ = evalin('base', 'Experiment_overview_data_');
                end
            else
                Experiment_overview_data_ = struct(); 
                save(fullfile('DataRepository', 'Experiment_overview_data.mat'), 'Experiment_overview_data_');
                flag = false;
            end
            assignin('base', 'Experiment_overview_data_', Experiment_overview_data_);
        end
        
    end
end

