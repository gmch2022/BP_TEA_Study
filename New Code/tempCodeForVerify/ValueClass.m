classdef ValueClass
    properties
        Value
        Value2
    end
    
    methods
        function obj = ValueClass(initialValue)
            if nargin > 0
                obj.Value = initialValue;
            end
        end
        
        function obj = SetValue(obj, newValue)
            obj.Value = newValue;
        end
        
        function testValue = SetFunction(~,newValue)
            testValue = newValue;
        end
        
        function [obj,temp] = SetValue2(obj, newValue)
            obj.Value2 = obj.SetFunction(newValue);
            temp = 50;
        end
    end
end