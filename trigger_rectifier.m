function [outputArg1,outputArg2] = trigger_rectifier(inputArg1,inputArg2)
%TRIGGER_rectifier is ued to signal preprocessing
%   使trigger信号去除小的噪声
%   inputArg1 is trigger; inputArg2 is bp;
%   outputArg1 is trigger; outputArg2 is bp;
%% 第一版本，速度慢
% outputArg1 = [];
% len = length(inputArg1);
% for i = 1:len
%     if inputArg1(i) < 1
%         inputArg1(i) = 0;
%     else
%         inputArg1(i) = 3;
%     end
%     outputArg1 = inputArg1 ;
% end
%% 改用向量化之后，速度变快
%   denoise the trigger
outputArg1 = (inputArg1 >= 1.5) * 3;
outputArg1(inputArg1 < 1.5) = 0;
%%
% make bp and trigger has the same demension
% Only the case of column vectors is considered; ps: 41456*1

if length(inputArg2) >= length(inputArg1) % if bp >= trigger ,trigger should padding zero
    temp = zeros(length(inputArg2)-length(inputArg1),1) ;
    outputArg1= [outputArg1; temp];  % trigger = [trigger; 0]
    outputArg2 = inputArg2;
    
elseif length(inputArg2) <= length(inputArg1)   %if bp <= trigger ,bp shoud padding zero
    temp = zeros(length(inputArg1)-length(inputArg2),1) ;
    outputArg1 = outputArg1;
    outputArg2 = [inputArg2; temp];
end