% ------------------------------------------------------------------------
% comparePoints is a helper function called by BestPath which is used to
% compare the points in the elevation matrix and build the cost and row
% matricies.
% ------------------------------------------------------------------------
function [costs,rows]=comparePoints(i,j,c1,c2,c3,costs,rows,row)
if i~=1 & c1<costs(i-1,j+1) % If not in the first row and current cost is 
                             %less the cost already in the position
    costs(i-1,j+1) = c1; % Replace old cost with the new cost (above)
    rows{i-1,j+1} = [rows{i,j},i-1]; % Store the row indicies in an array,
                                     % in the cell 'rows'
end
% If current cost is less the cost already in the position
if c2<costs(i,j+1) 
    costs(i,j+1) = c2; %Replace old cost with the new cost (infront)
    rows{i,j+1} = [rows{i,j},i]; % Store the row indicies in an array, 
                                 % in the cell 'rows'
end
% If not in the last row and current cost is less the cost already
% in the position
if i~=row & c3<costs(i+1,j+1) 
    costs(i+1,j+1) = c3; % Replace old cost with new cost (below)
    rows{i+1,j+1} = [rows{i,j},i+1]; % Store the row indicies in an array,
                                     % in the cell 'rows'
end
end