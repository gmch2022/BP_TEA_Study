classdef DataHelper
    %DATAHELPER 
    %   Description
    %   ��������
    properties
        
    end
    
    methods
        function obj = DataHelper()
            %DATAHELPER ��������ʵ��
        end
        
        function path = GetPath(obj)
            path = uigetdir;
            if(isempty(path)) 
                return;
            end

        end
    end
end

