function [output]=fixedPntEdited(func, t0,y0,z0,n)
%
% Objective: evaluates the right hand side of the function 
%
% input variables:
%   func - Given function that will be interpolated
%   t0 - initial values of t, that's used in the given function
%   y0 - initial value of y, that's used in the given function
%   z0 - initial value of the ystep function.
%   n - number of iterations
%   
% output variables:
%   output - the value of the fixed point iteration repeating n times
%
% Functions called
%   none
%
% Initializing the loop variables
%  
zk = z0;
%
% The nested for loop iterates over n number of iterations, and for each
% iteration it carryies out the function of xK+1 = func(xK,t0,y0), and in this
% case t0 and y0 are used as extra parameters.
%
for i = 1:1:n
    %
    % The for loop with repeat the set numebr of iterated times and sets a
    % temporary value for the output to work with 
    %
    zkPlus = func(t0, y0, zk);
    zk = zkPlus;
    % 
    % Setting the the output to the tempOut variable to repeat the cycle 
    %
end
%
% setting the output to be the final zk value
%
output = zk;

