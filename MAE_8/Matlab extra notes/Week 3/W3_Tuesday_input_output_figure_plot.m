%% Demo and notes from Week 3 Tuesday lecture

%% notes from hw3





%% How to get input from a user

%% ex.

name = input('What is your name? ');    % returned input MUST be input as a string or else Matlab will try to find a corresponding variable
age = input('how old are you? ');       % a number can be input because matlab does not see things starting with numbers as variables


%% ex. force user entry to be type string

name = input('What is your name? ','s');    % the 's' forces the input to be a string and no longer requires the user to specify
age = input('How old are you? ','s');       % this stores the number as a string instead of a integer or double





%% Output information to user

% use function disp to print unformatted output to screen
% Function disp prints values to screen without assigning value to variable ans.



%% ex. disp
disp('hello');
disp('hello my name is Thomas');
matA = randi(10, 3, 3);
disp(matA);



%% Use function fprintf to print formatted outputs to screen.
% Syntax: fprintf( format_string, variable_name)
% Format_string is where you assign the format of the output.
% In a format string, use a place holder, denoted by %, to specify where the value of the variable to be printed.

% put \n at the end of the string to start a new line

% Use place holder and conversion characters to specify the format of the output:
% %d or %i integer
% %f floating point number (decimal number)
% %c single character
% %s string


%% ex. 

name = 'Peter'; age = 70;
fprintf('%s is %d years old.\n', name, age);       % '%s' is a "placeholder" for a string, '%d' is a placeholder for integer


%% ex. field width
% A field width in the place holder specifies how many character total are to be used in printing.
% '%3d' use 3 characters to print an integer
% '%6.2f' use 6 characters to print a real number including the decimal points and
% 2 decimal digits

fprintf('%s is %6.3f years old.\n', name, age);
fprintf(['%10s is %6.3f years old.\n'], name, age); % allocates 10 spaces for this first string
fprintf('%20s is %010.3f years old.\n', name, age); % puts a zero in front of the number instead of white space

fprintf('%7.2f\n', 100.257);
fprintf('%5.2f\n', 100.257);        % specifies 5 places but needs 6 to include two decimal places; 
                                    % instead will show minimum size required to fill requirements


%% ex. Control characters

% Special characters used in printing with fprintf
% \n new line
% \t tab
% \b backspace
% \\ backslash
% %% percent
%  '' single quote


name = 'Peter'; age = 40;
fprintf('%s is %5.2f years old.\n', name, age);     % \n creates a new line after string
fprintf('%s is %5.2f years old.\b\n', name, age);   % \b executes a backspace on the period before moving to the next line
fprintf('%s is %5.2f years old.\b\b\n', name, age);


fprintf('30%% of the class will get an A\t.\n');    % \t tabs the period

format long
pi
fprintf('%1.55f\n', pi) % Matlab only stores 48 digits of pi




%% Use function sprintf to print a string variable
% Function sprintf creates a new variable with a character type in the workspace.

%% ex. 

my_pi = sprintf('%50.48f\n', pi) % creates a string rather than printing to screen like fprintf




%% ex. matrix outputs

matA = randi(10,3,4);
fprintf('%5.2f ', matA);                        % creates vector of matA with the desired format
fprintf('%5.2f %5.2f %5.2f %5.2f \n', matA);    % creates matrix of matA via formatted placeholders









%% FIGURES AND PLOTTING

% functions 'plot' and 'bar'

% figure:          creates a new empty figure window 
% clf:             clear a figure window
% hold (on/off):   a toggle that freezes the current graph so that the new plots can be superimposed on the current one.
% legend:          displays strings into in a legend box 
% grid (on/off):   displays grid on a graph
% box (on/off):    wrap a box around the figure

% axis:            axis control, keywords: tight, equal
% axis([xmin xmax ymin ymax]): set limit for the axes
% xlabel:          create label for x-axis
% ylabel:          create label for y-axis
% title:           create title for figure

% GCA ---> Very important - input in to command window to look at plot
% properties
%% ex. 

x = -10:0.1:10;
y1 = sin(x);
y2 = cos(x); 

figure(1); hold on; % hold allows multiple plot functions
plot(x,y1, '--om', 'MarkerSize', 10); % must put both functions into single plot to show in same figure without hold function
plot(x, y2, '-kd', 'MarkerfaceColor', 'b');
xlabel('x');
ylabel('f(x)');
title('plot demo');
legend('sin(x)', 'cos(x)', 'Location', 'Southwest');
axis([-15 15 -2 2]);    % OR
% axis tight;           % finds max y and max x and uses that as the axis limits  OR
% axis equal;           % equalizes axes

set(gca, 'FontSize', 20);
set(gca, 'Xtick', -10:2:10, 'Ytick', -1:0.2:1); % changes xtick to be intervals of 2, ytick to intervals of 0.2

grid on;
box on;



% 3D plot

figure(2); 
plot3(x,y1,y2, '-rs', 2*x, 2*y1, 2*y2, '--bo', 'MarkerSize', 15);
xlabel('x');
ylabel('y1');
zlabel('y2');
title('3D plot demo');
box on; grid on;
%view(2) % used to see 3D graph in 2D
