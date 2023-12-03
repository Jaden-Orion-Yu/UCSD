clear;
clc;

%% P2
H2 = tf([1],[1 -2  2]);
figure(1)
bode(H2)




%% P4
H4a = tf([100 0 100],[2 100  2]);
H4b = tf([1 0],[1 200]);
H4c = tf([20 0],[2 100 2]);
H4d = tf([100],[1 100]);


figure(2)

subplot(2,2,1)
bode(H4a)
title('H1')

subplot(2,2,2)
bode(H4b)
title('H2')

subplot(2,2,3)
bode(H4c)
title('H3')

subplot(2,2,4)
bode(H4d)
title('H4')