clear all; close all; clc; format long; 
name = 'AAAA AAAA';
id = 'A00000000';
hw_num = 'midterm';
form = 'A';

%% Problem 1: (a,b) 3 pts each, (c) 4 pts, total 10 pts
sp1a = 1:199;
sp1b= sqrt(2:200);
sp1c = sum(sp1a./sp1b);

%% Problem 2: 10 pts
A = [1 5 6; 8 3 4; 7 2 8];
b = [7; 2; 5];
x = A\b;
sp2 = x;

%% Problem 3: (a-e) 8 pts, total 40 pts
rng(int8(form));
matA = randi(50,10);
sp3a = sum(matA(end,:));
sp3b = mean(mean(matA([1:2:7,10],:)));
sp3c = prod(matA(~isprime(matA)));
sp3d = matA;
max_val = max(sp3d(:));
min_val = min(sp3d(:));
sp3d(sp3d == max_val) = min_val;
sp3e = sprintf('%7.2f',matA(1,end-4:end));

%% Problem 4: (a) 8 pts, (b,c,d) 4 pts each, (e) 8 pts, (f) 4 pts, (g) 16 pts, total 40 pts
theta = 1:1080; 
a = 5; b = 3;
x = 2*cosd(theta) + 3*cosd(2/3*theta);
y = 2*sind(theta) - 3*sind(2/3*theta);
sp4a = sum(sqrt(diff(x).^2+diff(y).^2));

dxdtheta = diff(x)./diff(theta); sp4b = dxdtheta;
dydtheta = diff(y)./diff(theta); sp4c = dydtheta;
l = sqrt(dxdtheta.^2+dydtheta.^2); sp4d = l;
sp4e = (theta(2)-theta(1))*(0.5*(l(1)+l(end)) + sum(l(2:end-1)));
sp4f = abs(sp4a-sp4e);


% Identify the indices of the corners starting from the top and going
% counterclockwise
ind_peak(1) = find(y == max(y));
ind_peak(2) = find(x == min(x) & y > 0);
ind_peak(3) = find(x == min(x) & y < 0);
ind_peak(4) = find(y == min(y));
ind_peak(5) = find(x == max(x));

figure(1); hold on;
plot(x,y,'r-','LineWidth',2);
plot(x(ind_peak),y(ind_peak),'bo','MarkerFaceColor','b','MarkerSize',10)
box on; grid on;
xlabel('x'); ylabel('y');
box on; grid on;
title('Problem 4');
legend('parametric curve', 'corners of the star','Location','NorthWest')
set(gca,'FontSize',16)
sp4g = 'See figure 1';
