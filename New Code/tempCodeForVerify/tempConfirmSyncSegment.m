function [syncInfo] = tempConfirmSyncSegment(SynchronizeWave)
%TEMPCONFIRMSYNCSEGMENT 
%   Description
%   Find stimulus segment start and end point
    threshold = 2; 
    rising_edges  = find(diff(SynchronizeWave > threshold) > 0); 
    falling_edges = find(diff(SynchronizeWave < threshold) > 0);
    
              len = min(length(rising_edges), length(falling_edges));
     rising_edges = rising_edges (:, 1:len);
    falling_edges = falling_edges(:, 1:len);
    
    syncInfo(:, 1) = rising_edges; 
    syncInfo(:, 2) = falling_edges;
end

