function [tVal,yVal]=euler(fp,t0,x0,T,n)
%
% Objective: Euler's method for solution of ODE \dot x=f(t,x) over time
% interval [t0,tend] with initial data x(t0)=x0.
%
% input variables:
%   fp
%   t0 - initial time
%   x0 - initial state
%   tend - terminal time
%   n - number of steps in Euler iteration.
%
% output variables:
%   tv - vector of times at which the solution is evaluated (including t0
%   and tend).
%   xv - vector of the state value, x(t), at the times in tv.
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
for i=2:np1
    %
    % Coupute f(t,x)
    %
    f=odefunc(t,x);
    %
    % Update time and state.
    %
    t=t+h;
    x=x+h*f;
    %
    % Load new time and state into the output vectors.
    %
    tv(i)=t;
    xv(i)=x;
end;
