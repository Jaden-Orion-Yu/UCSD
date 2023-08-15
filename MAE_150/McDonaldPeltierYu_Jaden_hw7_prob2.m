%% Problem 2
clear;clc;

%setting up initial vars

l1 = 30;
l2 = 50;

t1_0 = deg2rad(150);
t2_0 = deg2rad(240);

t1_f = deg2rad(120);
t2_f = deg2rad(330);

px1 = l1*cos(t1_0) + l2*cos(t1_0+(t2_0));
py1 = l1*sin(t1_0) + l2*sin(t1_0+(t2_0));
px2 = l1*cos(t1_f) + l2*cos(t1_f+(t2_f));
py2 = l1*sin(t1_f) + l2*sin(t1_f+(t2_f ));

%[dx;dy] = [jacobian]*[dt1;dt2]
jacobian = @(t1,t2) [-l1*sin(t1) - l2*sin(t1+(t2)),-l2*sin(t1+(t2));...
                    l1*cos(t1) + l2*cos(t1 + (t2)), l2*cos(t1+(t2))];

% m = (py2-py1)/(px2-px1);
% 
% y = @(x) m*x + p1y;
%
% px_ideal = linspace(p1x,p2x,40);
% py_ideal  = linspace(p1y,p2y,40);

% t1_ideal = linspace(t1_0,t1_f,40);
% t2_ideal = linspace(t2_0,t2_f,40);

dx = (px2-px1)/40;
dy = (py2-py1)/40;

X_ideal = px1:dx:px2;
Y_ideal = py1:dy:py2;


t2 = zeros(1,length(Y_ideal));
t1 = t2;

X_sim = t2;
Y_sim = t2;

t1(1) = t1_0;
t2(1) = t2_0;

X_sim(1) = px1;
Y_sim(1) = py1;


for i = 1:1:40
    j = jacobian(t1(i),t2(i));
    dT = j\[dx;dy];
    t1(i+1) = t1(i) + dT(1);
    t2(i+1) = t2(i) + dT(2);
end


for i = 1:1:40
    j = jacobian(t1(i), t2(i));
    dX = j*[t1(i +1) - t1(i);t2(i +1) - t2(i)];
    X_sim(i+1) = dX(1) + X_sim(i);
    Y_sim(i+1) = dX(2) + Y_sim(i);
end
dx_er = X_sim(end) - X_ideal(end);
dy_er = Y_sim(end) - Y_ideal(end);
error = sqrt(dx_er^2 + dy_er^2);

% A
figure(1)
plot(X_ideal,Y_ideal,'r*')
hold on;
plot(X_sim,Y_sim,'bo');
xlim([-20,50]);
ylim([0,100]);
grid on;
title('simulated vs actual movement of the robot arm')
xlabel('X(cm)')
ylabel('Y(cm)')
legend('Ideal','Simulated')

% B
figure(2)
dtime = 5/40;
time = 0:dtime:5;
plot(time,t1,'r');
hold on;
plot(time,t2,'b')
xlim([0,5]);
grid on;
title('theta 1 and theta 2 vs time')
xlabel('time (s)')
ylabel('angle (rad)')
legend('theta 1','theta 2')

% C
velX = X_ideal./dtime;
velY = Y_ideal./dtime;
velT1 = zeros(1,length(velX));
velT2 = velT1;
for i = 1:1:40
    j = jacobian(t1(i),t2(i));
    dvel = j\[velX(i);velY(i)];
    velT1(i+1) = velT1(i) + dvel(1);
    velT2(i+1) = velT2(i) + dvel(2);
end
figure(3)
plot(time,velT1,'r');
hold on;
plot(time,velT2,'b')
xlim([0,5]);
grid on;
title(' angular velocity of theta 1 and theta 2 vs time')
xlabel('time (s)')
ylabel('angular velocity (rad/s)')
legend('theta 1','theta 2')

% velcoity: [dx/dt] = [j] dtheta/dt
