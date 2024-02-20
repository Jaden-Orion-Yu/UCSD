clear;
clc;

syms s;

%% P1


A = [-0.313 56.7 0 ; 
     -0.0139 -0.436 0 ;
     0 56.7 0];
B = [0.232;
    0.0203;
    0];
C = [0 0 1];
D = 0;
t=0:0.2:25;

wnD = 0.975;

zetaD = 0.71;

alpha = 0.24;

p1 = roots([1/(alpha*wnD*zetaD) 1]);
p23 = roots([1/wnD^2 2*zetaD/wnD 1]);
%P = [-1/6, -1.3990+0.4684i, -1.3990-0.4684i];
P = [p1, p23(1), p23(2)]
K = acker(A, B, P);
Acl = A-B*K;
sys2=ss(Acl,B,C,D);

inf = stepinfo(sys2);


% Pol2=pole(sys2);
% y2=step(sys2,t);
% figure(2)
% hold on;
% plot(t,y2)
% title('Step Response of System');
% xlabel('Time (s)');
% ylabel('y(t)');
% grid on
% hold off

%% P2
%% 
t2 = [0:0.001:20]';

n = D + C*((-A + B*K)^-1)*B;

A2 = A-B*K;
B2 = B.*(1/n);
C2 = [C;-K];
D2 = [0;(1/n)];
sys3 = ss(A2,B2,C2,D2);
gain = dcgain(sys3);

K2 = acker(A, B, [-1/7,  -0.823 + 0.6866i , -0.823 - 0.6866i]);

n2 = D + C*((-A + B*K2)^-1)*B
A3 = A-B*K2;
B3 = B.*(1/n2);
C3 = [C;-K2];
D3 = [0;(1/n2)];
sys4 = ss(A3,B3,C3,D3);
% y3=step(sys4,t2);
% figure(2)
% hold on;
% plot(t2,y3)
% title('Step Response of System 2B');
% xlabel('Time (s)');
% ylabel('y(t)');
% grid on
% hold off


w = sin(cos((2*pi*1/3).*t2));
x0 = [1;0.1;0];
y4 = lsim(sys4,w,t2,x0);

% figure(3)
% hold on;
% plot(t2,y4)
% title('Step Response of System 2B with square wave');
% xlabel('Time (s)');
% ylabel('y(t)');
% grid on
% hold off


%% P3

%New Poles

p3a = P
p3b = [-1/7,  -0.823 + 0.6866i , -0.823 - 0.6866i]
p3c = [-1/6, -1 + 0.9396i ,-0.823 - 0.9396i] 

K3a = acker(A, B, p3a);
K3b = acker(A, B, p3b);
K3c = acker(A, B, p3c);

n3a = D + C*((-A + B*K3a)^-1)*B;
n3b = D + C*((-A + B*K3b)^-1)*B;
n3c = D + C*((-A + B*K3c)^-1)*B;

A4a = A-B*K3a;
A4b = A-B*K3b;
A4c = A-B*K3c;

C4a = [C;-K3a];
C4b = [C;-K3b];
C4c = [C;-K3c];

D4a = [0;(1/n3a)];
D4b = [0;(1/n3b)];
D4c = [0;(1/n3c)];

B4a = B.*(1/n3a);
B4b = B.*(1/n3b);
B4c = B.*(1/n3c);

sys2a = ss(A4a, B4a, C4a, D4a);
sys2b = ss(A4b, B4b, C4b, D4b);
sys2c = ss(A4c, B4c, C4c, D4c);

w1 = sin(cos((2*pi*1/3).*t2));
x1 = [2;0.5;0];

y1a = lsim(sys2a,w1,t2,x1);
y1b = lsim(sys2b,w1,t2,x1);
y1c = lsim(sys2c,w1,t2,x1);


w2 = cos((2*pi*1/3).*t2);
x2 = [2;1.5;0];
y2a = lsim(sys2a,w2,t2,x2);
y2b = lsim(sys2b,w2,t2,x2);
y2c = lsim(sys2c,w2,t2,x2);

figure(1)
subplot(2,1,1)
plot(t2,y1a(:,1))
title('Sys 2A  input 1 pitch angle response')
xlabel('Time (s)')
ylabel('Pitch Angle (rad)')
subplot(2,1,2)
plot(t2,y1a(:,2))
title('Sys 2A   input 1  elavator angle control signal')
xlabel('Time (s)')
ylabel('Elavator Angle (rad)')


figure(2)
subplot(2,1,1)
plot(t2,y1b(:,1))
title('Sys 2B  input 1 pitch angle response')
xlabel('Time (s)')
ylabel('Pitch Angle (rad)')
subplot(2,1,2)
plot(t2,y1b(:,2))
title('Sys 2b   input 1  elavator angle control signal')
xlabel('Time (s)')
ylabel('Elavator Angle (rad)')

figure(3)
subplot(2,1,1)
plot(t2,y1c(:,1))
title('Sys 2C  input 1 pitch angle response')
xlabel('Time (s)')
ylabel('Pitch Angle (rad)')
subplot(2,1,2)
plot(t2,y1c(:,2))
title('Sys 2C   input 1  elavator angle control signal')
xlabel('Time (s)')
ylabel('Elavator Angle (rad)')


figure(4)
subplot(2,1,1)
plot(t2,y2a(:,1))
title('Sys 2A  input 2 pitch angle response')
xlabel('Time (s)')
ylabel('Pitch Angle (rad)')
subplot(2,1,2)
plot(t2,y2a(:,2))
title('Sys 2A   input 2  elavator angle control signal')
xlabel('Time (s)')
ylabel('Elavator Angle (rad)')


figure(5)
subplot(2,1,1)
plot(t2,y2b(:,1))
title('Sys 2B  input 2 pitch angle response')
xlabel('Time (s)')
ylabel('Pitch Angle (rad)')
subplot(2,1,2)
plot(t2,y2b(:,2))
title('Sys 2B   input 2  elavator angle control signal')
xlabel('Time (s)')
ylabel('Elavator Angle (rad)')

figure(6)
subplot(2,1,1)
plot(t2,y2c(:,1))
title('Sys 2C  input 2 pitch angle response')
xlabel('Time (s)')
ylabel('Pitch Angle (rad)')
subplot(2,1,2)
plot(t2,y2c(:,2))
title('Sys 2C   input 2  elavator angle control signal')
xlabel('Time (s)')
ylabel('Elavator Angle (rad)')





