function [tVal,yEst]=rk2(ode, t0,y0, T, n,b2)
%
% Objective: use Runge-Kutta method 2 for solving a given ODE with initial
% conditions
%
% input variables:
%   ode = the ordinary differential equation
%   t0 = the initial t value given
%   y0 = the initial y value of for the given initial X value
%   T = the total time range, from 0 to T
%   n = number of steps 
%   b2 = the value of of the beta 2 variable, which sets other constants in
%   line.
%
% output variables:
%   yEst = An array of the approximation values of y0 to yn
%
% Functions called
%   none
%
% Initializing the h variable, which is the step, and the other important
% variables
h = (T-t0)/n;
b1 = 1 - b2;
alpha = 0.5/b2;
nu = alpha;
%
% Initializing the output array, and t value array.
%
yEst = zeros(1,(n + 1));
tVal = t0:h:T;
yEst(1) = y0;
%
% setting up the K functions
%
K1 =@(tk,yk) h*ode(tk,yk);
K2 = @(tk,yk) h*ode((tk + (nu*h)),(yk + (alpha * K1(tk,yk))));
% setting up a for to repeat N times, each time calculating another yk with
% the correct t value using the K1 and K2 functions that create different
% estimations based on the b2 input variable. 
%
for i = 1:1:(n)
    %
    % The yK and tK values are pulled from the the yEst and tVal arrays 
    %
    yK = yEst(i);
    tK = tVal(i);
    %
    % The yKplus evaluates the RK2 method with tK and yK
    %
    yKplus = yK + b1*K1(tK,yK) + b2*K2(tK,yK);
    %
    % the next value in the yEst array is populated with the current yKplus
    % value
    %
    yEst(i +1) = yKplus;
end

