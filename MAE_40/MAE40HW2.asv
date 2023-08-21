clear,clc, close all, syms s V1 V2 Vo C Ca Cb Cc Cd R Rb Ra Rc Rd

%% problem 1d
clear,clc, close all, syms s V1 V2 Vo C Ca Cb Cc Cd R Rb Ra Rc Rd
     %[V1;V2;Io;Ia;Ib;Ic;Id]
A1a  =[0   0  -1   1   1   0   0;    % 0 = Ia + Ib - Io
      0   0   0   0   1   1  -1;    % 0 =  Ib + Ic - Id
      0   0   0  -1   0   1   0;   % 0 = Ic - Ia
      1   0   0  Ra   0   0   0;    % Vo = Ia*Ra + V1
      0   1   0   0   1/(Cb*s)   0   0;    % Vo = Ib/(Cb*s) + V2 
    Cc*s Cc*s   0   0   0  -1   0;   % 0 = Cc*s*V1 0 Cc*s*V2 - Ic
      0  -1  0   0   0   0   Rd]; % 0 = Id*Rd - V2
b1a  =[ 0; 0; 0; Vo; Vo; 0; 0]; 

% Solving for Vo using matrix operations
x1a=A1a\b1a;
V1_1a=simplify(x1a(1))

% Setting the transfer function G(s) as V1(x)/Vo(s) with substitutions
G1a = (V1_1a/simplify(b1a(5)))

% G1a = (Cb*Rd*s - Cc*Rd*s - Cb*Cc*Ra*Rd*s^2 + 1)/(Cc*Ra*s + Cb*Rd*s - Cc*Rd*s + Cb*Cc*Ra*Rd*s^2 + 1)

     %[V1;V2;Io;Ia;Ib;Ic;Id]
A1b  =[0   0  -1   1   1   0   0;    % 0 = Ia + Ib - Io
      0   0   0   0   1   1  -1;    % 0 =  Ib + Ic - Id
      0   0   0  -1   0   1   0;   % 0 = Ic - Ia
      1   0   0  2*R   0   0   0;    % Vo = Ia*Ra + V1
      0   1   0   0   1/(C*s)   0   0;    % Vo = Ib/(Cb*s) + V2 
    C*s  C*s  0   0   0  -1   0;   % 0 = Cc*s*V1 0 Cc*s*V2 - Ic
      0  -1  0   0   0   0   R/2]; % 0 = Id*Rd - V2
b1b  =[ 0; 0; 0; Vo; Vo; 0; 0]; 

% Solving for Vo using matrix operations
x1b=A1b\b1b;
V1_1b=simplify(x1b(1))

% Setting the transfer function G(s) as V1(x)/Vo(s)
G1b = (V1_1b/simplify(b1b(5)))

%G1b = -(C*R*s - 1)/(C*R*s + 1)

% plotting
omega1 = 10;

F_Hw2a=RR_tf([0 -1 omega1^2],[0 1 omega1^2]); 

figure(1)
RR_bode(F_Hw2a);
hold on;
subplot(2,1,1)
title('Bode Plot of 2nd order low pass filter with resistor and capacitor at Vout','omega5 = 10 rad/s');
ylabel('signal magnitude')
xlabel('omega (rads/s)');
subplot(2,1,2)
xlabel('omega (rads/s)');
ylabel('phi (deg)')
%% problem 2d
     %[V1;V2;Io;Ia;Ib;Ic;Id]
A2a  =[0   0  -1   1   1   0   0;    % 0 = Ia + Ib - Io
      0   0   0   0   1   1  -1;    % 0 =  Ib + Ic - Id
      0   0   0  -1   0   1   0;   % 0 = Ic - Ia
      1   0   0  1/(Ca*s)   0   0   0;    % Vo = Ia/(Ca*s) + V1
      0   1   0   0   Rb   0   0;    % Vo = Ib*Rb + V2 
     -1   1   0   0   0  Rc   0;   % 0 = Ic*Rc + V2 - V1
      0 Cd*s  0   0   0   0   -1]; % 0 = Cd*s*V2 - Id
b2a  =[ 0; 0; 0; Vo; Vo; 0; 0]; 

% Solving for Vo using matrix operations
x2a=A2a\b2a;
V1_2a=simplify(x2a(1))

% Setting the transfer function G(s) as Vo(x)/Vi(s)
G2a = (V1_2a/simplify(b2a(5)))