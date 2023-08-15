function color = cmy_color_nested(cmy)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% if any of cmy is not equal to 0 or 1, early exit
if any(cmy ~= 1 & cmy ~= 0) || all(cmy == 0)
    color = 'invalid input ';
    return;
end



if cmy(1) %== 1
    if cmy(2) %== 1
        if cmy(3) %== 1 % [1 1 1]
            color = 'black ';
        else % [1 1 0]
            color = 'blue ';
        end % if on line 15
    else
        if cmy(3) %== 1 % [1 0 1]
            color = 'green ';
        else % [1 0 0]
            color = 'cyan ';
        end % if on line 21
    end % if on line 14
else
    if cmy(2) %== 1
        if cmy(3) %== 1 % [0 1 1]
            color = 'red ';
        else % [0 1 0]
            color = 'magenta ';
        end % if on line 29
    else 
        %if cmy(3) %== 1 % [0 0 1] % this piece is not actually necessary
            color = 'yellow '; % code goes through 3 logical operators to see 0 0 1 is yellow
        %end % if on line 35
    end % if on line 28
end % if on line 13

end % function