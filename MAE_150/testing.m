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

x1a = 0:0.01:45;
x1b = 45:0.01:90; 
x2 = 90:0.01:120;
tempY2 = zeros(1,length(x2));
tempY2disp = tempY2 + disp5Poly2(90);
tempY2vel = tempY2 + vel5Poly2(90);
tempY2acc = tempY2 + acc5Poly2(90);
tempY2jerk = tempY2 + jerk5Poly2(90);
x3 = 120:0.01:180;
x4 = 180:0.01:210;
tempY4 = zeros(1,length(x4));
tempY4disp = tempY4 + dispHarmonic(L3,beta3,180);
tempY4vel = tempY4 + velHarmonic(L3,beta3,180);
tempY4acc = tempY4 + accHarmonic(L3,beta3,180);
tempY4jerk = tempY4 + jerkHarmonic(L3,beta3,180);
x5 = 210:0.01:280;
x6 = 280:0.01:300;
tempY6 = zeros(1,length(x6));
tempY6disp = tempY6 + dispCycloid(L6,beta6,280);
tempY6vel = tempY6 + velCycloid(L6,beta6,280);
tempY6acc = tempY6 + accCycloid(L6,beta6,280);
tempY6jerk = tempY6 + jerkCycloid(L6,beta6,280);
x7 = 300:0.01:360;

dispHarmonic = @(L,B,d) (L/2).*(1 - cos(((pi/deg2rad(B)).*deg2rad(d))));
temp = (pi/beta3).*(0:0.01:60);

plot((0:0.01:60),dispHarmonic(10,60,x3),'b');
t = dispHarmonic(10,60,60)
