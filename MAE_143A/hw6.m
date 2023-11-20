%% Q2
clear;
clc;
T = 2;
K1 = 10

x = @(t) (t>=0 & t<=1) - (t>1 & t<= T);

%Assume odd
A0 = (.5)*integral(@(t) x(t), 0, 2);
Ak = 0;
Bk = @(k) integral(@(t) x(t).*sin(2*pi*k*t/T), 0, T);

t = 0:0.001:T;
X = (A0/2);
for i = 1:K1
    X = X + Bk(i) * sin(2*pi*i*t/T);
end

figure;
for K = [1, 10, 100, 500, 1000]
    X2 = A0/2;
    for j = 1:K
        X2 = X2 + Bk(j) * sin(2*pi*j*t/T);
    end
    plot(t, X2,'DisplayName', ['N = ', num2str(K)]);
    hold on;
end
title('Gibbs Observation');
xlabel('Time (t)');
ylabel('Y (A.U)');
legend('show');

%% Q5
clear;
clc;

H1 = tf([-5 120 400],[1 0]);
H2 = tf([100 0],[-5 -1100 70000 1000000]);

figure(1)
bode(H1)
figure(2)
bode(H2)