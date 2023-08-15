% Second-order low-pass LC filter: Solve for V_o as a function of V_i
% x={I_L,I_C,V_o}  <-- unknown vector
A  =[ 1  -1   0;    % I_L - I_C = 0
     L*s  0   1;    % L*s*I_L + V_o = V_i
      0  -1  C*s];  % C*s*V_o - I_C = 0
b  =[ 0; V_i; 0];
x=A\b; LPF2=simplify(x(3))
omega3=10; F_LPF2=RR_tf([omega3^2],[1 0 omega3^2]); figure(3), RR_bode(F_LPF2)
