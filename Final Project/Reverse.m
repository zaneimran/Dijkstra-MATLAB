% ------------------------------------------------------------------------
%The reverse function takes in a 1D array as an input and returns the
% array reversed in another 1D array
% ------------------------------------------------------------------------
% INPUTS: 1D array called 'array'
% OUTPUTS: Reversed 1D Array called 'reversedArray'
% Author: Zane Imran
% Date: 4/9/2017
% ------------------------------------------------------------------------

function [reversedArray] = Reverse(array)
% Use flip array using matlab inbuilt flip function 
reversedArray = flip(array);
end


