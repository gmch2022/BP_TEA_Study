function [sys_pressure,sys_locs,dia_pressure,dia_locs] = findSBPAndDBP(~, bp_data)
% FINDSBPANDDBP
    center_pressure = bp_data;
    [~, sys_locs] = findpeaks(center_pressure,'MinPeakWidth',30); 
    sys_pressure = center_pressure(sys_locs);

    [~, dia_locs] = findpeaks(-center_pressure,'MinPeakWidth',30); 
    dia_pressure = center_pressure(dia_locs); 
end   
