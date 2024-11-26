clear;clc;

%% problem 2

p1a = normcdf(4,3.8,0.42426);
p1a = 1-p1a;
p1b = normcdf(4,3.8,0.47162);
p1b = 1-p1b;

%% problem 3

p2 = 1 - normcdf(0,100000,50000);

%% problem 4
p3b = 1- normcdf(100,60,17.3205);

p3d = norminv((1-0.0051253682), 60,17.3205); 