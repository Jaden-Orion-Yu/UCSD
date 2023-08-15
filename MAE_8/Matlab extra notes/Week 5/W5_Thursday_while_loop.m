%% Demo and notes from Week 5 Thursday lecture

% "sort" function - order numbers in vector in ascending order



%% While Loop

% while loop is a conditional loop.
% It is used when the number of repetition is not known ahead of time.

% General while loop form: 

%   while conditions
%       actions
%   end

% Execution
%First, the condition is evaluated.
% If it is logically true, the actions are executed (similar to if statement).
% Then condition is evaluated again, and if it is still true, execute action again.
% The repetition will stop when the condition is false.



%% ex1.

clear;clc;

n = 0;
while n < 3
    disp('hello');
    n = n+1;
end


%% ex2. savings

clear;clc;

balance = 0;
add_money = 1;
days = 0;

while balance < 500
    balance = add_money + balance;
    add_money = 2*add_money;
    days = days + 1;
    fprintf('balance = $%04.2f --- Most recent deposit = $%04.2f --- days = %d\n', balance, add_money/2, days);
end




%% Infinite while loop

% Condition has to change within the action block of the while loop.
% The condition must become false to avoid an infinite loop.
% It is important to identify the loop breaker in the action block.
% If infinite loop occurs by error, use 'Ctrl-C' to exit the loop.

clear;clc;

balance = 0;
add_money = 1;
days = 0;

while balance < 500
    balance = add_money + balance;      
    add_money = add_money-add_money;        % makes the while loop go infinitely
    days = days + 1;
    fprintf('balance = $%04.2f --- Most recent deposit = $%04.2f --- days = %d\n', balance, add_money/2, days);
end






%% ex3. input_positive

% Write a script input_positive.m to ask user to input a positive integer and make sure that the user has done it correctly.
% 2 conditions: integer? and positive?
% MATLAB default input is double, how to check for an integer input ?
% Action: repeat asking until both conditions are satisfied.


input_number = input('Enter a positive integer: ');

while input_number <= 0 || mod(input_number,1) ~= 0
    input_number = input(' Invalid input. Enter a positive integer: ');
end

%% ex4. using is functions

num = input('Enter a positive integer: ');

while isinteger(num) ~= 1 || num <= 0
    num = input('Invalid input. Enter a positive integer: ');
end


