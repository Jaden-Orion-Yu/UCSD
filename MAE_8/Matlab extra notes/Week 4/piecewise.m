function [y] = piecewise(x)
%PIECEWISE Summary of this function goes here
%   Detailed explanation goes here

% if x < -1 
%     y = x;
% else
%     if  -1 <= x && x <= 1
%         y = x^2;
%     else 
%         y = 3*x;
%     end % if on line 8
% end % if on line 5
% 
% 
% 
% 
% end % function

if x < -1
    y = x;
elseif x <=1 % "-1 <= x" is not necessary because the first conditional if removes this as a possibility
    y = x^2;
else
    y = 3*x;
end % line 20

end % function