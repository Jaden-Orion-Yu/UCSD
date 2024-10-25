clear;
clc;

%% Part A
figure(1)
car = tf(0.04, [1 .1]);
[y,t]=step(car);
plot(t,y*100,'LineWidth',2)
title('Car full throttle step response')
xlabel('time (s)')
ylabel('speed (m/s)')
legend('speed response')
grid on

%% Part B ** do multiple values of Kp

Kp = 10;
pcontrol = tf(Kp,1)
pcloop = feedback(pcontrol*car,1)
uloop = feedback(pcontrol, car)


% do multiple values of Kp and do step function.
Kp0a = 1;
Kp2a = 50;
Kp3a = 100;

pcontrol0a = tf(Kp0a,1);
pcontrol2a = tf(Kp2a,1);
pcontrol3a = tf(Kp3a,1);

pcloop0 = feedback(pcontrol0a*car,1)
pcloop2 = feedback(pcontrol2a*car,1)
pcloop3 = feedback(pcontrol3a*car,1)


[y0a,t0a]=step(pcloop0);
[y1a,t1a] = step(pcloop);
[y2a,t2a]=step(pcloop2);
[y3a,t3a]=step(pcloop3);

y0a(length(y0a)+1) = y0a(length(y0a));
t0a(length(t0a)+1) = 50;
y1a(length(y1a)+1) = y1a(length(y1a));
t1a(length(t1a)+1) = 50;
y2a(length(y2a)+1) = y2a(length(y2a));
t2a(length(t2a)+1) = 50;
y3a(length(y3a)+1) = y3a(length(y3a));
t3a(length(t3a)+1) = 50;

t1 = isstable(pcloop)

figure(2)
plot(t0a,y0a*40,'LineWidth',2)
hold on
plot(t1a,y1a*40,'LineWidth',2)
hold on
plot(t2a,y2a*40,'LineWidth',2)
hold on
plot(t3a,y3a*40,'LineWidth',2)
hold on
title('P-Control step response with varying Kp')
xlabel('time (s)')
ylabel('speed (m/s)')
legend('Kp = 1', 'Kp = 10','Kp = 50','Kp = 100')
grid on

%% Part C

Kp2=100; Ki=10;

picontrol = tf([Kp2 Ki],[1 0]);
picloop = feedback(picontrol*car,1)
cpiloop = feedback(picontrol, car)

Ki0a = 1;
Ki2a = 50;
Ki3a = 100;

picontrol0a = tf([Kp0a Ki0a] ,[1,0]);
picontrol0b = tf([Kp0a Ki] ,[1,0]);
picontrol0c = tf([Kp0a Ki2a] ,[1,0]);
picontrol0d = tf([Kp0a Ki3a] ,[1,0]);

% picontrol1a = tf([Kp Ki0a],[1,0]);
% picontrol1b = tf([Kp Ki],[1,0]);
% picontrol1c = tf([Kp Ki2a],[1,0]);
% picontrol1d = tf([Kp Ki3a],[1,0]);


picontrol2a = tf([Kp2a Ki0a],[1,0]);
picontrol2b = tf([Kp2a Ki],[1,0]);
picontrol2c = tf([Kp2a Ki2a],[1,0]);
picontrol2d = tf([Kp2a Ki3a],[1,0]);

% picontrol3a = tf([Kp3a Ki3a],[1,0]);
% picontrol3a = tf([Kp3a Ki3a],[1,0]);
% picontrol3a = tf([Kp3a Ki3a],[1,0]);
% picontrol3a = tf([Kp3a Ki3a],[1,0]);



picloop0a = feedback(picontrol0a*car,1);
picloop0b = feedback(picontrol0b*car,1);
picloop0c = feedback(picontrol0c*car,1);
picloop0d = feedback(picontrol0d*car,1);

picloop2a = feedback(picontrol2a*car,1);
picloop2b = feedback(picontrol2b*car,1);
picloop2c = feedback(picontrol2c*car,1);
picloop2d = feedback(picontrol2d*car,1);


[y0a,t0a]=step(picloop0a);
[y0b,t0b]=step(picloop0b);
[y0c,t0c]=step(picloop0c);
[y0d,t0d]=step(picloop0d);

% [y1b,t1b]=step(picloop);

[y2a,t2a]=step(picloop2a);
[y2b,t2b]=step(picloop2b);
[y2c,t2c]=step(picloop2c);
[y2d,t2d]=step(picloop2d);



y0a(length(y0a)+1) = y0a(length(y0a));
t0a(length(t0a)+1) = 50;
y0b(length(y0b)+1) = y0b(length(y0b));
t0b(length(t0b)+1) = 50;
y0c(length(y0c)+1) = y0c(length(y0c));
t0c(length(t0c)+1) = 50;
y0d(length(y0d)+1) = y0d(length(y0d));
t0d(length(t0d)+1) = 50;

y2a(length(y2a)+1) = y2a(length(y2a));
t2a(length(t2a)+1) = 50;
y2b(length(y2b)+1) = y2b(length(y2b));
t2b(length(t2b)+1) = 50;
y2c(length(y2c)+1) = y2c(length(y2c));
t2c(length(t2c)+1) = 50;
y2d(length(y2d)+1) = y2d(length(y2d));
t2d(length(t2d)+1) = 50;


% [y3b,t3b]=step(picloop3);



t2 = isstable(picloop)
figure(3)

plot(t0a,y0a*40,'LineWidth',2)
hold on
plot(t0b,y0b*40,'LineWidth',2)
hold on
plot(t0c,y0c*40,'LineWidth',2)
hold on
plot(t0d,y0d*40,'LineWidth',2)
hold on
title('PI-Control step response with Kp = 1 and Varying Ki')
xlabel('time (s)')
ylabel('speed (m/s)')
legend('Ki = 1', 'Ki = 10','Ki = 50','Ki = 100')
grid on

figure(4)

plot(t2a,y2a*40,'LineWidth',2)
hold on
plot(t2b,y2b*40,'LineWidth',2)
hold on
plot(t2c,y2c*40,'LineWidth',2)
hold on
plot(t2d,y2d*40,'LineWidth',2)
hold on
title('PI-Control step response with Kp = 50 and Varying Ki')
xlabel('time (s)')
ylabel('speed (m/s)')
legend('Ki = 1', 'Ki = 10','Ki = 50','Ki = 100')
grid on


% figure(4)
% picontrolT = tf([20 5],[1 0]);
% pcontrolT = tf(20,1)
% picloopT = feedback(picontrolT*car,1)
% pcloopT = feedback(pcontrolT*car,1)
% [yTa,tTa] = step(picloopT)
% [yTb,tTb] = step(pcloopT)
% plot(tTa,yTa*40)
% hold on
% plot(tTb,yTb*40)
% grid on