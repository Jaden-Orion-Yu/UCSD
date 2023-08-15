%% Problem 2 
clear;clc;
%Generating initial X and Y values for locations (goes from node 1 - 5)
pos = [0,2,4,1,3;0,0,0,sqrt(3),sqrt(3)];


%Settign up the stiffness matrix and corresponding variables;
E =  210*(10^9);
A = pi*(0.015^2);
L = 1;

k_neutral = @(x) [cosd(x)^2,cosd(x)*sind(x),-(cosd(x)^2),-(cosd(x)*sind(x));...
            cosd(x)*sind(x),sind(x)^2,-(cosd(x)*sind(x)),-(sind(x)^2);...
            -(cosd(x)^2),-(cosd(x)*sind(x)),cosd(x)^2,cosd(x)*sind(x);...
            -(cosd(x)*sind(x)),-(sind(x)^2),cosd(x)*sind(x),sind(x)^2] .*(A*E/(2*L));

% setting the beta values
B1 = 0;
B2 = 0;
B3 = 60;
%unsure of B4
B4 = 120;
B5 = 60;
B6 = 120;
%not sure if b7 is 0 or 180;
B7 = 180;

%Generating the individual stiffness matrixes for each memebr
K1 = k_neutral(B1)
K2 = k_neutral(B2)
K3 = k_neutral(B3)
K4 = k_neutral(B4)
K5 = k_neutral(B5);
K6 = k_neutral(B6);
K7 = k_neutral(B7);

%Generating node numbers to be iterated over
nodes = [1,2,1,2,2,3,4 ;...
         2,3,4,4,5,5,5];

%generating list of stiffness matrixes
kk = [K1,K2,K3,K4,K5,K6,K7];
%Generatign empty global stiffness matrix
KG = zeros(10,10);
for t = 1:1:7
    strt = ((t-1)*4) + 1;
    nd = (t*4) +1;
    ke = kk(:,strt:end);
    KT = zeros(10,10);
    i = nodes(1,t);
    j = nodes(2,t);
    KT([(2*i)-1,(2*i),(2*j)-1,(2*j)],[(2*i)-1,(2*i),(2*j)-1,(2*j)]) = ke([1,2,3,4],[1,2,3,4]);
    KG = KG + KT;
end

KG = KG

% generating applied forces and deformations
% v1 known, u1 is 0 as placeholder;
u1 = 0;
v1 = 0;
% u2 and v2 are unkown set as zero for placeholder
u2 = 0;
v2 = 0;
% u3 and v3 are zero because of pin
u3 = 0;
v3 = 0;
% u4 and v4 are unkown set as zero for placeholder
u4 = 0;
v4 = 0;
% u5 and v5 are unkown set as zero for placeholder
u5 = 0;
v5 = 0;

 % only fx1 known, fy1 is placeholder;
fx1 = 0;
fy1 = 0;
% known;
fx2 = 0;
fy2 = -20000;
% unknown, set as zero for placeholder
fx3 = 0;
fy3 = 0;
% known
fx4 = -10000;
fy4 = 0;
% known
fx5 = 0;
fy5 = 0;



%Solving for the rest of displacements using known forces
%for KGr1 we remove rows and columns 2, 5, and 6
KGr1 =  KG
KGr1([2,5,6],:) = [];
KGr1(:,[2,5,6]) = [];
Fr1 = [fx1;fx2;fy2;fx4;fy4;fx5;fy5,];
dr1 = KGr1\Fr1;
u1 = dr1(1);
u2 = dr1(2);
v2 = dr1(3);
u4 = dr1(4);
v4 = dr1(5);
u5 = dr1(6);
v5 = dr1(7);

% we now have the full displacement array
d = [u1;v1;u2;v2;u3;v3;u4;v4;u5;v5]

% solving for the rest of applied forces

Fr2 = KG*d
fy1 = Fr2(2)
fx3 = Fr2(5)
fy3 = Fr2(6)

% we now have full reaction forces array
F = [fx1;fy1;fx2;fy2;fx3;fy3;fx4;fy4;fx5;fy5]

%Plotting
nodes = nodes.'
pos = pos.'

figure(1)
for i = 1:1:7
    tempNode = nodes(i,:)
    pointA = pos(tempNode(1),:)
    pointB = pos(tempNode(2),:)
    points = [pointA;pointB]
    plot(points(:,1),points(:,2),'b')
    hold on;
end
pos2 = pos + ([d(1),d(2);d(3),d(4);d(5),d(6);d(7),d(8);d(9),d(10);].*500)
for i = 1:1:7
    tempNode = nodes(i,:)
    pointA = pos2(tempNode(1),:)
    pointB = pos2(tempNode(2),:)
    points = [pointA;pointB]
    plot(points(:,1),points(:,2),'r--')
    hold on;
end
daspect([1,1,1])
grid on;
xlabel('X (m)')
ylabel('Y (m)')
title('Original(blue) vs Deformation(red). Magnification factor = 500')
