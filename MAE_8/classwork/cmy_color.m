function [color] = cmy_color(cmy)
%CMY_CLOLOR Summary of this function goes here
%   Detailed explanation goes here

if any(cmy ~= 0 & cmy ~=  1 ) || cmy == [0 0 0] 
    color = "Invlid input";
    return;
end

switch cmy
    case [1 1 1]
        color = 'black';
    case [1 1 0] 
        color = blue;
    case [1 0 1]
         
    case [0 1 1]
         
    case[1 0 0]

    case [0 1 0]

    case [0 0 1]

    case [0 0 0]

    otherwise
        color = 'invalid input';
%to check any color, an input could be if any(cmy~= 0 & cmy ~=1) for
%logical indexing of the cmy array to check if it's within range.
         

end

