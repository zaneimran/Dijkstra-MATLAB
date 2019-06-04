% ------------------------------------------------------------------------
% Greedy Walk finds a greedy path from a specific start position 
% heading in a certain direction, GreedyPick is used to pick each
% element with the minimum elevation change 
% Greedy Walk takes in the start position, an integer representing
% the direction and the elavation, it outputs the 2 1D arrays with
% the column and row indicies in them
% ------------------------------------------------------------------------
% INPUTS: * 1D array with 2 elements containing the current row and column
%           indicies, the row being index 1 and column index 2
%         * An integer represening direction to move in, 1 for east, -1 
%           for west 
%         * Elevation data stored in a 2D matrix
% OUTPUTS:
%         * A 1D array representing the row indicies of the path
%         * A 1D array representing the column indicies of the path
%
% Author: Zane Imran
% Date: 06/09/017
% ------------------------------------------------------------------------

function [pathRows, pathCols] = GreedyWalk(startPos, dir, elements)

[rowSize,colSize] = size(elements); % Store matrix dimensions to set limits 
%Create a temporary location variable and set it to the start position
tempLocation = startPos; 
% Set first index of rows and cols to be initial position
pathRows(1) = startPos(1);
pathCols(1) = startPos(2);

% Cycle through the remaining columns
for i = 2:colSize
    % If in the first column, heading right or last column heading left 
    if (tempLocation(2)<colSize && dir==1)||(tempLocation(2)>1 && dir==-1)
        % Use GreedyPick function to choose next element
        location = GreedyPick(tempLocation,dir,elements);
        % Make new location the temporary location
        tempLocation = location;
        % Index this location to the col and row array
        pathRows(i) = location(1);
        pathCols(i) = location(2);
    end
end
