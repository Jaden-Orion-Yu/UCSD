clear;
clc;
syms f(t) s 

X = ((.25)/s - (0.25)/s^2 + (17/4)/(s+2) - (7/4)/(s+2)^2  )* (.1/(s+2));

x = ilaplace(X);

f(t) = (17*t*exp(-2*t))/40 - (3*exp(-2*t))/160 - t/80 - (7*t^2*exp(-2*t))/80 + 3/160;

fplot(f,[0,5], 'LineWidth',3)
grid on;
box on;
xlabel(' Time $t$ [s] ','interpreter','latex','FontSize',30)
ylabel(' $y(t)$ ','interpreter','latex','FontSize',30)

