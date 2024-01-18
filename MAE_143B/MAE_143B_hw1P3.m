clear;
clc;

% %% Part A
% figure(1)
car = tf(0.04, [1 .1])
[y,t]=step(car)
% plot(t,y*100,'LineWidth',2)
% title('Car full throttle step response')
% xlabel('time (s)')
% ylabel('speed (m/s)')
% legend('speed response')
% grid on

%% Part B ** do multiple values of Kp

Kp = 10;
pcontrol = tf(Kp,1)
pcloop = feedback(pcontrol*car,1)
uloop = feedback(pcontrol, car)


% do multiple values of Kp and do step function.
Kp0a = 1;
Kp1a = 10;
Kp2a = 50;
Kp3a = 100;

pcontrol0a = tf(Kp0a,1);
pcontrol1a = tf(Kp1a,1);
pcontrol2a = tf(Kp2a,1);
pcontrol3a = tf(Kp3a,1);
[y0a,t0a]=step(pcontrol0a*car);
[y1a,t1a]=step(pcontrol1a*car);
[y2a,t2a]=step(pcontrol2a*car);
[y3a,t3a]=step(pcontrol3a*car);

t = isstable(pcloop)
%% Part C

Kp2=100; Ki=10; picontrol = tf([Kp2 Ki],[1 0])

picloop = feedback(picontrol*car,1)

cpiloop = feedback(picontrol, car)

Ki0a = 1;
Ki1a = 10;
Ki2a = 50;
Ki3a = 100;

picontrol0a = tf([Kp0a Ki0a] ,[1,0]);
picontrol1a = tf([Kp1a Ki1a],[1,0]);
picontrol2a = tf([Kp2a Ki2a],[1,0]);
picontrol3a = tf([Kp3a Ki3a],[1,0]);
[y0b,t0b]=step(picontrol0a*car);
[y1b,t1b]=step(picontrol1a*car);
[y2b,t2b]=step(picontrol2a*car);
[y3b,t3b]=step(picontrol3a*car);

t = isstable(picloop)