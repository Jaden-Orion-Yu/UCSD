clear;
clc;

%load('5rads_3sec.mat');
load('matdata_02-07-2024_16-14.mat')
syms s csym bsym jsym

%% P1
%part A
J = 0.000421522; % moment of inertia
b = 0.0034;%friction term
c = 0.02818; % motor constant conersion from voltage to torque
servo = tf(c/J, [1 b/J 0])

A = [0 1; 0 -8.066];
B = [0;1];
C = [66.85 0];
D = 0;
servoss = ss(A, B, C, D);

p_ss = pole(servoss);
p_tf = roots([1 b/J 0]);

y_ss = step(servoss,time);
y_tf = step(servo,time);

figure(1)
subplot(3,1,1)
plot(time,y_ss*2)
title('state space step response')
xlabel('time (s)')
ylabel('amplitude')
hold on
subplot(3,1,2)
plot(time,y_tf*2)
title('tf step response')
xlabel('time (s)')
ylabel('amplitude')
hold on
subplot(3,1,3)
plot(time,position)
title('given data step response')
xlabel('time (s)')
ylabel('position')

[num, den] = ss2tf(A,B,C,D)

% part B
figure(2)
plot(time,position)
title('given data step response')
xlabel('time (s)')
ylabel('position')


% part C
residue = ilaplace((csym/jsym)/(s^2 + s*(bsym/jsym)));

%% P2

mytime = [0:0.001:5]';
ampli = 2;
rfreq = 5;
myinput = ampli*sin(rfreq*mytime);
myangle = lsim(servoss,myinput,mytime,[0.5;0.5]);
fullstt = ss(A,B,eye(2),zeros(2,1));
state = lsim(fullstt, myinput, mytime, [0.5;0.5]);

figure(3)
subplot(3,1,1)
plot(mytime,myangle)
title('angle simulation')
xlabel('time (s)')
ylabel('angle')


subplot(3,1,2)
plot(mytime,state(:,1))
title('Component 1')
xlabel('time (s)')
ylabel('anlge')

subplot(3,1,3)
hold on
plot(mytime,state(:,2),'-r')
title('Component 2')
xlabel('time (s)')
ylabel('unkown')

%% P3

L = place(A',C',[-20,-30])';
obsv = ss(A-L*C,[L B],eye(2),zeros(2,2));
xhat = lsim(obsv, [myangle myinput], mytime);
figure(4)
plot(mytime, state(:,2), mytime, xhat(:,2),'x')
legend('xdot','xdotobsv')
xlabel('time (s)')
ylabel('omega (rad/s)')
title('original observer graph')

L2 = place(A',C',[-40,-33])';
obsv2 = ss(A-L2*C,[L2 B],eye(2),zeros(2,2));
xhat2 = lsim(obsv2, [myangle myinput], mytime);


figure(5)
plot(mytime, state(:,2), mytime, xhat2(:,2),'x')
legend('xdot','xdotobsv')
xlabel('time (s)')
ylabel('omega (rad/s)')
title('more negative poles observer graph')

L3 = place(A',C',[-5,-10])';
obsv3 = ss(A-L3*C,[L3 B],eye(2),zeros(2,2));
xhat3 = lsim(obsv3, [myangle myinput], mytime);


figure(6)
plot(mytime, state(:,2), mytime, xhat3(:,2),'x')
legend('xdot','xdotobsv')
xlabel('time (s)')
ylabel('omega (rad/s)')
title('less negative poles observer graph')

%% P4
% a
myqinput = floor(myinput*16/2/pi+0.5)*2*pi/16;
mymangle = floor(myangle*32/2/pi+0.5)*2*pi/32;

figure(7)
subplot(2,1,1)
plot(mytime, myinput, mytime, myqinput,'x')
legend('continuous','quantized')
xlabel('time (s)')
ylabel('input (V)')
title('continuous vs quantized input')
subplot(2,1,2)
plot(mytime, myangle, mytime, mymangle,'x')
legend('continuous','quantized')
xlabel('time (s)')
ylabel('angle (rad)')
title('continuous vs quantized angle')

%b
myqangle = lsim(servo, myqinput,mytime,[.5 .5]);
myqangleq = floor(myqangle*32/2/pi+0.5)*2*pi/32;
statepwm = lsim(fullstt,myqinput,mytime,[0.5;0.5]);

L4 = place(A',C', [-20;-30])';
obsv4 = ss(A-L4*c,[L4 B], eye(2), zeros(2,2));
xhatq = lsim(obsv4,[myqangleq myinput], mytime);
figure(8)
plot(mytime,statepwm(:,2),mytime,xhatq(:,2),'o')
legend('xdot','xdotobsv')
xlabel('time (s)')
ylabel('omega (rad/s)')
title('given poles')

%C
L5 = place(A',C', [-40;-33])';
obsv5 = ss(A-L5*c,[L5 B], eye(2), zeros(2,2));
xhatq2 = lsim(obsv5,[myqangleq myinput], mytime);
figure(9)
plot(mytime,statepwm(:,2),mytime,xhatq2(:,2),'o')
legend('xdot','xdotobsv')
xlabel('time (s)')
ylabel('omega (rad/s)')
title('larger negative poles')

L6 = place(A',C', [-5;-10])';
obsv6 = ss(A-L6*c,[L6 B], eye(2), zeros(2,2));
xhatq3 = lsim(obsv6,[myqangleq myinput], mytime);
figure(10)
plot(mytime,statepwm(:,2),mytime,xhatq3(:,2),'o')
legend('xdot','xdotobsv')
xlabel('time (s)')
ylabel('omega (rad/s)')
title('smaller negative poles')

