% ------------------------------------------------------------------------
% BestPath finds the best possible path through the 2D matrix, it stores
% the cost to get to each position in a cost matrix with the same
% dimensions as the elevation matrix. It also stores the row indicies in a
% cell, containing arrays of the row indicies. It also calls the function
% 'comparePoints' to compare costs and build the two matricies.
% ------------------------------------------------------------------------
% INPUTS: * Elevation data stored in a 2D matrix 
% OUTPUTS:
%         * 1D array containing the row indicies of the path
%         * 1D array containing the column indicies of the path
%         * 1D array containing the corresponding elevations of the path
%
% Author: Zane Imran
% Date: 15/09/2017
% ------------------------------------------------------------------------

function [pathRow,pathCol,pathElevation] = BestPath(elements)
[row,col] = size(elements); % Get size of elements matrix
% Create cost matrix with first column as zero and the rest infinity
costs(1:row,2:col) = inf;
rows = {}; % Create an empty cell to store row indicies


for j=1:col-1 % Cycle through rows
    for i=1:row % Cycle through columns, but not the last one
        % Make first row of 'rows' cell the current row number
        rows{i,1} = i;
        if i == 1 % If in the first row
            c1 = inf; % Set cost 1 to be infinity as it does not exist
            % set cost2 to the difference between current and infront
            c2 = costs(i,j) + abs(elements(i,j) - elements(i,j+1));
            % set cost3 to difference between current and one below
            c3 = costs(i,j) + abs(elements(i,j) - elements(i+1,j+1));
            % store cost in cost matrix
            [costs,rows] = comparePoints(i,j,c1,c2,c3,costs,rows,row);
            
        elseif i == row % Last Row
            c1 = costs(i,j) + abs(elements(i,j) - elements(i-1,j+1));
            c2 = inf;
            c3 = costs(i,j) + abs(elements(i,j) - elements(i,j+1));
            [costs,rows] = comparePoints(i,j,c1,c2,c3,costs,rows,row);
            
        else % Every other row
            c1 = costs(i,j) + abs(elements(i,j) - elements(i-1,j+1));
            c2 = costs(i,j) + abs(elements(i,j) - elements(i,j+1));
            c3 = costs(i,j) + abs(elements(i,j) - elements(i+1,j+1));
            [costs,rows] = comparePoints(i,j,c1,c2,c3,costs,rows,row);
        end
    end
end
lastCol = costs(:,col); % Get all all the total costs in the last column
pos = min(lastCol); % Find the minimum cost to get to the last column
rowPos = find(pos==lastCol); % Find index of the lowest cost value 

% Get the row array from last column of 'rows' cell
pathRow = rows{rowPos(1),col};
pathCol = [1:col]; % Create array of all column values 
% Get the elevation data for the path
[pathElevation,cost] = FindPathElevationsAndCost(pathRow, pathCol,...
    elements); 
end
