% load('lab8_part2_control.mat')
% 
% H_offset = mean(Hchb) - mean(Hamb);
% T_offset = mean(Tchb) - mean(Tamb);
clear
clc
%% Q1
theta = [40 50 60 70 80 90 100 110 120 130 140];
acc = 9.81.*cosd(theta);
voltage = [2.045 1.9725 1.877 1.7738 1.6611 1.5454 1.4272 1.3113 1.2001 1.0988 1.00998];

y_erP = ones(1,11).*((1.815-1.485)/2);
y_erN = ones(1,11).*-((1.815-1.485)/2);
x_erP = ones(1,11).*(9.81.*cosd(90.5));
x_erN = ones(1,11).*(-9.81.*cosd(90.5));

p = polyfit(acc,voltage, 1);
x = linspace(acc(1), acc(11));
figure(2)
errorbar(acc,voltage,y_erP,y_erN,x_erP,x_erN,'.r', 'MarkerSize',10)
hold on;
plot(x, p(1)*x + p(2),'b')
xlabel('Acceleration (m/s^2)')
ylabel('Voltage (V)')
legend('Experimental','interpolation')

Syx = sqrt((1/9)*sum((voltage - (acc*p(1) + p(2))).^2));
Sa1 = Syx*sqrt(1/(sum((acc - mean(acc)).^2)));
Sa0 = Syx*sqrt((sum(acc.^2)/sum((acc - mean(acc)).^2)));


%% Q8
dist = [10 20 30 40 50 60 70 80 90 100];
delay = [575 1121 1709 2313 2856 3433 3997 4604 5047 5072];

figure(3)
plot(dist,delay,'.-r')
title('Distance vs Time Delay','interpreter','latex','FontSize',25)
xlabel('Distance (cm)','interpreter','latex','FontSize',12)
ylabel('Delay (us)','interpreter','latex','FontSize',12)


