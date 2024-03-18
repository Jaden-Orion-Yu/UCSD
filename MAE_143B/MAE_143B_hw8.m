clear;
clc;

%% P1
P = tf([2500],[1 25 0]);
K = 1;


%B
figure(1)
h = nyquistplot(P);
setoptions(h,'PhaseUnits','rad','Grid','on');

figure(2);
bode(P);
grid on;

%% C part 1
a1c = 10;
T1c1 =0.003;
T1c2 =0.004;
T1c3 =0.005;

C1c1 = a1c*tf([1 (1/(a1c*T1c1))],[1 (1/T1c1)]);
C1c2 = a1c*tf([1 (1/(a1c*T1c2))],[1 (1/T1c2)]);
C1c3 = a1c*tf([1 (1/(a1c*T1c3))],[1 (1/T1c3)]);

figure(3)
bode(C1c1)
hold on
bode(C1c2)
hold on
bode(C1c3)
grid on
legend('T = 0.03','T = 0.04','T = 0.05')
%% C part 2
figure(4)
bode(P*C1c1)
hold on
bode(P*C1c2)
hold on
bode(P*C1c3)
grid on
legend('T = 0.03','T = 0.04','T = 0.05')

[T1c1Gm,T1c1Pm,T1c1Wcg,T1c1Wcp] = margin(P*C1c1);
[T1c2Gm,T1c2Pm,T1c2Wcg,T1c2Wcp] = margin(P*C1c2);
[T1c3Gm,T1c3Pm,T1c3Wcg,T1c3Wcp] = margin(P*C1c3);

T1phase = T1c1Pm;
T2phase = T1c2Pm;
T3phase = T1c3Pm;

%% C part 3
figure(5)
nyquist(P*C1c1)
hold on
nyquist(P*C1c2)
hold on
nyquist(P*C1c3)
grid on
legend('T = 0.03','T = 0.04','T = 0.05')

%% D
ad = 10;
Td = 0.005;
Cd = tf(ad*[1 1/ad/Td],[1 1/Td]);
cloopd1 = feedback(Cd*P,1);

figure(6)
step(cloopd1);

cloopd2 = feedback(Cd,P);
figure(7)
step(cloopd2)

%% E
ae = ad;
Te = Td;
S = 1/(1 + P*Cd);
TsensFunc = (P*Cd)/(1 + P*Cd);

figure(8)
bode(S);
hold on
bode(P*S);
hold on
bode(Cd*S);
hold on;
bode(TsensFunc);
grid on
legend('S(s)','P(s)*S(s)','C(s)*P(s)','T(s)f')

%% P2

%1-4

K2 = 40;
K2c = 1;
P2 = tf(K2,[1 5 4 0])
figure(9)
[Gm,Pm,Wcg,Wcp] = margin(P2);
margin(P2)

%% 4-5

T22 = 5;
beta = 10;

lead = tf([1 1/T22],[1 1/(beta*T22)]);

figure(10)
margin(lead)

%% 7
T21 = 1/0.4;

C2 = K2c*tf([1 1/T21],[1 beta/T21])*tf([1 1/T22],[1 1/(beta*T22)]);

figure(11)
bode(C2)
%% 8

figure(12)
bode(P2)
hold on
bode(C2*P2);
legend('uncompensated','Compensated')

%% 9-A
cloop2 = feedback(C2*P2,1);

figure(13)
step(cloop2)

%% 9-B
t = [0:0.001:20]';
ramp = t;
y = lsim(cloop2,ramp,t);
figure(14)
plot(t,y)
hold on
plot(t,ramp)
hold on
plot(t,lsim(feedback(P2,1),ramp,t))
xlabel('time (s)')
ylabel('output')
title('Compensated System Ramp Response')
legend('compensated','refference ramp','uncompensated')
