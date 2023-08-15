function f = piecewise2d(x,y)
%piecewise2 takes 2 inputs and creates creates an output value from the
%inputs
%   f = 4x + 4y for x ≥ 0 y > 0
%   f = −4x + 4y for x < 0 y ≥ 0
%   f = −4x − 4y for x ≤ 0 y < 0
%   f = 4x − 4y for x > 0 y ≤ 0

if x >= 0 && y >0
    f = (4 * x) + (4 + y);
elseif x < 0 && y >= 0
    f = ((-4) * x) + (4 + y);
elseif x <= 0 && y < 0
    f = ((-4) * x) - (4 + y);
elseif x > 0 && y <= 0
    f = (4 * x) - (4 + y);
else
    f = 0;
end

end

