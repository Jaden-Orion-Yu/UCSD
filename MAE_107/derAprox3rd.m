function [d]=derAprox(f, xo, h)
%
% Objective: Approximate the 2nd derrivative of function f with step h from xo
%
% input variables:
%   f - the input function that this function is approximating the
%   derrivative of
%   xo - the value that we're measuring the approximation of f at,
%   approximating f(xo)
%   h - step size used to approximate derrivative, usually positive,
%   indicating that this is checking the derrivative from the right
%
% output variables:
%   d - derrivative approximation 
%
% Functions called
%   none
%
% Setting Value of d using the formula for basic approximation 
%
d = (f(xo + h) - f(xo))/h;