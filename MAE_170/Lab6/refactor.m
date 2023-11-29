% Clear workspace
close all;
clear all;
clc;
warning('off', 'all');

% Load data for AL fan/no fan conditions
load('alfan1.mat');
t1 = time(1:end-7);
tp1 = tempPlateC(1:end-7);
tamb1 = tempAmbC(1:end-7);

load('alfan2.mat');
t2 = time;
tp2 = tempPlateC;
tamb2 = tempAmbC;

load('alfan3.mat');
t3 = time;
tp3 = tempPlateC;
tamb3 = tempAmbC;

load('alnfan1.mat');
t4 = time(1:end-24);
tp4 = tempPlateC(1:end-24);
tamb4 = tempAmbC(1:end-24);

load('alnfan2.mat');
t5 = time;
tp5 = tempPlateC;
tamb5 = tempAmbC;

load('alnfan3.mat');
t6 = time(1:end-25);
tp6 = tempPlateC(1:end-25);
tamb6 = tempAmbC(1:end-25);

% Load data for AC fan/no fan conditions
load('acfan1.mat');
t7 = time(1:end-3);
tp7 = tempPlateC(1:end-3);
tamb7 = tempAmbC(1:end-3);

load('acfan2.mat');
t8 = time(1:end-2);
tp8 = tempPlateC(1:end-2);
tamb8 = tempAmbC(1:end-2);

load('acfan3.mat');
t9 = time;
tp9 = tempPlateC;
tamb9 = tempAmbC;

load('acnfan1.mat');
t10 = time;
tp10 = tempPlateC;
tamb10 = tempAmbC;

load('acnfan2.mat');
t11 = time(1:end-35);
tp11 = tempPlateC(1:end-35);
tamb11 = tempAmbC(1:end-35);

load('acnfan3.mat');
t12 = time(1:end-46);
tp12 = tempPlateC(1:end-46);
tamb12 = tempAmbC(1:end-46);

% Average temperatures
t_av1 = ((t1 - 12.4160) + (t2 - 12.4160) + (t3 - 12.4160)) / 3;
t_av2 = ((t4 - 12.4160) + (t5 - 12.4160) + (t6 - 12.4160)) / 3;
t_av3 = ((t7 - 12.4160) + (t8 - 12.4160) + (t9 - 12.4160)) / 3;
t_av4 = ((t10 - 12.4160) + (t11 - 12.4160) + (t12 - 12.4160)) / 3;

% Average temperatures of plate, ambient, and materials
tp_av1 = (tp1 + tp2 + tp3) / 3;
tp_av2 = (tp4 + tp5 + tp6) / 3;
tp_av3 = (tp7 + tp8 + tp9) / 3;
tp_av4 = (tp10 + tp11 + tp12) / 3;

tamb_av1 = (tamb1 + tamb2 + tamb3) / 3;
tamb_av2 = (tamb4 + tamb5 + tamb6) / 3;
tamb_av3 = (tamb7 + tamb8 + tamb9) / 3;
tamb_av4 = (tamb10 + tamb11 + tamb12) / 3;

% Material properties
rho1 = 2707;
c1 = 879;
k1 = 204;

rho2 = 1180;
c2 = 2000;
k2 = 0.2;

% Geometry parameters
d = 0.81 * 10^-3;
A = (38.1 * 10^-3)^2;
V = A * (0.81 * 10^-3);

%Al mass (kg)
m1=rho1*V;
%Ac mass (kg)
m2=rho2*V;

% Calculate tau (kAt/pcdV)
tau1 = (k1 * A * t_av1) / (rho1 * c1 * d * V);
tau2 = (k1 * A * t_av2) / (rho1 * c1 * d * V);
tau3 = (k2 * A * t_av3) / (rho2 * c2 * d * V);
tau4 = (k2 * A * t_av4) / (rho2 * c2 * d * V);

% Calculate theta
Ti1 = tp_av1(1);
Ti2 = tp_av2(1);
Ti3 = tp_av3(1);
Ti4 = tp_av4(1);

% Initialize theta arrays
theta1 = zeros(size(tp_av1));
theta2 = zeros(size(tp_av2));
theta3 = zeros(size(tp_av3));
theta4 = zeros(size(tp_av4));

% Calculate theta for each time point
for i = 1:length(tp_av1)
    theta1(i) = (tp_av1(i) - tamb_av1(i)) / (Ti1 - tamb_av1(i));
end
for p = 1:length(tp_av2)
    theta2(p) = (tp_av2(p) - tamb_av2(p)) / (Ti2 - tamb_av2(p));
end
for w = 1:length(tp_av3)
    theta3(w) = (tp_av3(w) - tamb_av3(w)) / (Ti3 - tamb_av3(w));
end
for b = 1:length(tp_av4)
    theta4(b) = (tp_av4(b) - tamb_av2(b)) / (Ti4 - tamb_av4(b));
end

% Calculate natural logarithm of theta
lntheta1 = log(theta1);
lntheta2 = log(theta2);
lntheta3 = log(theta3);
lntheta4 = log(theta4);

% tau/lntheta adju
tauadj1=tau1(61:end);
lnthetaadj1=lntheta1(61:end);
tauadj2=tau2(65:end);
lnthetaadj2=lntheta2(65:end);
tauadj3=tau3(30:end);
lnthetaadj3=lntheta3(30:end);
tauadj4=tau4(21:end);
lnthetaadj4=lntheta4(21:end);

% Linear approximation
p1 = polyfit(tauadj1, lnthetaadj1, 1);
y_fit1 = polyval(p1, tauadj1);

p2 = polyfit(tauadj2, lnthetaadj2, 1);
y_fit2 = polyval(p2, tauadj2);

p3 = polyfit(tauadj3, lnthetaadj3, 1);
y_fit3 = polyval(p3, tauadj3);

p4 = polyfit(tauadj4, lnthetaadj4, 1);
y_fit4 = polyval(p4, tauadj4);

% Store slope values 'a' for each linear approximation
slope_values = struct(...
    'Aluminum_Forced_Convection', p1(1), ...
    'Aluminum_Free_Convection', p2(1), ...
    'Acrylic_Forced_Convection', p3(1), ...
    'Acrylic_Free_Convection', p4(1)...
);

% Calculating total heat absorbed
tadj1=t_av1(1:57);
tadj2=t_av2(1:54);
tadj3=t_av3(1:15);
tadj4=t_av4(1:14);
% Q=mc[T(t)-Ti]
for z = 1:4
%%%%%%%%%%%%%%%% under progress for total heat absorption %%%%%%%%%%%%%%%
% Calculate heat transfer coefficient (h) and Biot number (Bi) for each scenario
L1 = V / A;
L2 = V / A;
L3 = V / A;
L4 = V / A;

h1 = p1(1) * k1 / L1;
Bi1 = -h1 * L1 / k1;

h2 = p2(1) * k1 / L2;
Bi2 = -h2 * L2 / k1;

h3 = p3(1) * k2 / L3;
Bi3 = -h3 * L3 / k2;

h4 = p4(1) * k2 / L4;
Bi4 = -h4 * L4 / k2;

% Display calculated heat transfer coefficients and Biot numbers
disp('Calculated Heat Transfer Coefficients and Biot Numbers:')
disp('Aluminum Forced Convection:')
disp(['h = ' num2str(-h1) ', Bi = ' num2str(Bi1)])
disp('Aluminum Free Convection:')
disp(['h = ' num2str(-h2) ', Bi = ' num2str(Bi2)])
disp('Acrylic Forced Convection:')
disp(['h = ' num2str(-h3) ', Bi = ' num2str(Bi3)])
disp('Acrylic Free Convection:')
disp(['h = ' num2str(-h4) ', Bi = ' num2str(Bi4)])

% Plot original data
figure(1)
hold on
plot(t1, tp1)
plot(t2, tp2)
plot(t3, tp3)
plot(t4, tp4)
plot(t5, tp5)
plot(t6, tp6)
plot(t7, tp7)
plot(t8, tp8)
plot(t9, tp9)
plot(t10, tp10)
plot(t11, tp11)
plot(t12, tp12)
hold off
xlabel('Time (s)')
ylabel('Temperature (C)')

% Plot ln(theta) vs. tau for AL fan/no fan conditions
figure(2)
hold on
plot(tau1, lntheta1)
plot(tau2, lntheta2)
xlabel('$\mathrm{Tau}$', 'Interpreter', 'latex')
ylabel('$\ln(\theta)$', 'Interpreter', 'latex')
legend('$\mathrm{AL\ Forced\ Convection}$', '$\mathrm{AL\ Free\ Convection}$', 'Interpreter', 'latex')

% Plot ln(theta) vs. tau for AC fan/no fan conditions
figure(3)
hold on
plot(tau3, lntheta3)
plot(tau4, lntheta4)
xlabel('$\mathrm{Tau}$', 'Interpreter', 'latex')
ylabel('$\ln(\theta)$', 'Interpreter', 'latex')
legend('$\mathrm{AC\ Forced\ Convection}$', '$\mathrm{AC\ Free\ Convection}$', 'Interpreter', 'latex')

% Plot tauadj/lnthetaadj with linear approximation for Aluminum fan/no fan conditions
figure(4)
hold on
plot(tauadj1, lnthetaadj1, 'o')
plot(tauadj2, lnthetaadj2, 'o')
plot(tauadj1, y_fit1, 'Color', 'black', 'LineWidth', 1)
plot(tauadj2, y_fit2, 'Color', 'black', 'LineWidth', 1)
xlabel('$\mathrm{Tau}$', 'Interpreter', 'latex')
ylabel('$\ln(\theta)$', 'Interpreter', 'latex')
legend('$\mathrm{Aluminum\ Forced\ Convection}$', '$\mathrm{Aluminum\ Free\ Convection}$', 'Linear Fit', 'Interpreter', 'latex')
    
% Plot tauadj/lnthetaadj with linear approximation and heat transfer coefficient for Acrylic fan/no fan conditions
figure(5)
hold on
plot(tauadj3, lnthetaadj3, 'o')
plot(tauadj4, lnthetaadj4, 'o')
plot(tauadj3, y_fit3, 'Color', 'black', 'LineWidth', 1)
plot(tauadj4, y_fit4, 'Color', 'black', 'LineWidth', 1)
xlabel('$\mathrm{Tau}$', 'Interpreter', 'latex')
ylabel('$\ln(\theta)$', 'Interpreter', 'latex')
legend('$\mathrm{Acrylic\ Forced\ Convection}$', '$\mathrm{Acrylic\ Free\ Convection}$', 'Linear Fit', 'Interpreter', 'latex')

figure(6) 
hold on
plot(t_av1,tp_av1)
plot(t_av2,tp_av2)
plot(t_av3,tp_av3)
plot(t_av4,tp_av4)
hold off
xlabel('Time (s)')
ylabel('Temperature (C)')

