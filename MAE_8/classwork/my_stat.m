function [min_val,max_val] = my_stat(x)
%UNTITLED Summary of this function goes here
%   MY_STAT: takes in matrix v and return the global min and max values
%   call format [min_val, max_val] = my_stat(x); 
min_val = min(x(:));
max_val = max(x(:));


end %function my_stat

