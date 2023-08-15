%% demo and notes from Thursday lecture

%% notes from hw1
% Make sure to use semicolons to keep command window clean

% Whether or not you separate answers/variables into different lines or
% keep them in the same line is solely based on space saving/convenience

% Single quotations marks signify CHARACTERS and double quotes signify
% STRINGS. Use the "class" command to check type of variable.

% ASCII character info found in week 0 notes. Upper letters before Lower. Letters
% have static integer offset of 32 in counting system. ASCII characters for
% numbers stored as char rather than single/double.

%------

clear all;
close all;
clc;
format long;

% Chapter 2 Topics
% Vectors and matrices
% Vectors and matrices as function arguments



%% Row Vectors

%% ex. store an integer # 1-5 in vecA
vecA = [1, 2, 3, 4, 5] % commas not required
vecB = [1 10 20 30]

%% ex. start:stride:end === first number:jump distance:final number
vecA2 = 1:5 % equivalent to vecA
vecA3 = 1:10 % all numbers between 1 and 10
vecB2 = 0:2:10 % all even numbers between 0 and 10
vecB3 = 1:3:5
vecB4 = -10:2:0
vecB5 = -10:-2:0 % empty; does not work
vecA5 = 0:-2:-10

%% ex. using linspace(a, b, n) to create vector with n elements between a and b with linearly equal space
vecA = linspace(0, 10, 10)
vecB = linspace(0, 10, 11)

%% ex. using length, numel, and size to access mension of vectors and matrices
vecA = 1:3:1000
length(vecA)
numel(vecA)
size(vecA)

%% ex. combining two short vectors together "concatanate"
vecA = 1:5
vecB = 6:10
vecC = [vecA vecB]
vecC2 = [vecA vecB vecA]

length(vecC2)
vecC2(3:5) % displays this range of numbers in existing vector
vecC2(2:2:4) % start:stride:end
vecC2([1,10])
vecC2([1, 13])
vecC2([11, 13]) % displays the 11th and 13th number in the vector
vecC2([13, 11])
vecC2([1, end])
 
vecC2(10) = 0 % changes the 10th number to be a 0
vecC2(end) = 15 % changes the last number to a 15
vecC2(1:2:5) = 0 % changes the first, third, and 5th numbers into a zero
vecC2(1:4) = [] % removes the first 4 numbers in the vector
vecC2(end) = [] % removes the last number from the vector





%% Column Vectors

%% ex. initial column vectors

vecA = [1; 2; 3; 4; 5] % this vector acts as the first column
length(vecA)
numel(vecA)
size(vecA)


%% ex. different way to make column vector via row transposition
vecA = 1:5
vecA = vecA' % apostrophe transposes matrix






%% Matrices
% collection of column vectors

%% ex. initial matrices

matA = [ 1, 2, 3, 4, 5; 6, 7, 8, 9, 10,] % semicolon separates rows, comma separates columns
matB = [1:5; 6:10] % cleaner
matC = [1:5; 6:11] % dimensionally inconsistent


%% ex. additional matrix functions
% zeros(m,n) fills a mxn matrix with zeroes

matA = zeros(10,20)
matA2 = zeros(5) % creates square 5x5 matrix

% ones(m,n): fills a m x n matrix with values of 1

matB = ones(10,20)

% rand(m,n): fills a m x n matrix with random values in the open interval (0,1)

matC = rand(5,10) % you can use intX to store integer values only and with intX type rather than double
matC2 = int8(matC)
matC3 = rand(5,10,4) % creates 4 matrices

% randi([imin,imax],m,n): fills a m x n matrix with random integers in the closed interval [imin,imax]

matD = randi([0, 12], 5, 10) 


%% ex. dimensions of a matrix
% still uses length, numel, size and also end

matA = randi(10,4,5) % max # = 10, 4 rows, 5 columns
length(matA) % returns larger dimension
numel(matA) % returns total elements in matrix
size(matA) % full dimensions
matA(end) % value of last entry

%% ex. elements of the matrix

matA = randi(10,4,5)
matA(3,2) % identify 3rd row, 2nd column of matA
matA(1,1)
matA(4, end) % 4th row, last column
matA(end, 3) % last row, 3rd column

matA(3,:) % all elements on 3rd row
matA(:,4) % all elements iun 4th column
matA(end,:)


%% ex. more complicated submatrices

matA = randi(10,4,5)
matA(1:2,1:2) % 1 through 2 of rows, 1 through 2 of columns
matA(1:2:4, 1:3)
matA(1:2:end,1:2) % includes stride so skips numbers

