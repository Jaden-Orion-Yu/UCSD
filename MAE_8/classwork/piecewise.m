function [y] = piecewise(x)
%PIECEWISE Summary of this function goes here
%   Detailed explanation goes here

if x < -1
    y = x;
else
    if -1 <= x && x <=1
        y = x^2;
    else
        y = 3*x;
    end
end



end% function piecewise

