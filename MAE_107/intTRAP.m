function [I]=intTRAP(f, n, a, b)
%
% Objective: Approximate the integral of function f using the trapezoidal
% method
%
% input variables:
%   f - the input function that this function is approximating the
%   integral of
%   a - the beginning of the range of the function over which the integral will
%   be taken
%   b - the end of the range of the function over which the integral will
%   be taken
%   n - the number of steps, used with a and b to determine step size
%
% output variables:
%   I - Integral approximation 
%
% Functions called
%   none
%
% Initializing the I varaible, which will be the output of the integral
% approximation, and assigning it the value of the first correction value
I= (f(a) + f(b))/2;
% 
% Settign the value of h, the step size for the integral, based on the
% range (b-a) and the number of steps (n)
%
h = (b-a)/n;
%
% setting up a for loop to iterate with stepsize h over the function n-1
% times 
%
for i = 1:1:(n-1)
    %
    % For loop is iterating across the interval [a,b] taking the function
    % value at each point k, which are intervals of h apart, summing the
    % value of the function at a those given points. The first and last
    % values f(a) and f(b) are already acounted for in the initialization
    % of the I variable
    %
    k = i*h;
    I = I + f(k);
end
%
%   Miltiplying the summed values of f(k * h) by h to get the approximate
%   Trapezoid Method integral
%
I = I*h;