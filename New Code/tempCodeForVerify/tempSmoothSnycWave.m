function [outSnychronizeWave] = tempSmoothSnycWave(sychronizeWave)
%TEMPSMOOTHSNYCWAVE �˴���ʾ�йش˺�����ժҪ
%   Description
%   Smooth the trigge signal
    outSnychronizeWave(sychronizeWave >= 1.5) = 3;
    outSnychronizeWave(sychronizeWave < 1.5)  = 0;    
end