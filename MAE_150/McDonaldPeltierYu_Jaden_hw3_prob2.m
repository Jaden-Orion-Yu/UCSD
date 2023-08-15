%% Problem 2
clear;clc;

% Setting up beta, L, and omega variables. Beta is in degrees, omega is in
% degrees/s and L is in mm
L1 = 10;
L3 = 10;
L6 = 12;
L7 = 32; 
beta1 = 90;
beta2 = 45;
beta3 = 60;
beta4 = 30;
beta5 = 70;
beta6 = 20;
beta7 = 60;
omega = 250*6;
ro = 51;


% Best Fitting for the first rise
h1 = [0,0.1,0.3,0.7,1.2,1.8,2.5,3.3,4.1,5];
h2 = [5,5.9,6.7,7.5,8.2,8.8,9.3,9.7,9.9,10];
d1 = 0:5:45;
d2 = 45:5:90;
P1 = polyfit(d1,h1,5);
P2 = polyfit(d2,h2,5);

disp5Poly1 = @(d) P1(1).*d.^5 + P1(2).*d.^4 +P1(3)*d.^3 +P1(4).*d.^2 + P1(5).*d + P1(6);
d5Poly1 = @(d) ((5*P1(1)).*d.^4) + ((4*P1(2)).*d.^3) +((3*P1(3)).*d.^2) +((2*P1(4)).*d) + (P1(5));
vel5Poly1 =  @(d) ((omega*5*P1(1)).*d.^4) + ((omega*4*P1(2)).*d.^3) +((omega*3*P1(3)).*d.^2) +((omega*2*P1(4)).*d) + (omega*P1(5));
acc5Poly1 =  @(d) (((omega^2)*5*4*P1(1)).*d.^3) + (((omega^2)*4*3*P1(2)).*d.^2) +(((omega^2)*3*2*P1(3)).*d) +((omega^2)*2*P1(4));
jerk5Poly1 = @(d) (((omega^3)*5*4*3*P1(1)).*d.^2) + (((omega^3)*2*4*3*P1(2)).*d) +((omega^3)*3*2*P1(3));

disp5Poly2 = @(d) P2(1).*d.^5 + P2(2).*d.^4 +P2(3)*d.^3 +P2(4).*d.^2 + P2(5).*d + P2(6);
d5Poly2 =   @(d) ((5*P2(1)).*d.^4) + ((4*P2(2)).*d.^3) +((3*P2(3)).*d.^2) +((2*P2(4)).*d) + (P2(5));
vel5Poly2 =  @(d) ((omega*5*P2(1)).*d.^4) + ((omega*4*P2(2)).*d.^3) +((omega*3*P2(3)).*d.^2) +((omega*2*P2(4)).*d) + (omega*P2(5));
acc5Poly2 =  @(d) (((omega^2)*5*4*P2(1)).*d.^3) + (((omega^2)*4*3*P2(2)).*d.^2) +(((omega^2)*3*2*P2(3)).*d) +((omega^2)*2*P2(4));
jerk5Poly2 = @(d) (((omega^3)*5*4*3*P2(1)).*d.^2) + (((omega^3)*4*3*2*P2(2)).*d) +((omega^3)*3*2*P2(3));


% setting up displacement, velocity, acceleration, and jerk functions for harmonic, cycloidal, and 3-4-5 fall
dispHarmonic = @(L,B,d) (L/2).*(1 - cos(((pi/deg2rad(B)).*deg2rad(d))));
dHarmonic = @(L,B,d) ((L/2)*(pi/B)).*sin((pi/deg2rad(B)).*deg2rad(d));
velHarmonic = @(L,B,d) ((L/2)*(pi/B)*omega).*sin((pi/deg2rad(B)).*deg2rad(d));
accHarmonic = @(L,B,d) ((L/2)*((pi/B)*omega)^2).*cos((pi/deg2rad(B)).*deg2rad(d));
jerkHarmonic = @(L,B,d) (-(L/2)*((pi/B)*omega)^3).*sin((pi/deg2rad(B)).*deg2rad(d));

dispCycloid = @(L,B,d) L.*((d./B) - (1/(2*pi)*sind((2*180/(B)).*(d))));
dCycloid = @(L,B,d) (L/B)*(1- cos((2*pi/deg2rad(B)).*deg2rad(d)));
velCycloid = @(L,B,d) (L*omega/B)*(1- cos((2*pi/deg2rad(B)).*deg2rad(d)));
accCycloid = @(L,B,d) (2*pi*L)*(omega/B)^2*sin((2*pi).*deg2rad(d)./deg2rad(B));
jerkCycloid = @(L,B,d) ((2*pi)^2*L)*(omega/B)^3*cos((2*pi).*deg2rad(d)./deg2rad(B));

disp345Poly = @(L,B,d) L-(L.*((10.*(d./B).^3) - (15.*(d./B).^4) + (6.*(d./B).^5)));
d345Poly = @(L,B,d)  -(L*(((30).*(d.^2)./(B^3)) - ((60).*(d.^3)./(B^4)) + ((30).*(d.^4)./(B^5))));
vel345Poly = @(L,B,d)  -(L*(((30*omega).*(d.^2)./(B^3)) - ((60*omega).*(d.^3)./(B^4)) + ((30*omega).*(d.^4)./(B^5))));
acc345Poly = @(L,B,d) -(L*(((60*(omega^2)).*(d)./(B^3)) - ((180*(omega^2)).*(d.^2)./(B^4)) + ((120*(omega^2))*(d.^3)./(B^5))));
jerk345Poly = @(L,B,d) -(L*((60*(omega^3)/(B^3)) - ((360*(omega^3)).*(d)./(B^4)) + ((360*(omega^3)).*(d.^2)./(B^5))));

x1a = 0:0.01:45;
x1b = 45:0.01:90; 
x2 = 90:0.01:120;
tempY2 = zeros(1,length(x2));
tempY2disp = tempY2 + disp5Poly2(90);
tempY2vel = tempY2 + vel5Poly2(90);
x3 = 120:0.01:180;
x4 = 180:0.01:210;
tempY4 = zeros(1,length(x4));
tempY4disp = tempY4 + dispHarmonic(L3,beta3,180);
tempY4vel = tempY4 + velHarmonic(L3,beta3,180);
x5 = 210:0.01:280;
x6 = 280:0.01:300;
tempY6 = zeros(1,length(x6));
tempY6disp = tempY6 + 20 +dispCycloid(L6,beta5,70);
tempY6vel = tempY6 + velCycloid(L6,beta5,70);
x7 = 300:0.01:360;

%subplot(4,1,1);
plot(linspace(0,45),disp5Poly1(linspace(0,45)),'r');
hold on;
plot(linspace(45,90),disp5Poly2(linspace(45,90)),'r');
hold on;
plot([90,120],[disp5Poly2(90),disp5Poly2(90)],'g');
hold on;
plot(x3, 10+ dispHarmonic(L3,beta3,x3),'b');
hold on;
plot([180,210],[(10+ dispHarmonic(L3,beta3,180)),(10+ dispHarmonic(L3,beta3,180))],'c');
hold on;
plot(x5,20+ dispCycloid(L6,beta5,(0:0.01:70)),'m');
hold on;
plot(x6,tempY6disp,'y');
hold on;
plot(x7,disp345Poly(L7,beta7,(0:0.01:60)),'k');
xlim([0,360])
title('Displacement vs Theta')
ylabel('displacement (mm)');
xlabel('theta (degrees)')
yline(32);
legend('5th order poly','','dwell','harmonic','dwell','cycloidal','dwell','345 fall')

% subplot(4,1,2);
% plot(x1a,vel5Poly1(x1a),'r');
% hold on;
% plot(x1b,vel5Poly2(x1b),'r');
% hold on;
% plot([90,120],[vel5Poly2(90),vel5Poly2(90)],'g');
% hold on;
% plot(x3,velHarmonic(L3,beta3,x3),'b');
% hold on;
% plot([180,210],[velHarmonic(L3,beta3,180),velHarmonic(L3,beta3,180)],'c');
% hold on;
% plot(x5,velCycloid(L3,beta5,(0:0.01:70)),'m');
% hold on;
% plot([280,300],[velCycloid(L3,beta5,(70)),velCycloid(L3,beta5,(70))],'y');
% hold on;
% plot(x7,vel345Poly(L7,beta7,0:0.01:60),'k');
% xlim([0,360])
% title('Velocity vs Theta')
% ylabel('Velocity (mm/deg)');
% xlabel('Theta (degrees)')
% legend('5th order poly','','dwell','harmonic','dwell','cycloidal','dwell','345 fall')
% 
% subplot(4,1,3);
% plot(x1a,acc5Poly1(x1a),'r');
% hold on;
% plot([45,45],[acc5Poly1(45),acc5Poly2(45)],'r.-')
% hold on;
% plot(x1a,acc5Poly1(x1a),'r');
% hold on;
% plot([90,90],[acc5Poly2(90),0],'r.-')
% hold on;
% plot(x1b,acc5Poly2(x1b),'r');
% hold on;
% plot([90,120],[0,0],'g');
% hold on;
% plot([120,120],[0,accHarmonic(L3,beta3,120)],'g.-')
% hold on;
% plot(x3,accHarmonic(L3,beta3,x3),'b');
% hold on;
% plot([180,180],[accHarmonic(L3,beta3,180),0],'b.-')
% hold on;
% plot([180,210],[0,0],'c');
% hold on;
% plot(x5,accCycloid(L3,beta5,0:0.01:70),'m');
% hold on;
% plot([280,300],[0,0],'y');
% hold on;
% plot(x7,acc345Poly(L7,beta7,0:0.01:60),'k');
% xlim([0,360])
% title('Acceleration vs Theta')
% ylabel('Acceleration (mm/(deg)^2)');
% xlabel('Theta (degrees)')
% legend('5th order poly','','','','','dwell','','harmonic','','dwell','cycloidal','dwell','345 fall')
% 
% subplot(4,1,4);
% plot(x1a,jerk5Poly1(x1a),'r');
% hold on;
% plot(x1b,jerk5Poly2(x1b),'r');
% hold on;
% plot([90,90],[jerk5Poly2(90),0],'r.-')
% hold on;
% plot([90,120],[0,0],'g');
% hold on;
% plot(x3,jerkHarmonic(L3,beta3,x3),'b');
% hold on;
% plot([180,210],[0,0],'c','LineWidth',1);
% hold on;
% plot([210,210],[0,jerkCycloid(L3,beta5,0)],'c.-')
% hold on;
% plot(x5,jerkCycloid(L3,beta5,x5),'m');
% hold on;
% plot([280,280],[jerkCycloid(L3,beta5,70),0],'m.-')
% hold on;
% plot([280,300],[0,0],'y');
% hold on;
% plot([300,300],[0,jerk345Poly(L7,beta7,0)],'y.-')
% hold on;
% plot(x7,jerk345Poly(L7,beta7,0:0.01:60),'k');
% xlim([0,360])
% title('Jerk vs Theta')
% ylabel('Jerk (mm/(deg)^3)');
% xlabel('theta (degrees)')
% legend('5th order poly','','','dwell','harmonic','dwell','','cycloidal','','dwell','','345 fall')
% 
% %% part b
% %pressure angle phi = atan((dy/dtheta)/(ro+y))
% tableX = 0:30:360;
% tableY = [rad2deg(atan((d5Poly1(0)/(ro+disp5Poly1(0))))),... 
%     rad2deg(atan((d5Poly1(30)/(ro+disp5Poly1(30))))),... 
%     rad2deg(atan((d5Poly2(60)/(ro+disp5Poly2(60))))),... 
%     rad2deg(atan((d5Poly2(90)/(ro+disp5Poly2(90))))),... 
%     rad2deg(atan((dHarmonic(L3,beta3,120)/(ro+(dispHarmonic(L3,beta3,120) +10))))),... 
%     rad2deg(atan((dHarmonic(L3,beta3,150)/(ro+(dispHarmonic(L3,beta3,150) + 10))))),... 
%     rad2deg(atan((dHarmonic(L3,beta3,180)/(ro+(dispHarmonic(L3,beta3,180) + 10))))),...
%     rad2deg(atan((dCycloid(L3,beta5,0)/(ro+(dispCycloid(L3,beta5,0) + 20))))),... 
%     rad2deg(atan((dCycloid(L3,beta5,30)/(ro+(dispCycloid(L3,beta5,30) + 20))))),...
%     rad2deg(atan((dCycloid(L3,beta5,60)/(ro+(dispCycloid(L3,beta5,60) + 20))))),...
%     rad2deg(atan((d345Poly(L7,beta7,0)/(ro+disp345Poly(L7,beta7,0))))),...
%     rad2deg(atan((d345Poly(L7,beta7,30)/(ro+disp345Poly(L7,beta7,30))))),...
%     rad2deg(atan((d345Poly(L7,beta7,60)/(ro+disp345Poly(L7,beta7,60)))))]
% 
% figure (2)
% y0 = atan((d5Poly1(0:0.01:45)./(ro+disp5Poly1(0:0.01:45))));
% plot(0:0.01:45,y0,'r');
% hold on;
% y1 = atan(d5Poly2(linspace(45,90))./(ro+disp5Poly2(linspace(45,90))));
% plot(linspace(45,90),y1,'r');
% hold on;
% t1 = atan(d5Poly2(90)./(ro+disp5Poly2(90)));
% plot([90,120],[t1,t1],'g');
% hold on;
% y2 = atan(dHarmonic(L3,beta3,x3)./(ro+10+dispHarmonic(L3,beta3,x3)));
% plot(x3, y2,'b');
% hold on;
% t2 = atan(dHarmonic(L3,beta3,180)./(ro+10+ dispHarmonic(L3,beta3,180)));
% plot([180,210],[t2,t2],'c');
% hold on;
% y3 = atan(dCycloid(L3,beta5,0:0.01:70)./(ro+(dispCycloid(L3,beta5,0:0.01:70) + 20)));
% plot(x5,y3,'m');
% hold on;
% t3 = atan(dCycloid(L3,beta5,70)./(ro+(dispCycloid(L3,beta5,70) + 20)));
% plot([280,300],[t3,t3],'y');
% hold on;
% y4 = atan(d345Poly(L7,beta7,0:0.01:60)./(ro+disp345Poly(L7,beta7,0:0.01:60)));
% plot(x7,y4,'k');
% xlim([0,360])
% ylim([(-16*10^(-3)),(4*10^(-3))])
% title('Pressure Angle vs Theta')
% ylabel('Pressure angle (rad)');
% xlabel('theta (degrees)')
%  legend('5th order poly','','dwell','harmonic','dwell','cycloidal','dwell','345 fall')
