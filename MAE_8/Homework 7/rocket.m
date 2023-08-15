function [T,Z,W] = rocket(Tf,dt)
% Function Rocket function uses duration of rocket flight and the time
% inbetween each step to return the time, altitude, and velocity of the
% rocket as vectors using the euler cromoer method
%  the inputs are total duration of the flight(Tf) and the step inbetween each time
%  measured (dt). the putputs are a vector of times (T), a of altitudes (Z), and a vector of
%  velocities(W)

m = 10;
W(1) = 0;
Z(1) = 0;
T = 0:dt:Tf;

for n = 2:length(T)
    W(n) = W(n-1) + (-gravity(Z(n-1)) + thrust(T(n-1))/m)*dt;
    Z(n) = Z(n-1) + W(n)*dt;
end

end