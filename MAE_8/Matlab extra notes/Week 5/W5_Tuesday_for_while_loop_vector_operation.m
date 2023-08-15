%% Demo and notes from Week 5 Tuesday lecture


%% NOTES from hw5


%% review of pizza_menu.m (week 4 folder)

pizza_menu



%% CHAPTER 5 NOTES %%


%% For loop
% a for loop is used to perform actions for a specific number of times

% general form:

%   for loopvar = range
%           action
%   end

% loopvar is the loop or iterator variable, usually named k, l, m, n, etc.



%% ex1. 

for n = 1:10 
    disp('hello');      % performs this action for every value of n (displays hello 10 times)
end


%% ex2. 

for n = 1:2:10
    disp('hello');      % displays hello 5 times
end

% the number of times the code is repeated is the same as the number of
% elements in the loop variable


%% ex3.

for n = 96:100
    disp('hello');      % displays hello 5 times *** value of n does not matter, only # of elements
end


%% ex4. 

for n = -10:0
    disp('hello');      % displays hello 11 times
end


%% ex5. 

for n = 'test'
    disp('hello');      % displays hello 4 times (4 pieces in test character type)
end


%% ex6.

for n = "test"
    disp('hello');      % displays hello 1 time (1 piece in test string type)
end


%% ex7. 

vecA = 1:5;

for n = 1:length(vecA)      % 1:5 ---> Uses the initial range of the loopvar rather than the updated range (# of iterations is fixed)
    disp('hello');
    vecA = zeros(1,1000);   % vecA has 1000 elements now
end


%% ex8. spending (my way)

clear all; clc

money = 5:-0.5:0;
day = 1;

for n = money
    day = day + 1;
    fprintf('day: %i, balance: $%4.2f\n', day, n)
end

%% professor's way

clear all; clc

day = 1;
init_balance = 5;
spend = 0.50;

for balance = init_balance:-spend:0           %1:init_balance/spend
    fprintf('On day %d, my balance is $%4.2f. \n', day, balance);
    day = day+1;
end


%% ex9. Vector Operations
% use for loop to create a vector V:
% V = [1 4 9 16 25 36 49 64 81 100]
% use for loop to compute sum of all elements in the vector
% use for loop to compute difference between two consecutive elements in
% the vector
% use for loop to compute product of all elements in the vector

clear all; clc

for n = 1:10
    V(n) = n^2;
end
V;
 
sum_temp = 0;
for n = 1:length(V)
    sum_temp = sum_temp + V(n);
end
sum_temp;

for n = 1:length(V) - 1
    diff_V(n) = [V(n+1) - V(n)];
end
diff_V;

prod_temp = 1;
for n = 1:length(V)
    prod_temp = prod_temp*V(n);
end

prod_temp;










%% Pre-allocation

%% without pre-allocation
clear all; clc
tic;
for n = 1:1e8
    a1(n) = n;
end
t1 = toc                    % roughly 6.7s

%% with pre-allocation
clear all; clc
tic;
a1 = zeros(1, 1e8);  % pre-allocate with 0's
for n = 1:1e8
    a1(n) = n;
end
t2 = toc                    % roughly 0.3s


t1/t2                       % ratio of ~22




%% Nested For loop

% nested for loops:

%   for loopvar1 = range1           <--- outer loop
%       actions
%       for loopvar2 = range 2      <--- inner loop
%           actions
%       end
%       actions
%   end


%% ex1. operation count
% how many times are the strings 'hello', 'hi', 'bye' display?      2 hello, 4 hi, 2 bye
% order of display?         hello hi hi bye hello hi hi bye

for n = 1:2
    disp('hello');
    for m = 1:2
        disp('hi');
    end
    disp('bye');
end



%% ex2. funH.m

clear all; close all; clc;

%a create function H and plot
x = -2:0.2:2;
y = -1:0.2:1;

for n = 1:length(x)
    for m = 1:length(y)
        H(n,m) = exp(-(x(n)^2+y(m)^2));
    end
end

figure(1)
surf(x,y,H'); shading interp; % H must be same dimensions as x,y -- check doc on "surf" function
xlabel('x');
ylabel('y');
zlabel('H(x,y)');
title('2D surface plot');

%b find average along x direction (average of every column in H)


Xavg = zeros(1, length(y));
for m = 1:length(y)
    sum_temp_x = 0;
    counter_x = 0;
    for n = 1:length(x)
        sum_temp_x = sum_temp_x + H(n, m);
        counter_x = counter_x + 1;
    end
    Xavg(m) = sum_temp_x/counter_x;
end

Xavg;
Xavg == mean(H, 1);


%c average along Y direction (average of every row in H)


Yavg = zeros(length(x), 1);
for n = 1:length(x)
    sum_temp_y = 0;
    counter_y = 0;
    for m = 1:length(y)
        sum_temp_y = sum_temp_y + H(n,m);
        counter_y = counter_y + 1;
    end
    Yavg(n) = sum_temp_y/counter_y;
end

Yavg;
Yavg == mean(H, 2);


%d
sum_temp =0;
counter = 0;
for n = 1:length(x)
    for m = 1:length(y)
        sum_temp = sum_temp + H(n,m);
        counter = counter + 1;
        
    end
end

Havg = sum_temp/counter;








