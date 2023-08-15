clear all; 
close all; 
clc;         
format long; 

name = 'Jaden McDonald Peltier Yu';
id = 'A15960227';
hw_num = 4;

%% problem 1
p1a = clock; %not sure if this is the right format or if it needs to be a string
p1b = sprintf('%d:%2d:%2d',p1a(1),p1a(2),p1a(3)); 
p1c = sprintf('%2d:%2d:%7.4f',p1a(4),p1a(5),p1a(6));
p1d = sprintf('%s',p1c(1:end-5));
p1e = sprintf('%s %s', p1b, p1d);

%% problem 2
%need to check what format they want at the end
matA = [ pi, pi/4, pi/7 ; pi/2 , pi/5 , pi/8 ; pi/3 , pi/6, pi/9];
p2a = sprintf('[%6.4f] \n', matA(:,1)); %does this need to be in vector format, if sow how
p2b = sprintf('[%5.3f]', matA(2,:)); %same
p2c = sprintf('[%16.14f]',matA);
p2d = sprintf('[%11.5e]',matA);

%% problem 3
load('rainfall.dat');
p3a = max(max(rainfall(:,2:end)));
[r,c] = find(rainfall(:,:) == p3a);
p3b = c - 1;
p3c = rainfall(r,1);
p3d = length(find((rainfall(:,2:end) > 2 ) & (rainfall(:,2:end) < 5 )));
p3e = length(find(rainfall(61:161 , 2) > 4));


%% problem 4
load('temperature.dat');
p4a = temperature(:,1).';
p4b = temperature(:,10).';
p4c = (p4a.*0) + mean(p4b);
p4d = [max(p4b),min(p4b)];
[r1,c1] = find(temperature(:,10) == p4d(1));
[r2,c2] = find(temperature(:,10) == p4d(2));
p4e = [temperature(r1,1),temperature(r2,1)];

figure(1);hold on;
plot(p4a, p4b, '-k');
plot(p4a, p4c, '-b')
plot(p4e(1), p4d(1), 'rs')
plot(p4e(2), p4d(2), 'gd')
title('Temperatures of the Month of October in San Diego');
xlabel('Year')
ylabel('Temperature (f)')
legend('temperature','average temperature','maximum temperature','minimum temperature', 'Location','northwest');
hold off;
p4f = 'See figure 1';
p4g = temperature(49, 2:13).';
p4h  = 1:12;

figure(2); hold on;
bar(p4h,p4g);
title('Temperatures in San Diego from January to Februrary in year 1900');
xlabel('month');
ylabel('temperature (f)');
hold off;
p4i = 'See figure 2';
output_data = temperature(49:58, :);
save("temperature_1900_1910.dat", 'output_data','-ascii');
p4j = evalc('type("temperature_1900_1910.dat")');

%% problem 5
a = 1;
b = 0;
p5a = true;
p5b = true;
p5c = true;
p5d = false;

%% problem 6
v = 1:-1:1;
p6a = true;
p6b = true;
p6c = true;
p6d = true;

%% problem 7


p7a = evalc('help divisibility');
p7b = divisibility(55);
p7c = divisibility(273);
p7d = divisibility(5505);
p7e = divisibility(15015);

function div = divisibility(a)
%DIVISIBILITY 
%   Divisibility takes input 'a' and checks if it is divisible by the
%   numbers in vector 'div = [3, 5, 7, 11, 13]'. 
% example: divisible(14) = [0,0,1,0,0]
div = [3,5,7,11,13];
div = mod(a,div);
div(div > 0)=10000000000;
div(div == 0) = 1;
div(div > 1) = 0;


end