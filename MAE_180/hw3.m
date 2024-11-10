clear;clc;

%% problem 1
w = pi/4;
i = pi/3;
omega = (-pi)/6;
R_ECI = [29700;0;29700];

Gomega = [cos(omega), sin(omega), 0;-sin(omega), cos(omega), 0; 0,0,1]; 
Gi = [1,0,0;0,cos(i), sin(i);0,-sin(i), cos(i)];
Gw = [cos(w), sin(w), 0;-sin(w), cos(w), 0; 0,0,1];

step1 = Gomega*R_ECI
step2 = Gi*step1
step3 = Gw*step2