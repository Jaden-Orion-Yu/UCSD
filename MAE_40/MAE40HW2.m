clear,clc, close all, syms s V1 V2 Vo C Ca Cb Cc Cd R Rb Ra Rc Rd

%% problem 1d
clear,clc, close all, syms s V1 V2 Vo C Ca Cb Cc Cd R Rb Ra Rc Rd
     %[V1;V2;Io;Ia;Ib;Ic;Id]
A1a  =[0   0  -1   1   1   0   0;    % 0 = Ia + Ib - Io
      0   0   0   0   1   1  -1;    % 0 =  Ib + Ic - Id
      0   0   0  -1   0   1   0;   % 0 = Ic - Ia
      1   0   0  Ra   0   0   0;    % Vo = Ia*Ra + V1
      0   1   0   0   1/(Cb*s)   0   0;    % Vo = Ib/(Cb*s) + V2 
    Cc*s -Cc*s   0   0   0  -1   0;   % 0 = Cc*s*V1 0 Cc*s*V2 - Ic
      0  -1  0   0   0   0   Rd]; % 0 = Id*Rd - V2
b1a  =[ 0; 0; 0; Vo; Vo; 0; 0]; 

% Solving for Vo using matrix operations
x1a=A1a\b1a;
V1_1a=simplify(x1a(1))

%V1_1a =(Vo*(Cb*Rd*s + Cc*Rd*s + Cb*Cc*Ra*Rd*s^2 + 1))/(Cc*Ra*s + Cb*Rd*s + Cc*Rd*s + Cb*Cc*Ra*Rd*s^2 + 1)

% Setting the transfer function G(s) as V1(x)/Vo(s) with substitutions
G1a = (V1_1a/simplify(b1a(5)))

% G1a = (Cb*Rd*s + Cc*Rd*s + Cb*Cc*Ra*Rd*s^2 + 1)/(Cc*Ra*s + Cb*Rd*s + Cc*Rd*s + Cb*Cc*Ra*Rd*s^2 + 1)

     %[V1;V2;Io;Ia;Ib;Ic;Id]
A1b  =[0   0  -1   1   1   0   0;    % 0 = Ia + Ib - Io
      0   0   0   0   1   1  -1;    % 0 =  Ib + Ic - Id
      0   0   0  -1   0   1   0;   % 0 = Ic - Ia
      1   0   0  2*R   0   0   0;    % Vo = Ia*Ra + V1
      0   1   0   0   1/(C*s)   0   0;    % Vo = Ib/(Cb*s) + V2 
    C*s  -C*s  0   0   0  -1   0;   % 0 = Cc*s*V1 0 Cc*s*V2 - Ic
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

F_Hw2a=RR_tf([1 omega1 omega1^2],[1 3*omega1 omega1^2]); 

figure(1)
RR_bode(F_Hw2a);
hold on;
subplot(2,1,1)
title('Bode Plot of q1 circuit using transfer function G(s) = V1(s)/Vo(s)','omega1 = 10 rad/s');
ylabel('signal magnitude')
xlabel('omega (rads/s)');
subplot(2,1,2)
xlabel('omega (rads/s)');
ylabel('phi (deg)')
%% problem 2d
clear,clc, close all, syms s V1 V2 Vo C Ca Cb Cc Cd R Rb Ra Rc Rd
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

% Setting the transfer function G(s) as V1(x)/Vo(s)
G2a = (V1_2a/simplify(b2a(5)))

     %[V1;V2;Io;Ia;Ib;Ic;Id]
A2b  =[0   0  -1   1   1   0   0;    % 0 = Ia + Ib - Io
      0   0   0   0   1   1  -1;    % 0 =  Ib + Ic - Id
      0   0   0  -1   0   1   0;   % 0 = Ic - Ia
      1   0   0  1/((C/2)*s)   0   0   0;    % Vo = Ia/((C/2)*s) + V1
      0   1   0   0   R   0   0;    % Vo = Ib*R + V2 
     -1   1   0   0   0  R   0;   % 0 = Ic*R + V2 - V1
      0 2*C*s  0   0   0   0   -1]; % 0 = 2*C*s*V2 - Id
b2b  =[ 0; 0; 0; Vo; Vo; 0; 0]; 

% Solving for Vo using matrix operations
x2b=A2b\b2b;
V1_2b=simplify(x2b(1))

% Setting the transfer function G(s) as V1(x)/Vo(s)
G2b = (V1_2b/simplify(b2b(5)))


% plotting
omega2 = 10;

F_Hw2b=RR_tf([1 omega2 omega2^2],[1 3*omega2 omega2^2]); 

figure(2)
RR_bode(F_Hw2b);
hold on;
subplot(2,1,1)
title('Bode Plot of q2 circuit using transfer function G(s) = V1(s)/Vo(s)','omega2 = 10 rad/s');
ylabel('signal magnitude')
xlabel('omega (rads/s)');
subplot(2,1,2)
xlabel('omega (rads/s)');
ylabel('phi (deg)')