clear all; 
close all; 
clc;         
format long; 

name = 'Jaden McDonald Peltier Yu';
id = 'A15960227';
hw_num = 6;


tic
%% problem 1
p1a = sqrt(1);
for i = 1:9 
p1a = sqrt(1 + p1a);
end

p1b = sqrt(1);
for i = 1:9 
p1b = sqrt(1 + (2*p1b));
end

p1c = sqrt(2);
for i = 1:9 
    p1c = sqrt(2 + (((-1)^i)*(p1c)));
end

%% problem 2
n = 0;
f = 1;
while f > ((10)^-9)
    f = exp(1)/prod(1:(n + 2));
    n =n+1;
end
p2a = n;

n = 100;
f = 1;
while f  < 10^9
    f = (n + 1)*log(n + 1);
    n = n +1;
end
p2b = n;

%% problem 3
k = 0;
p3a = 0;
while abs(pi- p3a) >= (10)^(-6)
    p3a = 4* ((p3a/4) +  ((-1)^k)/((2*k) + 1));
    k = k+1;
end
p3b = k;


k = 0;
p3c = 0;
while abs(pi- p3c) >= (10)^(-6)
    p3c = sqrt(12)* ((p3c/sqrt(12)) +  ((-3)^(-k))/((2*k) + 1));
    k = k+1;
end
p3d = k;

p3e ='the series in part c converges faster';

%% problem 4
load('stringA.mat')
p4a = 0;
p4b = 0;
p4c = 0;
p4d = 0;
p4e = 0;
p4f = 0;

for n = 3:length(stringA)-3
    switch stringA(n-2:n)
        case 'you'
            p4a = p4a + 1;
        case 'say'
            p4b = p4b + 1;
        case 'how'
            p4c = p4c +1;
    end
end

for n = 4:length(stringA)-4
    switch stringA(n-3:n)
        case 'code'
            p4d = p4d + 1;
        case 'will'
            p4e = p4e + 1;
        case 'loop'
            p4f = p4f +1;
    end
end


%% problem 5

load('terrain.mat')
maxcounter = 0;
mincounter = 0;
for n = 2:length(x)-1
    for m = 2:length(y)-1
        nb(1) = altitude(n-1,m-1);
        nb(2) = altitude(n,m-1);
        nb(3) = altitude(n+1,m-1);
        nb(4) = altitude(n+1,m);
        nb(5) = altitude(n+1,m+1);
        nb(6) = altitude(n,m+1);
        nb(7) = altitude(n-1,m+1);
        nb(8) = altitude(n-1,m);
        if altitude(n,m) >= max(nb)
            maxcounter = maxcounter +1;
            xloc_max(maxcounter) = x(n);
            yloc_max(maxcounter) = y(m);
            altitude_locmax(maxcounter) = altitude(n,m);
        end
        if altitude(n,m) <= min(nb)
            mincounter = mincounter +1;
            xloc_min(mincounter) = x(n);
            yloc_min(mincounter) = y(m);
            altitude_locmin(mincounter) = altitude(n,m);
        end
    end
end
p5a = maxcounter;
p5b = xloc_max;
p5c = yloc_max;
p5d = altitude_locmax;
p5e = mincounter;
p5f = xloc_min;
p5g = yloc_min;
p5h = altitude_locmin;

highestpeak_altitude = max(altitude_locmax);
highest_x = 0; highest_y = 0;
for n = 1:length(x)
    for m = 1:length(y)
        if altitude(n,m) == highestpeak_altitude
            highest_x = n;
            highest_y = m;
        end
    end
end

P1 = [highest_x,highest_y, highestpeak_altitude];
%P2 = [find(x(-800)),find(y(-600)), altitude(find(x(-800)),find(y(-600)))];
%pts = [P1, P2];

figure(1);
hold on;
surf(y,x,altitude)
plot3(yloc_max,xloc_max,altitude_locmax,'ro', 'MarkerFaceColor', 'r');
plot3(yloc_min,xloc_min,altitude_locmin,'go', 'MarkerFaceColor', 'g');
%plot3(pts(:,1), pts(:,2), pts(:,3),'mo','MarkerFaceColor','m');
xlabel('x coordinate (m)') 
ylabel('y coordinate (m)')
zlabel('altitude (m)')
title('3D terrain altitude map')
legend('altitude','local maximums','local minimums')
view(3);
shading interp

p5i = 'See figure 1';

toc