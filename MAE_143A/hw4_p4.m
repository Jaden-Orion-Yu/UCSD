clear;
clc;

syms s f(t)

Y = ((s+1)/(s^2+s+.5))*(1/s);
f(t) = ilaplace(Y);


fplot(f,[0,10], 'LineWidth',3)
grid on;
box on;
xlabel(' Time $t$ [s] ','interpreter','latex','FontSize',30)
ylabel('Response','interpreter','latex','FontSize',30)
title(' System Response to Unit Step Input ','interpreter','latex','FontSize',30)


