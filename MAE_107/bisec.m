function [root, n]=bisec(f, a, b,e)
%
% Objective: Find a root of the function f and through the bisection method
% using endpoints a and b
%
% input variables:
%   f - the input function that this function is finding a root of 
%   a - the beginning of the range of the function over which the root will
%   be found
%   b - the end of the range of the function over which the root will be
%   found
%   e = the error to which the root should be measured
%   
% output variables:
%   root - the X value of the root
%
% Functions called
%   none
%
% Initializing the root varaible, which will be the output of the function
root = 0;
% 
% Initializing the step variable n to set the steps for the iteration
%
n = ceil((1/log(2))*log((b-a)/e));
%
% setting up a for to iterate over the bounds of the function and
% checking if f(a) < e, f(b) < e, or f(c) < e
%
for i = 0:1:(n)
    %
    % The for loop with repeat to get the root appoximation within the
    % given tolerance
    %
    % Settign the value of c, the step variable that is the midpoint between a
    % and b
    %
    c = (a+b)/2;
    %
    %   the If statement checks to see if theres a sign difference between
    %   f(b) and f(c) and assigngs a new c vallue accordingly.
    %
    if f(b)*f(c) < 0
        a = c;
    else
        b = c;
    end
    % 
    % Setting the root to be the value of c, which will be the right root
    % approximation by the end of the iterations 
    %
    root = c;
end

