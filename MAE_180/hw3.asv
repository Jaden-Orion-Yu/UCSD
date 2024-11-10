clear;clc;

%% problem 1
w = pi/4;
i = pi/3;
omega = (-pi)/6;
R_ECI = [29700;0;29700];

Gomega = [cos(omega), sin(omega), 0;-sin(omega), cos(omega), 0; 0,0,1]; 
Gi = [1,0,0;0,cos(i), sin(i);0,-sin(i), cos(i)];
Gw = [cos(w), sin(w), 0;-sin(w), cos(w), 0; 0,0,1];

step1 = Gomega*R_ECI;
step2 = Gi*step1;
step3 = Gw*step2;

%% problem 2
w2 = pi/4;
i2 = pi/3;
omega2 = (-pi)/6;
R_Peri2 = [29700;0;29700];
R_eci2 = peri2eci(R_Peri2,w2,i2,omega2);


%% Problem 3

n = sqrt(42828/(6000^3));
M = n*7200;
e = 0.3;
V_peri3 = [0.101888;-1.95864;0];
R_peri3 = [-7792.626;-283.678;0];

ans3 = ecc2ecctrueanom(e,M);

V_mci3 =peri2eci(V_peri3, (pi/4),(pi/6),(pi/3));
R_mci3 =peri2eci(R_peri3, (pi/4),(pi/6),(pi/3));

%% Problem 4

R4 = [819;-3338;-473];
V4 = [3.4;0.994;-1.962];

H4 = cross(R4,V4);

UH4 = H4/norm(H4);

i4 = asin(UH4(3))

omega4 = atan2 (UH4(1),UH4(2))

%% Problem 5
R_eci5 = [8000;-4000;3000];
dt = 3600;
we = 0.7292115e-5;
wet = we*dt;
Gwe = [cos(wet), sin(wet), 0;-sin(wet), cos(wet), 0; 0,0,1];

R_ef5 =Gwe*R_eci5 


%% functions
function R  = eci2peri(r,w,i,omega)
    Gomega = [cos(omega), sin(omega), 0;-sin(omega), cos(omega), 0; 0,0,1]; 
    Gi = [1,0,0;0,cos(i), sin(i);0,-sin(i), cos(i)];
    Gw = [cos(w), sin(w), 0;-sin(w), cos(w), 0; 0,0,1];
    R = Gw*Gi*Gomega*r;
end

function R  = peri2eci(r,w,i,omega)
    Gomega = [cos(omega), sin(omega), 0;-sin(omega), cos(omega), 0; 0,0,1]; 
    Gi = [1,0,0;0,cos(i), sin(i);0,-sin(i), cos(i)];
    Gw = [cos(w), sin(w), 0;-sin(w), cos(w), 0; 0,0,1];
    R = (Gomega')*(Gi')*(Gw')*r;
end

function out = ecc2ecctrueanom(e,M) 
     E = M;
     acc = 1e-9;  
     diff = 1;   
     while abs(diff) > acc
        diff = E-e*sin(E)-M;
        E = E-diff/(1-e*cos(E));  
     end
     Nu = 2 * atan2(sqrt(1+e)*sin(E/2), sqrt(1-e)*cos(E/2));
     out = [E,Nu];
end