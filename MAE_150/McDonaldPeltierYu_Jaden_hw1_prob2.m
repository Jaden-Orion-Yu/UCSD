%% problem 2
% x and y val arrays along with the refference point

x1 = [4,6,6,10,10,12,12,11,11,10,10,6,6,5,5,4,4];
y1 = [8,6,5,5,6,8,9,9,10,10,11,11,10,10,9,9,8];

ref1 = [8;8];
%plotting the first points
plot(x1,y1,'r')
hold on
plot(ref1(1),ref1(2), 'b*')
%adding grid and axis lines
grid on
xlim([-10,18])
ylim([-10,18])
plot([0 0], ylim, '--')                 % Dashed Vertical Line at x=0
plot(xlim, [0 0], '--')
hold on
%forward translation
x2 = zeros(1,length(x1));
y2 = zeros(1,length(y1));
for i = 1:1:length(x2)
    Tf = [1,0,-ref1(1);0,1,-ref1(2);0,0,1];
    temp = Tf*[x1(i);y1(i);1];
    x2(i) = temp(1);
    y2(i) = temp(2);
end
plot(x2,y2,'r')
hold on
%scaling
S = [1.5,0;0,1.5];
temp2 = S *[x2;y2];
x3 = temp2(1,:);
y3 = temp2(2,:);
plot(x3,y3,'b')
hold on
%rotate
theta = 1/sqrt(2);
x4 = zeros(1,length(x1));
y4 = zeros(1,length(y1));
for i = 1:1:length(x2)
    R = [cos(theta),sin(theta),0;-sin(theta),cos(theta),0;0,0,1];
    temp = R*[x3(i);y3(i);1];
    x4(i) = temp(1);
    y4(i) = temp(2);
end

plot(x4,y4, 'g');
hold on
%backward translation
x5 = zeros(1,length(x1));
y5 = zeros(1,length(y1));
for i = 1:1:length(x2)
    Tb = [1,0,ref1(1);0,1,ref1(2);0,0,1];
    temp = Tb*[x4(i);y4(i);1];
    x5(i) = temp(1);
    y5(i) = temp(2);
end
plot(x5,y5,'g')
hold on
xlabel('X')
ylabel('Y')
title('CAD Operations')
