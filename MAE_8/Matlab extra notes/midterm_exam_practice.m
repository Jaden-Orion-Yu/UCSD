%% Miterm exam Practice
clear all;
close all;
clc;
format long;

name = 'Thomas Bowers';
id = 'A17561188';
hw_num = 'midterm';
form = 'A';



p1a = 1:199;
p1b = sqrt(2:200);
p1c = sum(p1a./p1b);


%%

A_p2 = [1 5 6; 8 3 4; 7 2 8];
b_p2 = [7; 2; 5];

x2 = A_p2\b_p2;

p2 = x2;



%% 

rng(int8(form)); matA = randi(50,10);

p3a = sum(matA(end, :));

avg_val_vec = [matA(1, :), matA(3, :), matA(5, :), matA(7, :), matA(10, :)];

p3b = mean(avg_val_vec);


p3c = prod(matA(~isprime(matA)));


p3d = matA;

p3d(p3d == max(max(p3d))) = min(min(p3d));
p3d;


p3e = sprintf('%7.2f ', matA(1, end-4:end));


%%

theta = 1:1080;
x4 = 2*cosd(theta) + 3*cosd(2/3*theta);
y4 = 2*sind(theta) - 3*sind(2/3*theta);

p4a = sum(sqrt((diff(x4).^2+diff(y4).^2)));

p4b = diff(x4)./diff(theta);

p4c = diff(y4)./diff(theta);

l4 = sqrt(p4b.^2 + p4c.^2);

p4d = l4;

dtheta = theta(2) - theta(1);
p4eInt = dtheta*(0.5*(l4(1) + l4(end)) + sum(l4(2:end-1)));

p4e = p4eInt;

p4f = abs(p4a - p4e);

bottom_corner = find(y4 == min(y4));
top_corner = find(y4 == max(y4));
right_corner = find(x4 == max(x4));
left_corners = find(x4 < -4.04497);


figure(1); hold on;
plot(x4, y4, '-r', 'LineWidth', 2);
plot(x4(bottom_corner), y4(bottom_corner), 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerSize', 10);
plot(x4(top_corner), y4(top_corner), 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerSize', 10);
plot(x4(right_corner), y4(right_corner), 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerSize', 10);
plot(x4(left_corners), y4(left_corners), 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerSize', 10);
xlabel('x4 = 2*cos(theta) + 3*cos(2/3*theta)');
ylabel('y4 = 2*sin(theta) - 3*sin(2/3*theta)');
title('Star graph');
set(gca, 'Xtick', -5:5:5, 'Ytick', -5:5:5);
legend('parametric curve', 'corners', 'Location', 'Northwest');



p4g = figure(1);