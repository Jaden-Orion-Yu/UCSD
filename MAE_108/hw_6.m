clear;clc;

%% problem 1
p1 = gamcdf(30, 5, 10);
p1 = 1 - p1;

%% problem 2
p2a = gaminv(.05,16,(1/.4));
p2b = 1-(((1-gamcdf((p2a+7), 16,2.5))/(1-gamcdf(p2a,16,2.5))));

%% problem 3

p3 = betacdf(0.8,2,3, "upper");

%% problem 4
p4 = betacdf(0.8,0.4,(.28/.3));
p4 = 1-p4;