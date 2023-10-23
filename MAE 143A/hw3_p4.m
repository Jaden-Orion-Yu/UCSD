clear;clc

syms s;

num = s^3 + 2*s^2 - 4*s + 8;

den = s^3 + 5*s^2 + 10*s + 8;

r_num = roots([1,2,-4,8])
r_den = roots([1,5,10,8])

H = ilaplace(num/den)
