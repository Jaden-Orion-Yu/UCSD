clear,clc, close all, syms s Vi Vo C L R C1 C2 Rd
%% Quesiton 1
% Second-order low-pass LC filter With Resistor at Vo: Solve for Vo as a function of Vi
% x={I_L,I_C,I_R,V_o}  <-- unknown vector
A  =[ -1  1   1  0;    % 0 = I_C + I_R - I_L
      0  -1   0 C*s;    % 0 = C*s*Vo - I_C 
      0   0   R -1;    % 0 = I_R*R - Vo
      0   0   0 ((L*C*(s^2)) + (L/R)*s + 1)];  % Vi = Vo*(L*C*s^2 + (L/R)*s + 1)
b  =[ 0; 0; 0;Vi]; 

% Solving for Vo using matrix operations
x=A\b;
Vo_LPF2R=simplify(x(4))

% Setting the transfer function G(s) as Vo(x)/Vi(s)
G = x(4)/b(4)

%% Question 2

% Bode plots for zeta = 0.1, 0.7, 1 and omega4 = 10
z1 = 0.1;
z2 = 0.7;
z3 = 1;
omega4=10;

%creating the transer function variables for each zeta value
F_LPF2Rz1=RR_tf([omega4^2],[1 (z1*2*omega4) omega4^2]); 
F_LPF2Rz2=RR_tf([omega4^2],[1 (z2*2*omega4) omega4^2]); 
F_LPF2Rz3=RR_tf([omega4^2],[1 (z3*2*omega4) omega4^2]); 

%plotting on multiple figures
figure(1)
RR_bode(F_LPF2Rz1);
hold on;
subplot(2,1,1)
title('Bode Plot of 2nd order low pass filter with resistive load',' zeta = 0.1');
ylabel('signal magnitude')
xlabel('omega (rads/s)');
subplot(2,1,2)
xlabel('omega (rads/s)');
ylabel('phi (deg)')

figure(2)
RR_bode(F_LPF2Rz2);
hold on;
subplot(2,1,1)
title('Bode Plot of 2nd order low pass filter with resistive load',' zeta = 0.7');
ylabel('signal magnitude')
xlabel('omega (rads/s)');
subplot(2,1,2)
xlabel('omega (rads/s)');
ylabel('phi (deg)')

figure(3)
RR_bode(F_LPF2Rz3);
hold on;
subplot(2,1,1)
title('Bode Plot of 2nd order low pass filter with resistive load',' zeta = 1');
ylabel('signal magnitude')
xlabel('omega (rads/s)');
subplot(2,1,2)
xlabel('omega (rads/s)');
ylabel('phi (deg)')

%% Question 3
clear,clc, close all, syms s Vi Vo C L R C1 C2 Rd
% Second-order low-pass LC filter With Resistor and capacitor at Vo: Solve for Vo as a function of Vi
% x={I_L,I_C1,I_C2,I_Rd,Vmid,V_o}  <-- unknown vector
A2  =[0   0  -1  -1   0   0;    % 0 = I_C2 - I_Rd
     -1   1   0   1   0   0;    % 0 = I_C1 + I_Rd - I_L 
      0  -1   0   0   0   C1*s;   % 0 = C1*s*Vo - I_C1
      0   0   0   Rd  -1   1;    % 0 = I_Rd*Rd - Vmid + Vo
      0   0  -1   0   0   C2*s;    % 0 = C2*s*Vmid - I_C2
     L*s   0   0   0   0   1];   % Vi = Vo + L*s*I_L
b2  =[ 0; 0; 0; 0; 0; Vi]; 

% Solving for Vo using matrix operations
x2=A2\b2;
Vo_LPF2RC=simplify(x2(6))

% Setting the transfer function G(s) as Vo(x)/Vi(s)
G2 = x2(6)/b2(6)

% plotting
omega5 = 10;

F_LPF2RC=RR_tf([omega5^2],[1 0 omega5^2]); 

figure(4)
RR_bode(F_LPF2RC);
hold on;
subplot(2,1,1)
title('Bode Plot of 2nd order low pass filter with resistor and capacitor at Vout','omega5 = 10 rad/s');
ylabel('signal magnitude')
xlabel('omega (rads/s)');
subplot(2,1,2)
xlabel('omega (rads/s)');
ylabel('phi (deg)')

%% Question 4
 syms s Vi Vo C L R
% Second-order low-pass LC filter With Resistor and capacitor at Vo: Solve for Vo as a function of Vi
% C2 = 4C, Rd = sqrt(L/C)
% x={I_L,I_C1,I_C2,I_Rd,Vmid,V_o}  <-- unknown vector
A3  =[0   0  -1  -1   0   0;    % 0 = I_C2 - I_Rd
     -1   1   0   1   0   0;    % 0 = I_C1 + I_Rd - I_L 
      0  -1   0   0   0   C*s;   % 0 = C*s*Vo - I_C1
      0   0   0   sqrt(L/C)  -1   1;    % 0 = I_Rd*sqrt(L/C) - Vmid + Vo
      0   0  -1   0   0   4*C*s;    % 0 = 4*C*s*Vmid - I_C2
     L*s   0   0   0   0   1];   % Vi = Vo + L*s*I_L
b3  =[ 0; 0; 0; 0; 0; Vi]; 
% Solving for Vo using matrix operations
x3=A3\b3;
Vo_LPF2RC2=simplify(x3(6))

% Setting the transfer function G(s) as Vo(x)/Vi(s)
G3 = x3(6)/b3(6)

% plotting
omega6 = 10;

F_LPF2RC2=RR_tf([omega6^2],[-1 0 omega6^2]); 

figure(5)
RR_bode(F_LPF2RC2);
hold on;
subplot(2,1,1)
title('Bode Plot of 2nd order low pass filter with resistor and capacitor at Vout','omega6 = 10 rad/s');
ylabel('signal magnitude')
xlabel('omega (rads/s)');
subplot(2,1,2)
xlabel('omega (rads/s)');
ylabel('phi (deg)')