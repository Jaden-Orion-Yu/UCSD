function [T,X,U] = train(Tf,dt)
%Function Train uses the inputs of total time and steps of time to give three
%vectors with time , distance, and velocity values.
%   inputs are total travel time (Tf), step inbetween units of time (dt)
%   outputs are three vectors: time, distance from origin, velocity at
%   givent time and distance from origin.

nt = ceil(Tf/dt);
T = zeros(1, nt);
U = zeros(1, nt);
X = zeros(1, nt);

T(1) = 0;
U(1) = 0;
X(1) = 0;

for n = 1:nt
    T(n+1) = T(n) + dt;
    U(n+1) = U(n) +4*sech(T(n)/25)^2*tanh(T(n)/25)*dt;
    X(n+1) = X(n) + U(n)*dt;
end
end