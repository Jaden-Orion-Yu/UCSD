clear all; close all; clc; format long; 
name = 'AAAA AAAA';
id = 'A00000000';
hw_num = 'midterm';
form = 'A';

%% problem 1
p1a = 1:200;
p1b = sqrt(p1a);
p1c = 0;
for i = 1:length(p1b)
    p1c = p1c + (p1a(i)/p1b(i));
end

%% problem 2
A = [1,5,6;8,3,4;7,2,8];
b = [7;2;5];
p2 = A\b;



%% problem 3
rng(int8(form)); matA = randi(50,10);

p3a = sum(matA(10,:));
p3b = [matA(:,1) ; matA(:,3); matA(:,5) ;matA(:,7) ;matA(:,10)];
p3b = mean(p3b);
p3c = matA(:);
p3c(isprime(p3c) == true) = [];
p3c = prod(p3c);
p3d = matA;
p3d(p3d == max(p3d(:))) = min(p3d(:));
p3e = sprintf('[%7.2f %7.2f %7.2f %7.2f %7.2f ]', matA(46),matA(47),matA(48),matA(49),matA(50));

%% problem 4
% theta = 1:1080;
% x = 2*cos(theta)  + 3*cos(((theta).*2)./3);
% y = 2*sin(theta) - 3*sin(((theta).*2)./3);
% p4a = sum(sqrt((diff(x).^2)+(diff(y).^2)));
% 
% 
% 
% figure(1); hold on;
% plot(x,y,'-r','LineWidth',2,'MarkerSize',10,'Marker','o','MarkerFaceColor','b', 'MarkerEdgeColor','b')
% 
% xlabel('x')
% ylabel('y')
% legend('parametric curve','corners of the star')
% title('problem 4')