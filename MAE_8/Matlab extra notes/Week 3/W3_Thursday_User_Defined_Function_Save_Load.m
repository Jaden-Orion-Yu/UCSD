%% Demo and notes from Week 3 Thursday lecture

%% notes from hw3



%% File input/output

%% ex.
%matA = randi(10,3,3);
%save('my_matrix.dat','matA','-ascii');  % saves matA to file in ascii format, keeps name and contents of variable
%save('my_matrix.mat','matA','-mat');    % saves in binary format, keeps only contents of variable
%ls  % looks for files
%load('my_matrix.dat')                   % loads file 
%load('my_matrix.mat')                   
%whos


%% ex.

%matB = randi(10, 3, 4);
%save('my_matrix.dat','matB','-ascii','-append')     % appends file with matB
%save('my_matrix.mat','matB','-mat','-append') 
%load('my_matrix.dat')                               % file must be simple, organized data. no mismatched rows or columns or whatnot
%load('my_matrix.mat')
%whos


%% User Defined Functions

% after hitting new > function

%function [min_val, max_val] = my_stat(X)
% MY_STAT: takes in matrix X and return the global min and max values
% call format: [min_val, max_val] = my_stat(X)

%min_val = min(X(:));
%max_val = max(X(:));


%end % function my_stat - find the saved version in Week 3 folder

help my_stat
matA = randi(10, 3, 4)
[min_val, max_val] = my_stat(matA) % using this user defined function

%% ANOTHER USER DEFINED FUNCTION my_plot IN FOLDER Week 3

help my_plot
x = -10:0.1:10;
y = sin(x);
label_x = 'x';
label_y = 'f(x) = sin(x)';
title_string = 'Plot Demo using UDF';
my_plot(x, y, label_x, label_y, title_string)

