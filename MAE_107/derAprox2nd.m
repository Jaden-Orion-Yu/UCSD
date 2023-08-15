function [d]=derAprox2nd(f, xo, h)
%
% Objective: Approximate the 2nd derivative of function f with step h from xo
%
% input variables:
%   f - the input function that this function is approximating the second
%   derrivative of
%   xo - the value that we're measuring the approximation of f at,
%   approximating f(xo)
%   h - step size used to approximate second derivative. 
%
% output variables:
%   d - 2nd derrivative approximation 
%
% Functions called
%   none
%
% Setting Value of d using the formula for basic approximation 
%
d = (f(xo + h) + f(xo - h) - (2*f(xo)))/(h^2);