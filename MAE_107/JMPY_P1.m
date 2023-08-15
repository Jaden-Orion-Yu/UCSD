clear;clc;
%% Problem 1
%
% Objective: use RK2, RK4, and euler's methods to approximate given ODE and IC below with
% increasing n values to see change in errror. RK2 is used twice with one
% value of β2 being 0.5, and the other being 0.25
%
% Functions called
%   rk2
%   rk4
%   eulerCustom
%   
%
%   ODE equation
yp =@(t,y) exp(-y)*sin(t + (2*pi*y));
%
%   IC given from problem
%
y0 = 1;
t0 = 0;
%
% setting the value given for end time
%
T = 2;
%
% Initializing the different number of steps to be taken
%
n = [4,8,16,32,64,128,256,512,1024,2048,4096];
%
% Initializing the true value used for errors
%
nTrue = 8192;
[tTrue,yTrue] = rk4(yp,t0,y0, T, nTrue);
yT = yTrue(end);
%
% Setting the different β 2 values for each rk2 call
%
b2_a = 0.5;
b2_b = 0.25;
%
% Initializing the arrays for the error values
%
errorEulerCustom = zeros(1,length(n));
errorRK2b2_a = errorEulerCustom;
errorRK2b2_b = errorEulerCustom;
errorRK4 = errorEulerCustom;
%
% Initializing the cell arrays containing the output arrays for each 
% iteration of each function for each given n value
%
EulerCustomT = {};
EulerCustomY = {};
RK2b2_aT = {};
RK2b2_aY = {};
RK2b2_bT = {};
RK2b2_bY = {};
RK4T = {};
RK4Y = {};
%
%   Running the for loop to iterate across the n array and calling the
%   listed functions
%
for i = 1:length(n)
    %
    % This for loop temporarily stores the tVal and yEst array outputs and
    % stores them in the _____Custom cell lists for each method's t and y
    % outputs.
    %
    [tempT1,tempY1] = eulerCustom(yp,t0,y0,T,n(i));
    %
    % the tempTx and tempYx arrays are capturing the array outputs of the
    % functions called and stored in the <method>CustomT and
    % <method>CustomY for later graphing.
    %
    EulerCustomT{i} = tempT1;
    EulerCustomY{i} = tempY1;
    %
    % The error value is stored using the last value of the tempYx array
    % and the true yT value.
    %
    errorEulerCustom(i) = abs(yT- tempY1(end));
    %
    % The process is repeated for all of the other methods: RK2b2_a,
    % RK2b2_b, and RK4 
    %
    [tempT2,tempY2] = rk2(yp,t0,y0,T,n(i),b2_a);
    RK2b2_aT{i} = tempT2;
    RK2b2_aY{i} = tempY2;
    errorRK2b2_a(i) = abs(yT- tempY2(end));
    [tempT3,tempY3] = rk2(yp,t0,y0,T,n(i),b2_b);
    RK2b2_bT{i} = tempT3;
    RK2b2_bY{i} = tempY3;
    errorRK2b2_b(i) = abs(yT - tempY3(end));
    [tempT4,tempY4] = rk4(yp,t0,y0,T,n(i));
    RK4T{i} = tempT4;
    RK4Y{i} = tempY4;
    errorRK4(i) = abs(yT- tempY4(end));
end
%
% Creating the first figure, the tile layout, and the linspace for the
% first four method plots to plot onto. 
%
figure(1)
hold on;
tiledlayout(2,4);
%
% Starts cycling through the top 4 tile spaces, creating a graph of each
% mehtods values for each value of n. the linspace allows for each t and y
% array from each method to be graphed on the same plot. 
%
nexttile
t = linspace(0,2,4096);
hold on;
title('Eulers method')
for i = 1:length(n)
    %
    % This for loop iterates across each of the <method>CustomT and
    % <method>CustomY cell arrays and plots them against each other on the
    % same plot for the same method
    %
    plot (EulerCustomT{i},EulerCustomY{i});
    xlabel('t')
    ylabel('y')
    hold on;
end
nexttile
hold on
title('RK2 method with β_2 = 0.5')
for i = 1:length(n)
    plot (RK2b2_aT{i},RK2b2_aY{i});
    xlabel('t')
    ylabel('y')
    hold on;
end
nexttile
hold on
title('RK2 method with β_2 = 0.25')
for i = 1:length(n)
    plot (RK2b2_bT{i},RK2b2_bY{i});
    xlabel('t')
    ylabel('y')
    hold on;
end
nexttile
hold on
title('RK4 method')
for i = 1:length(n)
    plot (RK4T{i},RK4Y{i});
    xlabel('t')
    ylabel('y')
    hold on;
end
legend('n = 4','n = 8','n = 16','n = 32','n = 64','n = 128','n = 256','n = 512','n = 1024','n = 2048','n = 4096')
%
% Creating the log error plot from the stored error values against the log
% of each n value
%
nexttile([1 4])
hold on
plot(log10(n), log10(errorEulerCustom),log10(n),log10(errorRK2b2_a),log10(n),log10(errorRK2b2_b),log10(n),log10(errorRK4))
legend('euler error','RK2 error, β_2 = 0.5','RK2 error β_2 = 0.25','RK4 error')
title('log10(n) vs log10(errors)')
xlabel('log10(n)')
ylabel('log10(errors)')
