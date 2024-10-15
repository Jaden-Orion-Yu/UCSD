clear;
clc;

%% data setup
in0 = readmatrix('PID_inertia_0.txt');
in1 = readmatrix('PID_inertia_1.txt');
in2 = readmatrix('PID_inertia_2.txt');
in3 = readmatrix('PID_inertia_3.txt');

%% PID inertia 0
% col3 = time
% col4 = control effort
% col5 = encoder 1 pos
figure(1)
plot(in0(:,3), in0(:,5),'r')
hold on
plot(in0(:,3), in0(:,4), 'k')
hold on
scatter(0.478,max(in0(:,5)),'r*')
legend('Encoder 1 Position','Control Position', 'Overshoot = 1.8%')
xlabel('time (s)')
ylabel('position (counts)')
title('PID Control Step Response')
grid on

%% inertia 1-3
figure(2)
plot(in1(:,3), in1(:,5),'r')
hold on
plot(in2(:,3), in2(:,5),'m')
hold on
plot(in3(:,3), in3(:,5),'b')
hold on
plot(in1(:,3), in1(:,4), 'k')
hold on
overshoots = [max(in1(:,5)),max(in2(:,5)),max(in3(:,5))];
overshoots = ((overshoots-1000)./1000).*100;
scatter(0.567,max(in1(:,5)),'r*')
hold on
scatter(0.496,max(in2(:,5)),'m*')
hold on
scatter(0.478,max(in3(:,5)),'b*')
hold on
legend('Inertial frame 1','inertial frame 2','Inertial frame 3','Control Position', 'inertia 1 Overshoot = 2.2%', 'inertia 2 Overshoot = 5%','inertia 3 Overshoot = 4.2%')
xlabel('time (s)')
ylabel('position (counts)')
title('PID Control Step Response of multiple inertial frames')
grid on
