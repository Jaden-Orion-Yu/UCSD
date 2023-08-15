function color = rgb_color(rgb)
%RGB_COLOR takes input of linear array of 1's and zeros and gives an output
%of color produced
%   for input [x,y,z] which each equal 1 or 0, there is a color output. x
%   indicates the anount of red, y indicates amount of green, and z
%   indicates amount of blue. Some example colors
%   [1 1 1] = white
%   [1 0 0] = red
%   [0 1 0] = green
%   [0 0 1] = blue
if any(rgb ~= 0 & rgb ~=  1 ) | rgb == [0 0 0] 
    color = 'Invalid input';
    return;
end

if rgb(1) == 1
    if rgb(2) == 1
        if rgb(3) ==1 %[1 1 1]
            color = 'white';
        else %[1 1 0]
            color = 'yellow';
        end
    else
        if rgb(3) == 1 %[1 0 1]
            color = 'magenta';
        else %[1 0 0]
            color = 'red';
        end

    end
else
    if rgb(2) == 1 
        if rgb(3) ==1%[0 1 1]
            color = 'cyan';
        else%[0 1 0]
            color = 'green';
        end
        
    else
        color = 'blue';%[0 0 1]
    end

end

end

