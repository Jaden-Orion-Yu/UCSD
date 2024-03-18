clear;
clc;
%%PSS 6
% sys = tf([1],[1 3 4 1]);
% syscouter = tf([-1],[1 3 4 1]);
% figure(1)
% nyquist(sys)
% hold on
% nyquist(syscouter)
 
%%P1
%A
sysB = tf(5,[1 3 3 5]);
figure(1)
nyquist(sysB)
hold on
nyquist(-sysB)
Pb = pole(sysB);
%B
[num1,den1] = tfdata(feedback(-0.5*sysB,1));
check1B = roots(den1{1});
%% C
%figure(2)
w1 = logspace(-1,1,100);
[mag1,phase1,wout1] = bode(sysB);

figure(2);
bode(sysB);
grid on;

% iphase = find(phase1(1,1,:) == -180);
% iomega = w1(iphase);
% imag = mag1(iphase);

%% D
[num1D,den1D] = tfdata(feedback(0.6*sysB,1));
check1D = roots(den1D{1})

%% 2
P2 = tf(1,[1 1 0 1]);
C2 = tf([1 0.5],1);
L2 = P2*C2;
% A
figure(3)
bode(L2)
grid on;

%B
figure(4)
nyquist(L2)

%% 3
L3 = tf([1 -2],[1 -4 3]);

figure(6)
nyquist(L3)
hold on
poles3 = pole(L3)

%% 4
 
% A
L4 = tf([1 1],[1 -1 0 0]);
figure(10)
nyquist(L4)
pole4 = pole(L4)


%C
figure(11)
nyquist(L4)
[num4a,den4a] = tfdata(feedback(1.2*L4,1));
check4C1 = roots(den4a{1})
[num4b,den4b] = tfdata(feedback(-1.2*L4,1));
check4C2 = roots(den4b{1})