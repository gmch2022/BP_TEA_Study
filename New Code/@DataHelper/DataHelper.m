classdef DataHelper
    %DATAHELPER 
    %   Description
    %   辅助函数
    properties
        
    end
    
    methods
        function obj = DataHelper()
            %DATAHELPER 构造此类的实例
        end
        
        function path = GetPath(obj)
            path = uigetdir;
            if(isempty(path)) 
                return;
            end

        end
    end
end

