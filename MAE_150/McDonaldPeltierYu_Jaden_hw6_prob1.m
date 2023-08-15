%% Prob 1
clear;clc;
%setting up constants
r = 0.02;
E = 200*(10^9);
L = 1;
l = 0.2;
P = 100;
I = pi*(r^4)/4;


%% Part A

%Setting up deflection formula
delta = @(x) ((P.*x.^2)./(6*E*I)).*((L*3) - x);

%getting the deflection of the end
dL = delta(1)

%% Part B
%Coordinates 
coords = [0,0.2,0.4,0.6,0.8,1;0,0,0,0,0,0];

%Setting up individual member stiffness matrix eqaution

k_ind = @(l) [12,(6*l),-12,(6*l);...
            (6*l),4*(l^2),-(6*l),2*(l^2);...
            -12,-(6*l),12,-(6*l);...
            (6*l),2*(l^2),-(6*l),4*(l^2)].*(I*E/(l^3));

% Creating individual stiffness matrixes
K1 = k_ind(0.2)
K2 = k_ind(0.2)
K3 = k_ind(0.2)
K4 = k_ind(0.2)
K5 = k_ind(0.2)

ke = [K1,K2,K3,K4,K5,];

% Generating empty global stiffness matrix
KG = zeros(12,12);

% Filling global stiffness matrix
for i = 1:2:9
    %1-4, then 3-6, then 5-8, then 7-10, then 9-12
    st = (((i - 1)*2) +1)
    nd = st + 3
    b = (i + 3)
    KT = zeros(12,12)
    KT(i:b,i:b) = ke(:,st:nd)
    KG = KG + KT; 
end
KG = KG
% Generating displacements
% only u1 and t1 are known, all others are unkown
u1 = 0;
t1 = 0;
% t2-6 and u2-6 are set as 0 for placeholders;
u2 = 0;
t2 = 0;
u3 = 0;
t3 = 0;
u4 = 0;
t4 = 0;
u5 = 0;
t5 = 0;
u6 = 0;
t7 = 0;

% generating reaction forces
%r1 and r2 are unkown, Set as 0 for temprary values that are changed later
r1 = 0;
r2 = 0;
%r3-r12 are all zero, except for r11 which is -p
r3 = 0;
r4 = 0;
r5 = 0;
r6 = 0;
r7 = 0;
r8 = 0;
r9 = 0;
r10 = 0;
r11 = -P;
r12 = 0;

% solving for the rest of the displacements
KGr1 = KG;
KGr1([1,2],:) = [];
KGr1(:,[1,2]) = [];
Fr1 = [r3;r4;r5;r6;r7;r8;r9;r10;r11;r12];
dr1 = KGr1\Fr1;
u2 = dr1(1);
t2 = dr1(2);
u3 = dr1(3);
t3 = dr1(4);
u4 = dr1(5);
t4 = dr1(6);
u5 = dr1(7);
t5 = dr1(8);
u6 = dr1(9);
t6 = dr1(10);
d = [u1;t1;u2;t2;u3;t3;u4;t4;u5;t5;u6;t6];

for i = 2:2:12
   d(i) = rad2deg(d(i));
end
d = d;
% solving for the rest of the reaction forces
Fr1 = KG*d;
r1 = Fr1(1);
r2 = Fr1(2);
F = [r1;r2;r3;r4;r5;r6;r7;r8;r9;r10;r11;r12];

%plotting
figure(1)
x = linspace(0,1);
y = -delta(x);
yt= d.';
coords2 = coords;
coords2(2,:) = yt(1:2:11);
plot(x,y,'r')
hold on;
plot(coords2(1,:),coords2(2,:),'b');
hold on;
grid on;
title('Analytical displacement Vs. FEA displacement')
xlabel('length (m)');
ylabel('height (m * 10^-3)');
legend('Analytical','FEA')
