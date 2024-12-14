clear;clc;

%% Problem 2
n2 = sqrt(398600/(8000^3));
T2 = 2*pi*sqrt(8000^3/398600);
Rab_i = [0;0.1;0.05];
Vab_i = [0;0;0];
x = Rab_i(1);
y = Rab_i(2);
z = Rab_i(3);
%T/4
phiT4 = [(4-3*cos(n2*T2/4))  0 0 ;
        (6*(sin(n2*T2/4)-(n2*T2/4))) 1 0
        0 0 cos(n2*T2/4)];
Rab_t4 = phiT4*Rab_i;
%T/2
phiT2 = [(4-3*cos(n2*T2/2))  0 0 ;
        (6*(sin(n2*T2/2)-(n2*T2/2))) 1 0
        0 0 cos(n2*T2/2)];
Rab_t2 = phiT2*Rab_i;

%% Problem 3
%distance units in km
mu3 = 398600;
a3 = 8000;
frontMax = 0.2;
backMax = -0.1;
n3 = sqrt(mu3/(a3^3));
T3 = 2*pi/n2;

%both circular orbits, will both oscilate with sin and cos, assuming 
% positive Y direction is front and negative y direction is back, setting
% y limits accordingly.

%initial conditions
x3_0 = 0.5;
y3_0 = 0.05;
Ax = 0.05;
Ay = 0.15;



%values
t3 = linspace(0,T3,1000);
x3 = Ax*cos(n3*t3);
y3 = Ay*sin(n3*t3) +.05;

figure(1)
subplot(3,1,1)
plot(t3,x3)
grid on;
title('X position over 1 period')
xlabel('Time (s)')
ylabel('X position (km)')
subplot(3,1,2)
plot(t3,y3)
grid on;
title('Y position over 1 period')
xlabel('Time (s)')
ylabel('Y position (km)')
subplot(3,1,3)
plot(x3,y3)
grid on;
title('X position vs Y position')
xlabel('X position (km)')
ylabel('Y position (km)')

%% Problem 4
a4 = 8000;
e4 = 0.1;
i4 = pi/6;
omega4 = pi/2;
w4 = pi/2;
mu4 = 398600;
n4 = sqrt(mu4/a4^3);
t = 24*60*60;
j2 = 0.00108;
Re = 6378.14;
k4 = (-3/2)*((j2*Re^2)/((a4^2)*(1-e4^2)));
dOmega = -k4*n4*cos(i4);
dw4 = k4*n4*(2-(5/2)*(sin(i4)^2));
% dM = n4 + k4*n4*sqrt(1-e4^2);

omega4_f = omega4 + dOmega*t;
w4_f = w4 + dw4*t;

%solving for new I to avoid changes in dw by setting dw to 0 and solving
%for new i

i4_new = rad2deg(asin(sqrt((2/(5/2)))));


%% problem 6

Rs6_eci =[8000;4000;2000];

%lat and long of ground position is in geodatic rads
lat6 = 0.576;
long6 = 4.241;
ae6 = 6378.14;
be6 = 6356.75;
we = 7.292115816*(10^-5);
%dt is 8 hours, converted to minutes.
dt6 = 8*60*60;
etilde6sqrd = 1- (be6^2/ae6^2);
p = [0 1 0; 0 0 1; 1 0 0];
Rg6_ef = [cos(lat6)*cos(long6);
           cos(lat6)*sin(long6);
           (1-etilde6sqrd)*sin(lat6)];
Rg6_ef = ((ae6)/(sqrt(1-(etilde6sqrd*(sin(lat6))^2)))).*Rg6_ef;

Rs6_ef = G3(Rs6_eci,(we*dt6));

R_enu = p*G2(G3((Rs6_ef - Rg6_ef),long6),-lat6);
disp(R_enu)

%% functions
function R = G3(r,theta)
    G3 = [cos(theta), sin(theta), 0;-sin(theta), cos(theta), 0; 0,0,1];
    R = G3*r;
end

function R = G2(r,theta)
    G2 = [cos(theta),0,-sin(theta);0,1,0;sin(theta),0,cos(theta)];
    R = G2*r;
end