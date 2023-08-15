%% problem 1
% define the function being used as variable f
f = @(x) 10*pi*(x^2)*sin(x*2);
%define the x and y arrays with the different steps

% dx = 5
x1 = -10:5:10;
y1 = zeros(1,length(x1));
for i = 1:1:length(x1)
    y1(i) = f(x1(i));
end


% dx = 1
x2 = -10:1:10;
y2 = zeros(1,length(x2));
for i = 1:1:length(x2)
    y2(i) = f(x2(i));
end

% dx = 0.1
x3 = -10:0.1:10;
y3 = zeros(1,length(x3));
for i = 1:1:length(x3)
    y3(i) = f(x3(i));
end

% dx = 0.01
x4 = -10:0.01:10;
y4 = zeros(1,length(x4));
for i = 1:1:length(x4)
    y4(i) = f(x4(i));
end

figure(1);

tiledlayout(2,2);
nexttile
plot(x1,y1);
title('-10 < x < 10, dx = 5')
xlabel('x')
ylabel('y')

nexttile
plot(x2,y2);
title('-10 < x < 10, dx = 1')
xlabel('x')
ylabel('y')

nexttile
plot(x3,y3);
title('-10 < x < 10, dx = 0.1')
xlabel('x')
ylabel('y')

nexttile
plot(x4,y4);
title('-10 < x < 10, dx = 0.01')
xlabel('x')
ylabel('y')