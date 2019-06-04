% ------------------------------------------------------------------------
% The GreedyPick function chooses which position to go to next. It will
% choose the position which has the smallest elevation change. In the 
% event of a tie for smallest change, it will chose the northen most 
% element.
% ------------------------------------------------------------------------
% INPUTS: * 1D array with 2 elements containing the current row and column
%           indicies, the row being index 1 and column index 2
%         * An integer represening direction to move in, 1 for east, -1 
%           for west 
%         * Elevation data stored in a 2D matrix
% OUTPUTS:
%         * A 1D array containing a list of indicies with the smallest
%           elevation change 
%
% Author: Zane Imran
% Date: 4/9/2017
% ------------------------------------------------------------------------

function [pick] = GreedyPick(currentPos, dir, elements)
[r,c] = size(elements); % Get dimensions of elevations matrix
direct=-1; % Set initial direction to heading west
if dir==1 % If the chosen direction is east, set direction to east
    direct = 1;
end
options = []; % Create empty array to store elements
if currentPos(1) == 1 % If current position is at the top edge
    for i = 0:1 % Store element directly infront and diagonally below
        options(i+1) = elements(currentPos(1)+ i,(currentPos(2) + direct));
    end
elseif currentPos(1) == r % If current position is at the bottom edge
    for i = -1:0 % Store element diagonally above and directly infront
        options(i+2) = elements(currentPos(1)+ i,(currentPos(2) + direct));
    end
else % If current position is anywhere in the midle
    for i = -1:1
        % Store element diagonally above, infront and diagonally below
        options(i+2) = elements(currentPos(1)+ i,(currentPos(2) + direct));
    end
end
% Find the position of the smallest elevation change(s)
pos = FindSmallestElevationChange((elements(currentPos(1),...
    currentPos(2))),options);
% Always choose the first option as this is the northen most option
if length(pos)>1
    pos = pos(1);
end

% If in either top or bottom row only two possible options
if length(options) == 2
    if currentPos(1)==1 && pos==2 % If in top row and second position
        pick = [currentPos(1)+1,(currentPos(2) + direct)];%pick bot square
    elseif currentPos(1)==r && pos==1 %If in bottom row and first position
        pick = [currentPos(1)-1,(currentPos(2) + direct)];%pick top square
    else % If first option then pick directly infront
        pick = [currentPos(1),(currentPos(2) + direct)];
    end
else % If there are 3 options
    if pos==1 % If option 1 is best then pick top diagonal
        pick = [currentPos(1)-1,(currentPos(2) + direct)];
    elseif pos==3 %If option 3 is best then pick bottom diagonal
        pick = [currentPos(1)+1,(currentPos(2) + direct)];
    else % Otherwise middle is best option so pick directly in front
        pick = [currentPos(1),(currentPos(2) + direct)];
    end
end
end

