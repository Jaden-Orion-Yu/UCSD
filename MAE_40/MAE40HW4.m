clear,clc, close all, syms s Vi Vm Vo Vo_A Vo_B Vd C L R Ic Il Il_A Il_B Ir t 

% Four possible phases for buck boost circuit

%% Phase 1: loop A W/ no diode
% x = [Vo Vm   Il  Ic  Ir ]
A1  =[ 0   s   0   0   0     ;    % Vi = Vm*s
       0  -1  L*s  0   0     ;    % Il_A*L = L*(s*Il)  - Vm
      C*s  0   0  -1   0     ;    % C*Vo_A = C*(s*Vo) - Ic 
      -1   0   0   0   R     ;    % 0 = Ir*R - Vo
       0   0   0   1   1    ];    % 0 = Ir + Ic

      
b1  =[ Vi ; Il_A*L; C*Vo_A; 0; 0]; 

x1 = A1\b1;

Vo1 = x1(1)
Il1 = x1(3)

%% Phase 2: loop A w/ diode

% x = [Vo Vm   Il  Ic  Ir ]
A2  =[ s  -s   0   0   0     ;    % Vd = (Vo*s) - (Vm*s)
       0  -1  L*s  0   0     ;    % L*Il_A = L*(s*Il)  - Vm
      C*s  0   0  -1   0     ;    % C*Vo_A = C*(s*Vo) - Ic 
      -1   0   0   0   R     ;    % 0 = Ir*R - Vo
       0   0   1   1   1    ];    % 0 = Ir + Ic + Il

      
b2  =[ Vd; L*Il_A; C*Vo_A; 0; 0]; 

x2 = A2\b2;

Vo2 = x2(1)
Il2 = x2(3)

%% Phase 3: loop B w/o diode

% x = [Vo Vm   Il  Ic  Ir ]
A3  =[ 0  -1  L*s  0   0     ;    % L*Il_b = L*s*Il - Vm
       0   0   0   1   1     ;    % 0 = Ic + Ir
      -1   0   0   0   R     ;    % 0 = Ir*R - Vo  
       0   0   1   1   1     ;    % 0 = Ir + Ic + Il
      C*s  0   0  -1   0    ];    % C*Vo_B = C*s*Vo - Ic

      
b3  =[ L*Il_B;0; 0; 0; C*Vo_B]; 

x3 = A3\b3;

Vo3 = x3(1)
Il3 = x3(3)

%% Phase 4: loop B w/ diode

% x = [Vo Vm   Il  Ic  Ir ]
A4  =[ 0  -1  L*s  0   0     ;    % L*Il_B = L*s*Il - Vm 
      C*s  0   0  -1   0     ;    % C*Vo_B = C*s*Vo - Ic
      -1   0   0   0   R     ;    % 0 =Ir*R - Vo   
       s  -s   0   0   0     ;    % Vd = Vo*s - Vm*s
       0   0   1   1   1    ];    % 0 = Il + Ic + Ir

      
b4  =[ L*Il_B; C*Vo_B; 0; Vd; 0]; 

x4 = A4\b4;

Vo4 = x4(1)
Il4 = x4(3)

%% Finding inverse laplaces
% Phases go from 1-4-2 and then cycle between 2 and 4 infinitley
Vo1_t = ilaplace(Vo1)
Il1_t = ilaplace(Il1)

Vo4_t = ilaplace(Vo4)
Il4_t = ilaplace(Il4)


Vo2_t = ilaplace(Vo2)
Il2_t = ilaplace(Il2)