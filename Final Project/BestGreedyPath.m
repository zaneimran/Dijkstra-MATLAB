% ------------------------------------------------------------------------
% BestGreedyPath finds the best possible greedy path by calculating a
% greedy path from ever single location in the matrix, iterating through
% each column and row one at a time. For all points in the middle of the
% matrix e.g. not in either the first or last column, a greedy path will be
% found heading both east and west and then be combined to form one path.
% If multiple paths are found with the equal cost, the first to be found
% will be returned. 
% ------------------------------------------------------------------------
% INPUTS: * Elevation data stored in a 2D matrix 
% OUTPUTS:
%         * 1D array containing the row indicies of the path
%         * 1D array containing the column indicies of the path
%         * 1D array containing the corresponding elevations of the path
%
% Author: Zane Imran
% Date: 10/09/2017
% ------------------------------------------------------------------------

function [pathRow,pathCol,pathElevation] = BestGreedyPath(elements)
% Get matrix dimensions to set limits
[rowSize,colSize] = size(elements);
% Set lowest cost to maximum possible to ensure first cost becomes
% the new lowest cost
lowestCost = intmax;

for i=1:rowSize % Cycle through each row
    for j=1:colSize % Cycle through each column
        if j==1 % If in first column set direction to the right
            dir=1;
        elseif j==colSize % If in the last column set direction to left
            dir=-1;
        end
        
        % If in either the first or last column
        if j==1 || j==colSize
            if j==1
                % Get row and col indicies of greedy path
                [row,col] = GreedyWalk([i,j],dir,elements);
                % Calculate elevations and cost of path
                [elevations,cost] = FindPathElevationsAndCost(row,col,...
                    elements);
            else
                % Get row and col indicies of greedy path
                [row,col] = GreedyWalk([i,j],dir,elements);
                % Reverse array to be heading west to east
                row = Reverse(row);
                col = Reverse(col);
                % Calculate elevations and cost of path
                [elevations,cost] = FindPathElevationsAndCost(row,col,...
                    elements);
            end
            
            % If the current cost is less than lowest runing cost then
            % update lowest cost,path and elevations
            if cost<lowestCost
                lowestCost = cost;
                pathRow = row;
                pathCol = col;
                pathElevation = elevations;
            end
            
        else % If in any of the middle columns
            % Find greedy path heading left and right
            [leftPathRows, leftPathCols] = GreedyWalk([i j],-1, elements);
            [rightPathRows, rightPathCols] = GreedyWalk([i j],1, elements);
            % Reverse left rows and columns so that order is correct
            leftPathRows = Reverse(leftPathRows);
            leftPathCols = Reverse(leftPathCols);
            % Join the left and right rows and columns together
            % eliminating the position included twice
            row = [leftPathRows(1:end-1) rightPathRows];
            col = [leftPathCols(1:j-1) rightPathCols];
            % Calculate cost and elevation of this path
            [elevations,cost]=FindPathElevationsAndCost(row,col,elements);
            % If cost of this path is less than lowest running cost,
            % set new lowest cost, path and elevations to current data
            if cost<lowestCost
                lowestCost = cost;
                pathRow = row;
                pathCol = col;
                pathElevation = elevations;
            end
        end
    end
end
end
