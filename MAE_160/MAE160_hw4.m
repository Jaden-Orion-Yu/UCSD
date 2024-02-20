clear;
clc;

%% P2
V1 = 0.06*pi*(0.0025^2);
V2 = 0.02*pi*(0.0025^2);
sig_v2 = [321 389 411 423 438 454 475 489 497 501];
P = zeros(1,length(sig_v2));
for i = 1:length(P)
    P(i) = (length(P) + 1 - i)/(length(P) + 1);
end

sig_v2 = log(sig_v2);

P = log(log(1./P));

P_fit = polyfit(sig_v2,P,1);

P_Line = log([300:1:510]).*P_fit(1) + P_fit(2);

sig_0_ln = -P_fit(2)/P_fit(1);

sig_0  = exp(sig_0_ln);

figure(1)
plot(log([300:1:510]),P_Line, 'b');
hold on
plot(sig_v2,P,'r*')
hold on
plot(0,sig_0_ln,'m')
title('Problem 2 samples ')
xlabel('ln(stress)')
ylabel('lnln(1/P(V))')
yline(0)
grid on
legend('line of best fit: y = 7.11*x - 43.74','datapoints','Char. Str. = 467.6986 MPA')

%% P2
b = 0.01;
h = 0.005;
l = 0.05;
V = b*l*h;
F = [1040 1092 1120 1210 1320 1381 1419 1470 1490 1540];
P2 = zeros(1,length(F));
for i = 1:length(P2)
    P2(i) = (length(P2) + 1 - i)/(length(P2) + 1);
end

sig = (3*l/(2*b*h^2)).*F;
sig = sig./1E6;


P2 = log(log(1./P2));

PF2 = polyfit(log(sig),P2,1);

x = log(sig(1):1:(sig(length(sig))));
PL2 = x.*PF2(1) + PF2(2);

sig0ln2 = -PF2(2)/PF2(1);

sig02  = exp(sig0ln2);

figure(2)
plot(x,PL2, 'b');
hold on
plot(log(sig),P2,'r*')
hold on
plot(0,sig0ln2,'m')
title('Problem 3 samples ')
xlabel('ln(stress)')
ylabel('lnln(1/P(V))')
yline(0)
grid on
legend('line of best fit, m = 6.8953','datapoints','Char. Str. =  4179.4 MPa')

