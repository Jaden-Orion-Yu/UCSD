clear; clc;

%checking work
syms s;

X = 8*(3/s)*((s+2)/((s+3)*(s+4)));
x = ilaplace(X);

%graphing
t = linspace(0,10);

y = 8.*exp(-3.*t) - 12.*exp(-4.*t) + 4;

plot(t,y,'Linewidth',2,'LineStyle','--')
hold on
title("MAE 143A hw 2 P2 graph")
xlabel('time')
ylabel('y')
grid on
