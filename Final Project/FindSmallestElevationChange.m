% ------------------------------------------------------------------------
% The FindSmallestElevationChange function takes the current elevation and
% the list of elevations as an input and returns the position of the
% smallest elevation changes in the array, if there are multiple smallest
% elvevations both indicies will be returned 
% ------------------------------------------------------------------------
% INPUTS: * A number representing the current elevations
%         * A 1D array containg a list of elevations to choose from
% OUTPUTS:
%         * A 1D array containing a list of indicies with the smallest
%           elevation change 
%
% Author: Zane Imran
% Date: 4/9/2017
% ------------------------------------------------------------------------

function [smallestChange] = FindSmallestElevationChange(...
    currentElevation, elevations)

% Cycle through each element in elevations and find difference compared to
% current elevation, store differences in a list
for i = 1:length(elevations)
    % Find absolute difference between current elevation and options
    differences(i) = abs(currentElevation - elevations(i));
end
% Find the value of the minimum difference 
vals = min(differences);
% Find the indicies of these minimum values in the list
smallestChange = find(vals==differences);

end