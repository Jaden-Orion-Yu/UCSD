function [I]=intCT(f, n, a, b)
%
% Objective: Approximate the integral of function f using the corrected trapezoidal
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
%   intTRAP - evaluates an integral using integrated trap method (f, n, a, b)
% 
% Settign the value of h, the step size for the integral, based on the
% range (b-a) and the number of steps (n)
%
h = (b-a)/n;
%
% Initializing output I using the the intTRAP function to approximate the
% integral of f over interval [a,b]
%
I = intTRAP(f,n,a,b);
%
% Appling the correction that's part of the corrected trap method to I,
% which currently has the value of the approximate integral using the
% intTRAP function
%
I = I - ((h/24)*( (3*f(a)) - (4*f(a + h))  + (f(a + (2*h))) + (f(b - (2*h))) - (4*f(b-h))+ (3*f(b))));
