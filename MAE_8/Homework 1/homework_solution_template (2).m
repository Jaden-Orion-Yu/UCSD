%% MAE 8 Homework Solution Tempate
% 
% Please name your file hwX.m where the X is the homework number.
%  For example homework 1 should be named hw1.m
%
% All homework assignments need to be uploaded to CANVAS before 10 pm Friday
%  the week they are due.  No late assignments will be accepted.
%
% The format for reporting the answers to the assigned problems is given 
%  for both single and multi-part problems.
%
% Make sure you copy your .m file to a seperate directory and re-run them 
%  to ensure that your script runs and your answers have not changed.
%
% If your script does not run, or your answers are not reported in the 
%  correct format, you will be given no credit.

%% The following commands are required at the very top of the homework file
clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

%% Student name, ID number, and homework_number are required
name = 'AAAA AAAA';
id = 'A00000000';
hw_num = 1;

%% This is how to report your answer for a single part question
% Problem 1: 
% Compute sine of 180 degrees and put the answer into p1.
p1 = sind(180);

%% This is how to report your answer for a multi-part question
% Problem 2: 
% (a) Compute natural log of 2pi and put the answer into p2a.
p2a = log(2*pi);

% (b) Round 2pi to nearest integer toward zero and put the answer into p2b.
p2b = fix(2*pi);

% (c) Compute the mean value of vector [1,2,3] and put the answer into p2c.
p2c = mean(1:3);

% (d) If the frictional drag continues to increase, what happens to the 
% velocity? Write your answer in p2d.
p2d = 'The velocity will decrease in time.';
