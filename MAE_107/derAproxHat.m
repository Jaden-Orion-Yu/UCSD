function [d]=derAproxHat(f, xo, h)
%
% Objective: Approximate the derrivative of function f with step h from xo
%
% input variables:
%   f - the input function that this function is approximating the
%   derrivative of
%   xo - the value that we're measuring the approximation of f at,
%   approximating f(xo)
%   h - step size used to approximate derrivative, calculated as going out
%   either end from xo
%
% output variables:
%   d - derrivative approximation 
%
% Functions called
%   none
%
% Setting Value of d using the formula for basic approximation 
%
d = (f(xo + h) - f(xo - h))/(2*h);
