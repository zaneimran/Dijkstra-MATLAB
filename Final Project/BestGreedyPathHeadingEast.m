% ------------------------------------------------------------------------
% BestPathHeadingEast will find the best path starting from the westerly
% most edge, it uses FindPathElevationsAndCost and GreedyWalk to chose 
% the best greedy path and the elevations and cost. 
% ------------------------------------------------------------------------
% INPUTS: * Elevation data stored in a 2D matrix 
% OUTPUTS:
%         * 1D array containing the row indicies of the path
%         * 1D array containing the column indicies of the path
%         * 1D array containing the corresponding elevations of the path
%
% Author: Zane Imran
% Date: 09/09/2017
% ------------------------------------------------------------------------

function [pathRow,pathCol,pathElevation] = BestGreedyPathHeadingEast(...
    elements)
[rowSize,colSize] = size(elements); % Get matrix dimensions to set limits 
% Initially set lowest cost to be maximum so that the first calculated cost
% will become the new lowest cost
lowestCost = intmax;

% Cycle through each row in the matrix 
for i=1:rowSize
    % Use GreedyWalk function to find shortest path row and col indicies
    [row,col] = GreedyWalk([i,1],1,elements);
    % Get elevation and cost for path found using GreedyWalk
    [elevations,cost] = FindPathElevationsAndCost(row,col,elements);
    % If the new cost found is the lowest then set current data to be the
    % new lowest data
    if cost<lowestCost
        lowestCost = cost; % Overwrite lowest cost
        pathRow = row; % Overwrite row indicies
        pathCol = col; % Overwrite column indicies
        pathElevation = elevations; % Overwrite elevation data
    end
end
end


