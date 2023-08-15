function g = gravity(z)
%Function gravity returns the force of gravity at a given input altitude
% input of altitude (z)
% output of gravity based on the input altiude (g)

if z <= 10000
    g = 9.81*(1 - (z/10000)^3);
else
    g = 0;
end
end