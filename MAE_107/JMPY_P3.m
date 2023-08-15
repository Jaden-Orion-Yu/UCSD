clear;clc;
%% Problem 3
%
% Objective: use edited RK4 that uses the fixedPnt function to solve a
% gvien ODE. The edited RK4 uses fixedPnt starting with the given t0 and y0 to come up with new y values. 
% the starting z0 value is chosen at random, I chose 1 to make it simple. 
%
% Functions called
%   rk4Edited
%
%
% Setting the n value array
%
n = [8, 16, 32, 64, 128, 256, 512, 1024];
%
% Setting the g function and the intial conditions
%
g_z = @(t,y,z) exp(-(1+sin(z))) - (sin(t+y)^2)*(1+(z^2))^(1/3);
T = 6;
t0 = 0;
y0 = 4;
z0 = 0;
%
% setting up the cells to hold the t and y value arrays 
%
Tcell = {};
Ycell = {};
%
% the for loop wraps over the n array and 
%

for i = 1:length(n)
    %
    % t and y arrays are stored in temporary variables and then inserted in
    % the T and Y cells
    %
    [tempT,tempY] = rk4edited(g_z,t0,y0,z0,T,n(i));
    Tcell{i} = tempT;
    Ycell{i} = tempY;
end
%
% this figure sets up the figure showing the different values of n with
% this runge-kutta combined method
%
figure(1);
hold on;
title('RK4Edited method')
for i = 1:length(n)
    plot (Tcell{i},Ycell{i});
    xlabel('t')
    ylabel('y')
    hold on;
end
legend('n = 8','n = 16','n = 32','n = 64','n = 128','n = 256','n = 512','n = 1024')

