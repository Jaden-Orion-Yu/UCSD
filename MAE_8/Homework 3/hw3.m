clear all; 
close all; 
clc;         
format long; 

name = 'Jaden McDonald Peltier Yu';
id = 'A15960227';
hw_num = 3;


%% problem 1
matA = (-1).^(-40:40).*(-40:40); 
matA = abs(rot90(reshape(matA,9,9)));
p1a = matA;
p1a(p1a == median(p1a)) = -88888;
p1b = p1a;
p1b(p1b == median(p1b,"all")) = -99999;
p1c = any(isprime(find(p1b > 0).')>0);
p1d = matA(isprime(matA(:)) == 1);


%% problem 2
A = diag(3:32, 0) + diag(repmat(-2, 1, 29), 1) + diag(repmat(-2, 1, 29), -1);
b = [-2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 ];
p2 = A\(b.');



%% problem 3
x = 1:2:20;
y = 10:20:200;

p3a = (x.^2).*y;
p3b = x.^(log10(y.*2));
p3c = (sin((y.^x).*.5))./(exp((y./x).*.5));
p3d = (x + exp((y.^x).*-2))./((y.*2) + log((x.^y).*2));

%% problem 4
x = 0:.1:4;
f = cos(x).*exp(sin(x));
p4a = diff(f)./diff(x);
x = 0:.001:4;
f = cos(x).*exp(sin(x));
p4b = diff(f)./diff(x);
p4c = p4b(find(x == .34));
p4d = x(find(max(p4b)));

%% problem 5
z = -1:.1:1;
g = (cosh(z).^2) + (cosh(z).^4);

dx = x(2) - x(1);

p5a = dx * ((.5*(g(1) + g(end))) + sum(g(2:end-1)) );

z = -1:.001:1;
g = (cosh(z).^2) + (cosh(z).^4);
dx = x(2) - x(1);


p5b =  dx * ((.5*(g(1) + g(end))) + sum(g(2:end-1)) );


%% problem 6
theta = 0:(0.05*pi):(20*pi);
x = (theta.*cos(theta)).*0.2;
y = (theta.*sin(theta)).*0.2;

figure(1); hold on;
plot(x,y,'-rd')
title('2 Dimensional Spiral')
xlabel('x axis')
ylabel('y axis')
hold off;
p6a = 'See figure 1';

gca
p6b = sum(sqrt((diff(x).^2)+(diff(y).^2)));

%% problem 7
theta = 0:(0.05*pi):(20*pi);
x = (theta.*cos(theta)).*0.2;
y = (theta.*sin(theta)).*0.2;
z = theta.*.2;

figure(2); hold on;
plot3(x,y,z,'-mo')
title('3 Dimensional Spiral')
xlabel('x axis')
ylabel('y axis')
view(3);
hold off;
p7a = 'See figure 2';

p7b = sum(sqrt((diff(x).^2)+(diff(y).^2) + (diff(z).^2)));