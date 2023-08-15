function [output]=fixedPnt(funcArray, input,n)
%
% Objective: evaluates the right hand side of the function array with the
% given inputs (being xn+1 values = [f(x)]) n number of times 
%
% input variables:
%   funcArray - the array of functions of x = f(x)
%   input - initial values of x1_0-xn_0
%   n - number of iterations
%   
% output variables:
%   output - the array of root approximates using fixed point iteration
%
% Functions called
%   none
%
% Initializing the ouptu varaible, which will be the output of the function
output = input;
%
% The nested for loop iterates over n number of iterations, and for each
% iteration it carryies out the function of x1_n+1 = F_1(x1_n, x2_n, - , xn_n)
%
for i = 1:1:n
    %
    % The for loop with repeat the set numebr of iterated times and sets a
    % temporary value for the output to work with 
    %
    tempOut = output;
    for j  =1:1:length(funcArray)
        %
        %This for loop iterates the length of FuncArray (which will always
        %be the same length as the inputs) and carries out a single fixed
        %point iteration.
        %
        tempOut(j) = funcArray{j}(output(1),output(2),output(3));
    end
    % 
    % Setting the the output to the tempOut variable to repeat the cycle 
    %
    output = tempOut;
end

