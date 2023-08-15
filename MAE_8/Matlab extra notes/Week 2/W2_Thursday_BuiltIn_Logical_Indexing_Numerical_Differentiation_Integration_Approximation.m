%% demo and notes from Thursday lecture

%% notes from hw2
% use ".*" to multiply the corresponding elements in two different vectors
% or matrices. Putting a "." in front of a standard operator makes it an
% element-wise operator.

% use "find(A==n)" to find which element corresponds to the entry n. Other
% operators work as well

% use "cumsum" to find cumulative sum of vector/matrix - "sum" to find only
% final sum of elements

% use "rot90" to rotate matrix or vector 90 degrees

% use "trace" for the sum of the diagonal of a matrix

% use "repmat" to repeat a matrix (repmat(A, m, n))

% use "format rat" to display decimals as fractions

% use "prod" to find the product of elements of a vector

% use "fliplr" to flip a matrix from left to right, "flipud" for top to
% bottom


%% Solving systems of Linear equations

%% ex. inverse vs backslash
A = [1 1; 2 1]
b = [3;1]

x = inv(A)*b 

x1 = A\b % optimal method; faster than inverse



%% Logical operators on matrices
% use single & or | for for matrices, otherwise works similarly except for
% outputs, which are vectors

% sees non-zero number as logical true, zero as logical false

%% ex. various operators with matrices
vecA = randi(10,1,6)
vecB = randi(10,1,6)

vecA > vecB % outputs logical array for each element; another vector
vecA & vecB % outputs logical array for each element
vecA | vecB

vecA == 8
vecA ~= 8

vecA > 5 & vecA < 3 % never possible


%% ex. Built-in Logical functions
% all - returns logical true if ALL elements of a vector are nonzero
% any - returns logical true if ANY element of a vector are nonzero
% find - returns the linear indices of nonzero elements

vecA = [7 8 8 4 7 2]
all(vecA > 0)
all(vecA == 8)
vecA == 8
any(vecA == 8)
find(vecA == 8) % returns linear index number of entries that satisfy the logical expression


%% ex. matrix and built in logical functions

matA = randi([0,100], 15, 15)
any(matA == 15)             % identifies columns with 15s in them
any(any(matA == 15))        % runs for entire matrix rather than per column
find(matA == 15)            % returns linear index of entries in the matrix that have a value of 15
[r, c] = find(matA == 15)   % returns rows and columns of the 15s in the matrix





%% Logical indexing

%% ex. vector
vecA = 1:10
vecA(vecA > 5) = 20     % changes every number with a value higher than 5 to be 20
vecA(vecA == 20) = 0    % changes all entries with value 20 to be 0
vecA(vecA == 0) = []    % changes all entries with value 0 to be empty

%% ex. matrix
matA = randi([0,10],3,4)
matA(matA == 7) = -7
matA(matA == max(max(matA))) = 100  % you need two maxes here since the single max will return a vector based on the columnwise result
matA(matA == max(matA(:))) = 200    % linear indexing to change the search for maximum to be for a vector also works






%% Differentiation

%% ex. APPROXIMATION from graph in lecture 5 pdf
% Given f(x) = x^2, compute f^ for x in range [0,1]. What is f’(x = 0.5)?
% Analytical solution: f’ = 2x and f’(x=0.5) = 1
% approximated derivative is (change in y/change in x)


x = 0:0.1:1;                        % the smaller the stride here, the more accurate the approximation becomes at the expense of extra resources
f = x.^2;
fprime = diff(f)./diff(x);          % this is the same as (change in f)/(change in x)
exact_soln = 1
numerical_soln = fprime(x == .5)    % finding the corresponding f(x) value when x = .5 - logical indexing and gives a single number
percent_err = abs(exact_soln - numerical_soln)/abs(exact_soln) * 100 




%% Integration

%% ex. APPROXIMATION from graph in lecture 5 pdf
% Given g(x) = 1-x^4, compute the integral of f for x in range [0,1].
% Analytical solution: 4/5

% Use trapezoidal area calculation with change in x and change in g as
% parameters

x = linspace(0,1,6)
g = 1-x.^4;
exact_soln = 4/5
dx = x(2) - x(1) % taking a small value of x to act as the change in x 

numerical_soln = dx*(0.5*(g(1)+g(end))+sum(g(2:end-1))) 

percent_err = abs(exact_soln - numerical_soln)/abs(exact_soln) * 100

fun = @(x) 1 - x.^4;            % "function handle" necessary for integral function
integral(fun, x(1), x(6))       % this gives the exact solution - technically not a numerical approximation but seems much easier (not taught in class)




%%
%%%% CHAPTER 3
%% 
% we are expected to create a program "access_rainfall" which will access
% data somewhere to show data of rainfall in certain years

