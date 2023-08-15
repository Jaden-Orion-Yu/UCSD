clear;clc;
%% Part A

% Setting up vars
e = 10^-14;

l1 = sqrt(234);
l2 = 2;
l3 = 8;
l4 = 12;

thet2_0 = 0:0.01:(2*pi);
thet3_0 =zeros(1,length(thet2_0));
thet4_0 = thet3_0;

% setting up eqns
f1 = @(theta2,theta3,theta4) l2*cos(theta2) + l3*cos(theta3) - l4*cos(theta4) - 15;
f2 = @(theta2,theta3,theta4) l2*sin(theta2) + l3*sin(theta3) - l4*sin(theta4) + 3;

r1 = @(theta2,theta3,theta4)  -(f1(theta2,theta3,theta4));
r2 = @(theta2,theta3,theta4)  -(f2(theta2,theta3,theta4));

A = @(theta3,theta4) l3*l4*(sin(theta3 - theta4));

hFunc = @(r1,r2,theta3,theta4,A) (-l4/A)*(r1*cos(theta4) + r2*sin(theta4));

kFunc = @(r1,r2,theta3,theta4,A) (-l3/A)*(r2*sin(theta3) + r1*cos(theta3));  

%guessing the first theta 3 and theta 4 values
theta3_0 = pi/6;
theta4_0 = pi/2;
t3 = theta3_0;
t4 = theta4_0;


%for loop w/ nested while loop to generate all the theta3 and theta4)
for i = 1:1:length(thet2_0)
    t2 = thet2_0(i);
    h = 10^-10;
    k = 10^-10;
    if i > 1
        t3 = thet3_0(i-1);
        t4 = thet4_0(i-1);
    end
    iter = 0;
    while(abs(h) > e || abs(k) > e)
        At = A(t3,t4);
        r1t = r1(t2,t3,t4);
        r2t = r2(t2,t3,t4);
        h = hFunc(r1t,r2t,t3,t4,At);
        k = kFunc(r1t,r2t,t3,t4,At);
        t3 = t3 + h;
        t4 = t4 + k;
        iter = iter+1;
    end
    thet3_0(i) = t3;
    thet4_0(i) = t4;
end

figure(1)
plot(rad2deg(thet2_0),rad2deg(thet4_0),'r');
title('Angle of Rocker vs Angle of Input Crank')
xlabel('angle of input crank (deg)')
ylabel('angle of rocker (deg)')

%% part B

px =  l2.*cos(thet2_0) + 6.*cos(thet3_0 + pi);
py = l2.*sin(thet2_0) + 6.*sin(thet3_0 + pi);
figure(2)
plot(px,rad2deg(thet4_0),'r');
title('Position of point p for full rotation.')
xlabel('X (cm)')
ylabel('Y (cm)')

%% Part C
qx = l2.*cos(thet2_0) + l3*cos(thet3_0) + 5*cos(thet4_0);
qy = l2.*sin(thet2_0) + l3*sin(thet3_0) + 5*sin(thet4_0);

dpq = sqrt((px-qx).^2 + (py-qy).^2);

dmax = max(dpq);
t = find(dpq==dmax);
tMax = thet2_0(t);


figure(3)
plot(rad2deg(thet2_0), dpq,'r')
hold on;
plot(rad2deg(tMax),15.612207573053459,'b*')
title('distance between point P and Q through full rotation')
legend('distance between p and q', 'maximum distance (15.6122 cm)')
ylabel('distance (cm)')
xlabel('angle (deg)')

%% Part D
w2 = (60/60)*(2*pi);
w4 = (w2*l2/l4).*(sin(thet3_0 - thet2_0)./sin(thet3_0-thet4_0));
aveW4 = median(w4);

figure(4)
plot(thet2_0,w4,'r')
hold on;
yline(aveW4,'b');
title('angular velocity of rocker over 1 revolution')
legend('rocker angular velocity','average angular velocity: -0.043 rads/s')
ylabel('angular velocity (rads/s)')
xlabel('angle (radian)')