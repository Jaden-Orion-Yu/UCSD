function [tVal,yEst]=eulerCustom(ode,t0,y0,T,n)
%
% Objective: Euler's method for solution of ODE \dot x=f(t,x) over time
% interval [t0,tend] with initial data x(t0)=x0.
%
% input variables:
%   ode - Given ODE function which is a function of both t and y
%   t0 - initial time
%   y0 - initial state
%   T - terminal time
%   n - number of steps in Euler iteration.
%
% output variables:
%   tVal - vector of times at which the solution is evaluated (including t0
%   and T).
%   yEst - vector of the state value, x(t), at the times in tv.
%
% functions called:
%    none
%
%
% Compute the stpe-size, h.
%
h=(T-t0)/n;
%
% Create vectors that will be filled with the solution data.
%
tVal = t0:h:T;
yEst = zeros(1,(n+1));
%
%
% Put initial time and state into the output time and state vectors.
%
tVal(1)=t0;
yEst(1)=y0;
%
% Begin Euler iteration.
%
for i=1:(n)
    %
    % set current yK and tK values
    %
    yK = yEst(i);
    tK = tVal(i);
    %
    % Evaluate the ODE with yK and tK to get yKplus
    %
    yKplus = yK + h*ode(tK,yK);
    %
    % Load new time and state into the output vectors.
    %
    yEst(i+1) = yKplus;
end
