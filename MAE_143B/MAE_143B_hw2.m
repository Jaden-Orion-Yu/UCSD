clear;clc;
%% Problem 1
Kt = 0.02;
Ke = 0.02;
Ra = 10;
b = 0.001;
Jm = 0.01;

d1 = (b + (Kt*Ke/Ra))/Jm;

K1 = 0.5;
K2 = 1;
K3 = 2;

d2a = Kt*K1/(Ra*Jm); 
d2b = Kt*K2/(Ra*Jm);
d2c = Kt*K3/(Ra*Jm);

G1a = tf([1 d2a],[1 d1 d2a]);
G1b = tf([1 d2b],[1 d1 d2b]);
G1c = tf([1 d2c],[1 d1 d2c]);

[y1a,x1a] = step(G1a);
[y1b,x1b] = step(G1b);
[y1c,x1c] = step(G1c);



figure(1)

plot(x1a,y1a,'LineWidth',2)
hold on;
plot(x1b,y1b,'LineWidth',2)
hold on;
plot(x1c,y1c,'LineWidth',2)
hold on;
title('Step Response')
xlabel('Time (s)')
ylabel('Amplitude')
legend('K = 0.5', 'Kp = 1','Kp = 2')
grid on

%% Problem 2

s = tf('s');
G2 = (s/2 +1)/((s/40 +1)*((s/4)^2) + (s/4) + 1);
[y2,t2] = step(G2);

figure(2)
plot(t2,y2,'LineWidth',2)
hold on;
title('Step Response')
xlabel('Time (s)')
ylabel('step response of G(s)')
grid on

%% Problem 3
s = tf('s');
G3 = (50*(s + 1)*(s +2))/((s^2 + (5*s) + 40)*(s^2 + (0.03*s) + 0.06)) ;
K = 0:0.1:5;

for i = 1:length(K)
   D = (K(i)*(s+3))/(s+10); 
   system = feedback(D*G3,1);
   st = stepinfo(system);
   t = st.Overshoot
   if st.Overshoot <= 10 && st.RiseTime <= 0.5
        K = K(i)
        break
   end
end

figure(3)
step(system)
title('Step Response of G(s)*D(s) with K = 2.4')
xlabel('Time (s)')
ylabel('step response')
grid on

%% Problem 4
s = tf('s');

G41 = (-2*(s-1))/((s+1)*(s +2));
G42 = (3*(s-1)*(s-2))/((s+1)*(s+2)*(s+3));

figure(4)
step(G41,'-m')
hold on
step(G42,'-c')
title('Step Response of G1(s) and G2(s)')
xlabel('Time (s)')
ylabel('step response')
legend('G1(s)','G2(s)')
grid on




