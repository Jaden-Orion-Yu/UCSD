function [tVal,yEst]=rk4(ode, t0,y0, T, n)
%
% Objective: use Runge-Kutta order 4 methodfor solving a given ODE with initial
% conditions
%
% input variables:
%   ode = the ordinary differential equation
%   t0 = the initial t value given
%   y0 = the initial y value of for the given initial X value
%   T = the total time range, from 0 to T
%   n = number of steps 
%
% output variables:
%   yEst = An array of the approximation values of y0 to yn
%
% Functions called
%   none
%
% Initializing the h variable, which is the step
%
h = (T-t0)/n;
%
% Initializing the output array and t value array.
%
yEst = zeros(1,(n + 1));
tVal = t0:h:T;
yEst(1) = y0;
%
% setting up the K functions
%
K1 =@(tk,yk) h*ode(tk,yk);
K2 =@(tk,yk) h*ode((tk + (h/2)),(yk + (0.5 * K1(tk,yk))));
K3 =@(tk,yk) h*ode((tk + (h/2)),(yk + (0.5 * K2(tk,yk))));
K4 =@(tk,yk) h*ode((tk + h),(yk + (K3(tk,yk))));

% setting up a for to repeat N times, each time calculating another yk with
% the correct t value using the K1 and K2 functions that create different
% estimations based on the b2 variable. 
%
for i = 1:1:(n)
    %
    % The yK and tK values are pulled from the the yEst and tVal arrays 
    %
    yK = yEst(i);
    tK = tVal(i);
    %
    % The yKplus evaluates the RK4 method with tK and yK and the
    % K1,K2,K3, and K4 functions.
    %
    yKplus = yK + (1/6)*(K1(tK,yK) + 2*(K2(tK,yK) + K3(tK,yK)) + K4(tK,yK));
    %
    % the next value in the yEst array is populated with the current yKplus
    % value
    %
    yEst(i +1) = yKplus;
end

