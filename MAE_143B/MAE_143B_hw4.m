clear;
clc;

syms s;

%% P1


A = [-0.131 56.7 0 ; 
     -0.0139 -0.436 0 ;
     0 56.7 0];
B = [0.232;
    0.0203;
    0];
C = [0 0 1];
D = 0;



s = tf('s');

P_pitch = (1.151*s+0.1774)/(s^3 + 0.739*s^2 + 0.921*s);




sys = ss(A, B, C, D);

Controllability = [B A*B A*A*B];
Observability = [C;C*A;C*(A^2)];
t=0:0.2:25;


wnD = 0.9;
%zetaD = 0.5911550338;
zetaD = 0.59;

alpha = 1;

%tf_new = (1/((s/(alpha*wnD*zetaD) + 1) *((s/wnD)^2 + (2*zetaD*s/wnD) + 1)));

p1 = roots([1/(alpha*wnD*zetaD) 1]);
p23 = roots([1/wnD^2 2*zetaD/wnD 1]);
P = [-1/5, p23(1),  p23(2)]
K = acker(A, B, P);
Acl = A-B*K;
sys2=ss(Acl,B,C,D);
Pol2=pole(sys2);
y2=step(sys2,t);
figure(2)
hold on;
plot(t,y2)
title('Step Response of System');
xlabel('Time (s)');
ylabel('y(t)');
grid on
hold off
