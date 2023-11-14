clear;clc;

ak = @(k)  -2*((cos(2*pi*k) + 1)./(pi.*(4*k^2 - 1)));


K = 100;
func = @(t) (2/pi) + sum(arrayfun(@(k) ak(k) * cos(2*pi*k*t*4), 1:K))
t = -2:0.001:2;
F = arrayfun(func, t)

    

plot(t,F)

xlabel('time (s)')
ylabel('Y (unitless)')