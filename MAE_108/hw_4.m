clear;clc;

%% problem 2
% A) Binomial distribution
p_survive_a1 = binocdf(95,100,.9) - binocdf(83,100,0.9);
p_survive_a2 = binocdf(85,100,.9);