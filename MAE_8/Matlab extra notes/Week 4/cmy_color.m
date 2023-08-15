function [color] = cmy_color(cmy)
%CMY_COLOR Summary of this function goes here
%   Detailed explanation goes here

% we will use if... elseif...

if any(cmy ~= 1 & cmy ~= 0) || all(cmy == 0)
    color = 'invalid input '
    return;
end

if cmy == [1 1 1]
    color = 'black ';
elseif cmy == [1 1 0]
    color = 'blue ';
elseif cmy == [1 0 1]
    color = 'green ';
elseif cmy == [1 0 0]
    color = 'cyan ';
elseif cmy == [0 1 1]
    color = 'red ';
elseif cmy == [0 1 0] 
    color = 'magenta ';
elseif cmy == [0 0 1]
    color = 'yellow '; % code must go through 24 logical operators before seeing 0 0 1 is yellow
%else 
 %   color = 'invalid input '    % not necessary because of lines 7-10
end % if on line 12

end % function