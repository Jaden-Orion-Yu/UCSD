function [root]=secant(f, x0, x1,n)
%
% Objective: Find a root of the function f and through the seacant method
% using n number of steps and the two initail guesses of x0 and x1
%
% input variables:
%   f - the input function that this function is finding a root of 
%   x0 - the first estimation for a root
%   x1 - the second estimation for the root
%   n - the number of steps 
%   
% output variables:
%   root - an array of x variables of n+1 length
%
% Functions called
%   none
%
% Initializing the root varaible, an array of x values which will be the
% output of the function
root = zeros(1,(n+1));
root(1) = x0;
root(2) = x1;
%
%
% the for loop will iterate until it produces Xk where k is the same value
% of n.
%
for i = 2:1:(length(root))
    %
    % The for loop with repeat to get the root appoximation with the given
    % steps, producing a new Xkplus value every iteration that is closer to
    % the root value.
    %
    root(i+1)= root(i) - (f(root(i))*(root(i) - root(i-1)))/(f(root(i)) - f(root(i-1)));
end