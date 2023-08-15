%% Demo and notes from Week 4 Tuesday lecture




%% Conditional Statements %%



%% Relational Expressions

% Relational expressions give conceptually either true or false results.

% In MATLAB, a logical 0 is equivalent to false, a logical of any non-zero value is equivalent to true.

% Relational expressions can involve relational operators ( <, >, >=, <=, ==, ~=) and logical operators (&, |, &&, ||, xor, ~)




%% Order of Operations
% 1 Parenthesis (highest)
% 2 Transpose / Exponential
% 3 Logical NOT
% 4 Multiplication / Division
% 5 Addition / Subtraction
% 6 Relational operators (>, <, etc.)
% 7 Logical AND
% 8 Logical OR (lowest)


%% ex. Operator Precedence

student = 'n';

student == 'y' || 'Y';
% ans = 1

student == 'y' || student == 'Y'
% ans = 0





%% Basic IF statements

% general form:

%   if condition
%       action;
%   end

% A condition is an expression that is logically true or false.
% An action is the statement which is executed if the condition is true.


%% Conditions

% A condition can be simple : x>3
% Or can be complex: student ==  y’ || student == ‘Y’

% Multiple degrees of freedom:

% student = true; senior = false; military = false; child = false; 
% any([student, child, senior, military])

% Logical expression is important: correct? complete?


%% Actions

% Action can be a single statement: 
%   y = sqrt(x);

% Or multiple statements:
%   y = my_stat(x);
%   my_plot(x,y); 
%   disp(y);


%% ex. function my_sqrt.m computes the square root of an input number 

% found in week 4 folder

% Conditions:
% 1. Give the answer when the input number is greater or equal to zero.
% 2. Set the output to be NaN if the number is negative.

%%%%
%function [outvar] = my_sqrt(numA)
%MY_SQRT: takes the sqrt of a number or returns NaN if the number is
%negative
% explanation

%outvar = sqrt(numA);

%if numA < 0 
    %outvar = NaN;
%end % if on line 8

%end % function my_sqrt
%%%%

my_sqrt(-4)
% ans = NaN
my_sqrt(4)
% ans = 2





%% If... else... statement

% General form:
%   if condition 
%       action 1;
%   else
%       action 2;
%   end

% Action 1 is executed if condition is true  
% Action 2 is executed if condition is false



%% ex. New my_sqrt function
%%%%
% function [outvar] = my_sqrt(numA)

%if numA < 0 
%    outvar = NaN
%else 
%    outvar = sqrt(numA);
%end % if on line 15

%end % function my_sqrt
%%%%


my_sqrt(0)
my_sqrt(-4)
my_sqrt(4)




%% Nested if.. else.. statement

% General form:

%   if condition 1
%       action 1;
%   else
%       if condition 2
%           action 2;
%       else
%           action 3;
%       end
%   end

% Number of if = number of end
% indent for clarity


%% ex. piecewise.m

% write a function piecewise to evaluate the value of y for an input number
% x using the following conditions
%   y = x for x < -1
%   y = x^2 for -1 <= x <= 1
%   y = 3x for x > 1

% consider the conditions: 3 conditions

% consider different algorithms:
%   3 separated if statements?
%   if... else... statement?
%   nested if statements?

%%%% 
%function [y] = piecewise(x)
%PIECEWISE Summary of this function goes here
%   Detailed explanation goes here

%if x < -1 
%    y = x;
%else
%    if -1 <= x && x <= 1
%        y = x^2;
%    else 
%        y = 3*x;
%    end % if on line 8
%end % if on line 5


%end % function

vector_ans = [piecewise(-2) piecewise(-1) piecewise(0) piecewise(1) piecewise(2) piecewise(3)]





%% if ... elseif ... statement

% requires else to be conditional

% general form:

%   if condition 1
%       action 1;
%   elseif condition 2
%           action 2;
%   elseif condition 3
%           action 3;
%   ...
%   else
%       action n;
%   end



%% ex. piecewise.m with elseif form

%   y = x for x < -1
%   y = x^2 for -1 <= x <= 1
%   y = 3x for x > 1

%%%%
% function [y] = piecewise(x)
% 
% if x < -1
%     y = x;
% elseif x <=1
%     y = x^2;
% else
%     y = 3*x;
% end % line 20
% 
% end % function
%%%%

vector_ans = [piecewise(-2), piecewise(-1), piecewise(0), piecewise(0.5), piecewise(1), piecewise(2), piecewise(3)]





%% ex. cmy_color.m
% ouptput color resulted from mixing the primary colors

% function header: function color = cmy_color(cmy)

% Input: cmy is a 3-element vector with values of 0 and 1 denoting the 3 primary colors (cyan, magenta, yellow).
% Output: color is a string denoting the resulting color.

% we will use if... elseif...

%%%% see cmy_color.m

vector_ans = [cmy_color([0 1 1]), cmy_color([0 0 1]), cmy_color([2 0 1]), cmy_color([0 0 0])] % red, yellow, invalid
