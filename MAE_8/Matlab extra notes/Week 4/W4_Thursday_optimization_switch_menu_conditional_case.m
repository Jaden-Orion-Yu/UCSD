%% Demo and notes from week 4 Thursday lecture




%% Conditional Statements Continued %%


%% ex. cmy_color_nested

% doing cmy_color but with nested if. In general, nested if is faster and
% more efficient because it will totally skip over logical tests if the
% values do not match at the start

% see "cmy_color_nested.m" in week 4 folder

vector_ans = [cmy_color_nested([1 1 1]) cmy_color_nested([0 1 1]) cmy_color_nested([0 1 0]) cmy_color_nested([0 2 3]) cmy_color_nested([0 0 1])]



%% optimization

%% ex. consider true/false
clear;
clc

if 2
    disp('ew');
end

if 0 
    disp('ew');
end

if 'a'
    disp('ew');
end
    
if -1:1 % sees [-1 0 1] as T F T; will treat it as a false since some part of it is false (IMPLICIT ALL)
    disp('ew');
end


%% MATLAB treats any non-zero number as a logical true, and any zero as a false

% this means we can remove the == 1 in our function if statements because
% we already initially made sure all values are 0 or 1








%% Switch Statements

% general form

%   switch switch_expression
%       case case_epression_1
%           action 1;
%       case case_expression_2
%           action 2;
%       case case_expression_3
%           action 3;
%       ...
%       otherwise
%           action other;
%   end


% rules

% 1. Compare switch_expression to case_expression, one by one.
% 2. If a match is made, a corresponding action will be executed and the switch statement is completed.
% 3. If no match is found, and otherwise block is present, action other will be executed. Otherwise block is optional.
% 4. Switch expression should be a scalar or a character vector (e.g. a string).



%% ex. my_schedule.m

% Write a function my_schedule.m to output the class schedule for each day of the week.
% Mon-Wed-Fri: MAE 3
% Tue-Thu: MAE 8
% Sat-Sun: no class
% Function header: function [class] = my_schedule(day)
% Input: day is an all-lower-case string indicating the first three letters of the day.
% Output: class is a string indicating the class.

% see "my_schedule.m" in week 4 folder
clear;
clc;

my_schedule('mon')      % MAE 3
my_schedule('thurs')    % MAE 8
my_schedule('sat')      % no class
my_schedule('Wed')      % invalid input




%% Menus and nested switch

%% ex. menu function
clear;
clc;


class = menu('What is your class', 'freshman', 'sophmore', 'junior', 'senior', 'other'); % creates 5 choices and outputs a number for the choice
disp(class);

%% ex. pizza_menu.m

clear;
clc;

pizza_menu;





