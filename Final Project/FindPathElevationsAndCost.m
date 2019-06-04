% ------------------------------------------------------------------------
% FindPathElevationsAndCost takes a given path and finds the elevations
% along the path and also returns the cost of that path. The total cost is
% found by summing the absolute value of all the elevation changes 
% ------------------------------------------------------------------------
% INPUTS: * 1D array containing the row indicies of the path
%         * 1D array containing the column indicies of the path
%         * Elevation data stored in a 2D matrix
% OUTPUTS:
%         * A 1D array containing the elevations for corresponding row and
%           column indicies of the path
%         * The total cost of the path
%
% Author: Zane Imran
% Date: 4/9/2017
% ------------------------------------------------------------------------

function [elevations,cost] = FindPathElevationsAndCost(row,col,elements)
% Find value of elevation at each row and col indicie of element matrix
for i = 1:length(col)
    elevations(i) = elements(row(i),col(i));   
end
% Scan through each element in elevations 
for i = 1:length(elevations)
    % Make sure only comparing values within the index range
    if i<length(elevations)
        %Calculate difference between nth and n+1 value and store in costs 
        costs(i) = abs(elevations(i) - elevations(i+1));
    else
        % If out of range, break out of loop
        break
    end
end
% Sum together all the differences in the array to get cost of path
cost = sum(costs);
end
