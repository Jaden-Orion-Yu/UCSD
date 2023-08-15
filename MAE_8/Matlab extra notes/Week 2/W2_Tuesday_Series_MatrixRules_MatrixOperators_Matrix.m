%% demo and notes from Week 2 Tuesday

%% notes from hw2
% use ".*" to multiply the corresponding elements in two different vectors
% or matrices. Putting a "." in front of a standard operator makes it an
% element-wise operator.

% use "find(A==n)" to find which element corresponds to the entry n

% use "cumsum" to find cumulative sum of vector/matrix - "sum" to find only
% final sum of elements

% use "rot90" to rotate matrix or vector 90 degrees

% use "trace" for the sum of the diagonal of a matrix

% use "repmat" to repeat a matrix (repmat(A, m, n))

% use "format rat" to display decimals as fractions

% use "prod" to find the product of elements of a vector

% use "fliplr" to flip a matrix from left to right, "flipud" for top to
% bottom



%% Matrices Continued
% indexes

% scripted indexes - used to denote positon of elements by row and column

% linear index - used to denote position of elements along columns

% 3D Matrices - stacked vertically

%% ex. scripted indexing (row, column; two dimensions)
matA = randi(10,4,5);
% pick up first and third rows, first and third columns
matA([1,3], [1, 3]);
% pick up first through 4th row and 2nd through 4th column
matA(1:4, 2:4);
matA(end-1:end, end-1:end);
matA(end,:); % last row, all columns


%% ex. linear indexing (total number; single dimension)
matA = randi(10,4,5)
matA(1); % choosing a single element of mat A counts down and then to the left to choose the correct value 
matA(7);
matA(end-1:end); % acts as 19, 20 - returns the last 2 numbers linearly
matA(1:3:end) % sees this as [1, 4, 7, 10, 13, 16, 19] and returns corresponding entries


%% ex.  3D Matrix
matA = randi(10,3,3,2) % outputs bottom and top stack of this 3D matrix
matA(10) % returns the first entry of the second stack - linear indexing
matA(end) % returns last entry of second stack - linear indexing


%% ex. extending matrices

matA = [10:15; 20:25]
matA(3,:) = 30:35 % adds 3rd row of elements 30 to 35
matA(:, 7) = [16;26;35] % adds 3 elements to a new column on all rows
matA(:, 4) = [] % removes the column of 13, 33, 35

% adding matrices to matrices
matB = [matA, matA]
matB = [matA; matA]

% back to matA
matA(2) = [] % emptying the second linear index - removes a necessary piece of the second row and after this command
                % it will only have 5 in the second row meaning it must
                % change the matrix to be one-dimensional
matA(2) = 20 % this does not fix it
matA(2) = []



%% ex. modifying matrices

% reshape
matA = randi(10,3,4)
matB = reshape(matA, 4, 3) % reshapes matA to be 4 rows and 3 columns - in doing so the linear index 
                            % determines the order and stays the same after
                            % the reshape
%matC = reshape(matA, 2, 5) % does not work because there are 12 elements in matA but this only has 10

% fliplr - flip a matrix from left to right (mirror image)
fliplr(matA)

% flipud - flip a matrix from up to down
flipud(matA)

% rot90 - rotate matrix 90 degrees (matrix, number of rotates)
rot90(matA, 1)

% repmat - repeat matrix into m x n matrix (matrix, m, n)
repmat(matA, 2, 1)







%% Vectors as Function Inputs
% min/max - min/max value of matrix/vector; these act COLUMN-WISE
% sum/prod - sum/product of elemnts in a vector
% diff: returns a forward difference between two consecutive elements in a vector.
% cumsum / cumprod: returns cumulative sum / prod of elements in a vector.


%% ex. for vectors

vecA = 1:10
sum(vecA)
prod(vecA)
min(vecA)
max(vecA)
cumsum(vecA)
cumprod(vecA)

%% ex. for matrices

matA = randi(10,3,4)
min(matA) % takes minimum of each column
min(min(matA)) % using minimum twice finds overall minimum
min(matA(:)) % find min using linear indexing
sum(matA) % sum of each column
sum(sum(matA))
sum(matA(:))
prod(matA)
prod(prod(matA))
prod(matA(:))
% basically, all of these functions initially do their calculation column
% wise unless otherwise specified





%% Matrix rules

% multiplication

% To multiply two vectors / matrices, inner dimensions must agree.

% A (m x n) * B (k x l): n and k are inner dimensions and must be equal in order to compute the product. 
% The resulting product has the outer dimensions m by l.



% element wise operators

% put "." in front of standard operators like "*" or "/". Requires matrices
% to have the same dimensions





%% Series

%% ex. 1 + 1/2 + 1/4 + 1/8 + 1/16...

n = 0:99
format rat
series = (1/2).^n
sum(series)
format long




%% Identity matrix

% identity matrix is a square matrix with a diagonal of 1s and all other
% numbers 0s

% use "eye(n,m)" to create an identity matrix or "eye(n)" for a square nxn
% matrix

% a matrix multiplied by an identitiy matrix of the same dimensions will
% always return the same matrix


%% Inverse of a matrix

% A^-1 * A = I - a matrix left multiplied by its inverse returns the
% itentity matrix

