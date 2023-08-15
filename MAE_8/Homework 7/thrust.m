function Th = thrust(t)
%Function thrust calculates the thrust at a given time during motion
%  the inputs are time of thrust (t) and the outputs are units of upward thrust (Th)

if (0 <= t) && (t <2)
    Th = 680;
elseif (2 <= t) && (t < 4)
    Th = 1356;
else 
    Th = 0;
end
end