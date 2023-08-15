%%Problem 6
%
% Objective: calculate the approximate root of f(x) = sin(x) + (5/4)x − 2
% using the seacant method
%
% Functions called
%   seacant
%
%   Setting x0 and x1, which are the first two guesses to start the seacant
%   function
%
x0 = 3;
x1 = 2;
n = 8;
%
%
% Setting the value of the function f that is the given function that we
% are estimating a root of 
% 
f = @(x) sin(x) + (5/4)*x - 2; 
%
%   Running the seacant function with the given inputs 
%
root = secant(f,x0,x1,n);
%
%   gettign the desired output of x8 and f(x8);
rootVal = root(9);
yVal = f(rootVal);