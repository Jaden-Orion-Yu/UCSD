function [tVal,yEst]=rk4edited(ode, t0,y0,z0, T, n)
%
% Objective: use Runge-Kutta order 4 method for solving a given ODE with initial
% conditions calling 
%
% input variables:
%   ode = the ordinary differential equation
%   t0 = the initial t value given
%   y0 = the initial y value of for the given initial X value
%   z0 = the initial z value for starting the fixed point iteration. 
%   T = the total time range, from 0 to T
%   n = number of steps 
%
% output variables:
%   yEst = An array of the approximation values of y0 to yn
%
% Functions called
%   fixedPntEdited
%
% Initializing the h variable, which is the step
%
h = (T-t0)/n;
%
% Initializing the output array and t value array.
%
yEst = zeros(1,(n + 1));
tVal = t0:h:T;
zVal = zeros(1,(n+1));
yEst(1) = y0;
%
% setting up a for to repeat N times, each time calculating another yk with
% the correct t value using the K1 and K2 functions that create different
% estimations based on the b2 variable. 
%
for i = 1:1:(n)
    %
    % The yK, tK, and zK values are pulled from the the yEst and tVal arrays 
    %
    yK = yEst(i);
    tK = tVal(i);
    K1 = h*fixedPntEdited(ode,tK,yK,z0,n);
    K2 = h*fixedPntEdited(ode,tK, (yK + (.5*K1)) ,z0 ,n);
    K3 = h*fixedPntEdited(ode,tK, (yK + (.5*K2)) ,z0 ,n);
    K4 = h*fixedPntEdited(ode,tK,(yK + K3),z0,n);
    %
    % The yKplus evaluates the RK4 method with tK and yK and the
    % K1,K2,K3, and K4 functions.
    %
    yKplus = yK + (1/6)*(K1 + 2*(K2 + K3) + K4);
    %
    % the next value in the yEst array is populated with the current yKplus
    % value
    %
    yEst(i +1) = yKplus;
end

