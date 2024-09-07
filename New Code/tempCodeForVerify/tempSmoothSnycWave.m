function [outSnychronizeWave] = tempSmoothSnycWave(sychronizeWave)
%TEMPSMOOTHSNYCWAVE 此处显示有关此函数的摘要
%   Description
%   Smooth the trigge signal
    outSnychronizeWave(sychronizeWave >= 1.5) = 3;
    outSnychronizeWave(sychronizeWave < 1.5)  = 0;    
end