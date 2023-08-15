clear all; close all; clc; format long; 
name = 'Jaden McDonald Peltier Yu'; 
id = 'A15960227';
hw_num = 7;

%% Problem 1:
load matrixA.mat;
[row,col] = size(matrixA);

p1a = 0;
for e = 1:row
    for f = 1:col 
        if e <= f
            continue
        end
        p1a = p1a + matrixA(e,f);
    end
end
p1b = 1;
for e = 1:row
    for f = 1:col
        if e >= f
            continue
        end
        p1b = p1b*matrixA(e,f);
    end
end
p1c = 0;
for e = 1:row
    for f = 1:col
        if e == 2j
            continue
        end
        p1c = p1c + matrixA(e,f);
    end
end
p1d = 1;
for e = 1:row
    for f = 1:col
        if matrixA(e,f) > f
            continue
        end
        p1d = p1d*matrixA(e,f);
    end
end

%% Problem 2:
p2a = evalc('help train');
[t20s, d20s, v20s] = train(300,20);
[t2s, d2s, v2s] = train(300,2);
p2b = d20s(end);
p2c = v20s(end);
p2d = d2s(end);
p2e = v2s(end);

figure;

subplot(2,1,1);
plot(t20s, d20s, '-d', t2s, d2s, '-s');
legend('20 second step', '2 second step', 'location','best');
title('Distance Vs Time');
xlabel('time(s)');
ylabel('distance(m)');

subplot(2,1,2);
plot(t20s, v20s, '-d', t2s, v2s, '-s');
legend('20 second step', '2 second step', 'location','best');
title('Velocity vs Time');
xlabel('time(s)');
ylabel('velocity(m^s)');

p2f = 'See figure 1';

%% Problem 3:
p3a = evalc('help rocket');
p3b = evalc('help gravity');
p3c = evalc('help thrust');
p3d = evalc('help rocket>gravity');
p3e = evalc('help rocket>thrust');

[T,Z,W] = rocket(120,0.1);
p3f = Z(end);
p3g = W(end);

figure;

subplot(2,1,1);
plot(T,Z,'-r');
legend('120s flight using 0.1s step', 'location','best');
title('Altitude Vs Time');
xlabel('time(s)');
ylabel('altitude(m)');

subplot(2,1,2);
plot(T,W, '-');
legend('120s flight using 0.1s step', 'location','best');
title('Velocity vs Time');
xlabel('time(s)');
ylabel('velocity(m/s)');

p3h = 'see Figure 2';