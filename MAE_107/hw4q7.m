%%Problem 7
%
% Objective: calculate the approximate root of  g(x) = min(0.5 + sin(πx) +
% 3x, 5 − 2x exp[1/(1 + x2)]). using the bisection method 
%
% Functions called
%   bisec
%
%   Setting a and b, which are the beginning and endpoints for the bisec
%   function
%
a = 0;
b = 4;
%
% Settign the desired error
%
e = 10^(-5);
%
% Setting the value of the function f that is the given function that we
% are finding a root of 
% 
g = @(x) min(0.5 + sin(pi*x)+ 3*x, 5-2*x*exp(1/(1+x^2))); 
%
%   setting up the output array
%
[root, n] = bisec(g,a,b,e);
