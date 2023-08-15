clear all; 
close all; 
clc;         
format long; 

name = 'Jaden McDonald Peltier Yu';
id = 'A15960227';
hw_num = 5;

%% problem 1
p1a = evalc('help piecewise2d');
p1b = piecewise2d(pi, pi);
p1c = piecewise2d(pi, -pi);
p1d = piecewise2d(-pi, pi);
p1e = piecewise2d(-pi, -pi);
p1f = piecewise2d(0, 0);
p1g = piecewise2d(0, pi);
p1h = piecewise2d(0, -pi);
p1i = piecewise2d(pi, 0);
p1j = piecewise2d(-pi, 0);



%% problem 2
p2a = evalc('help rgb_color');
p2b = rgb_color([1 1 0]);
p2c = rgb_color([0 1 1]);
p2d = rgb_color([1 0 1]);
p2e = rgb_color([1 1 1]);
p2f = rgb_color([1 0 0]);
p2g = rgb_color([0 1 0]);
p2h = rgb_color([0 0 1]);
p2i = rgb_color([0 0 0]);


%% problem 3
p3a = evalc('help days_in_month');
p3b = days_in_month('jan', 0);
p3c = days_in_month('apr', 0);
p3d = days_in_month('aug', 1);
p3e = days_in_month('oct', 0);
p3f = days_in_month('nov', 1);
p3g = days_in_month('feb', 0);
p3h = days_in_month('feb', 1);
p3i = days_in_month('Dec', 0);
    

%% problem 4
p4a = evalc('help assign_grade');
load('studentA.mat'); [p4b, p4c] = assign_grade(homework, midterm, project, final);
load('studentB.mat'); [p4d, p4e] = assign_grade(homework, midterm, project, final);
load('studentC.mat'); [p4f, p4g] = assign_grade(homework, midterm,project, final);    


%% probem 5
p5a = 0;
for i = 1:100
    p5a = p5a + (1/((i^2) + i));
end

p5b = 0;
for m = 0:50
    for n = 0:50
        p5b = p5b + (1/((3^(m+n))));
    end
end

p5c = 0;
for m = 0:50
    for n = 0:m
        p5c = p5c + (1/((3^(m+n))));
    end
end

p5d = 0;
for l = 1:50
    for m = 1:30
        for n = 1:30
            p5d = p5d + 1/( (2^l) * (2^m) * (2^n) );
        end
    end
end

p5e = 1;
for n = 1:50
    p5e = p5e*((4*(n^2))/(4*(n^2)-1));
end
%% problem 6
survey  
p6 = evalc('type("survey.dat")');


