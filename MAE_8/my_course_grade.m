clear; close all; clc;

%% Program description
fprintf('This program produces your minimum course grade for MAE 8 FA22.\n');
fprintf('Enter 0 for unknown grades such as your hw8 and final exam grades.\n\n')


%% Request user's inputs
for n = 1:8
    if n == 6
        request_string = sprintf('Enter your homework %d grade (0-105): ',n);
        hw{n} = input(request_string,'s');
        while ~isnumeric(str2double(hw{n})) || isnan(str2double(hw{n}))  ...
                || str2double(hw{n}) < 0 || str2double(hw{n}) > 105
            hw{n} = input(['Incorrect input.',request_string],'s');
        end
    else
        request_string = sprintf('Enter your homework %d grade (0-100): ',n);
        hw{n} = input(request_string,'s');
        while ~isnumeric(str2double(hw{n})) || isnan(str2double(hw{n}))  ...
                || str2double(hw{n}) < 0 || str2double(hw{n}) > 100
            hw{n} = input(['Incorrect input.',request_string],'s');
        end
    end
end

midterm = input('Enter your midterm grade (0-100): ','s');
while ~isnumeric(str2double(midterm)) || isnan(str2double(midterm)) ... 
        || str2double(midterm) < 0 || str2double(midterm) > 100
    midterm = input('Incorrect input. Enter your midterm grade (0-100): ','s');
end

project = input('Enter your project grade (0-100): ','s');
while ~isnumeric(str2double(project)) || isnan(str2double(project)) ...
        || str2double(project) < 0 || str2double(midterm) > 100
     project = input('Incorrect input. Enter your project grade (0-100): ','s');
end

final = input('Enter your final exam grade (0-100): ','s');
while ~isnumeric(str2double(final)) || isnan(str2double(final)) ...
        || str2double(final) < 0 || str2double(final) > 100
     final = input('Incorrect input. Enter your final exam grade (0-100): ','s');
end

% Convert inputs from string to numbers
for n = 1:8
    hw_score(n) = str2double(hw{n});
end
midterm = str2double(midterm);
project = str2double(project);
final = str2double(final);


%% Calculate course grade
% Drop two lowest homework grade:
hw_score = sort(hw_score);
hw_score(1:2) = [];
fprintf('\nDrop the two lowest homework grades. Here are your best six homework grades:\n')
fprintf('%d ',hw_score);
fprintf('\n\n');

% Compute total score
course_grade(1) = 0.25*mean(hw_score) + 0.2*project + 0.25*midterm+ 0.3*final;
course_grade(2) = 0.25*mean(hw_score) + 0.2*project + 0.55*final;
course_grade(3) = 0.25*mean(hw_score) + 0.25*midterm + 0.5*project;
fprintf('Using option # 1: 0.25*mean(homework) + 0.2*project + 0.25*midterm + 0.3*final,\n\t ');
fprintf('your course grade is %5.2f\n\n',course_grade(1));
fprintf('Using option # 2: 0.25*mean(homework) + 0.2*project + 0.55*final,\n\t ');
fprintf('your course grade is %5.2f\n\n',course_grade(2));
fprintf('Using option # 3: 0.25*mean(homework) + 0.25*midterm + 0.5*project,\n\t ');
fprintf('your course grade is %5.2f\n\n',course_grade(3));

best_grade = max(course_grade);
ind_best = find(course_grade == best_grade);
fprintf('The best option is # %d. Your effective course grade is %5.2f.\n',...
        ind_best(1),best_grade);

%% Assign letter grade 
if best_grade >= 93
    letter = 'A';
elseif best_grade >= 90
    letter = 'A-';
elseif best_grade >= 87
    letter = 'B+';
elseif best_grade >= 83
    letter = 'B';
elseif best_grade >= 80
    letter = 'B-';
elseif best_grade >= 77
    letter = 'C+';
elseif best_grade >= 73
    letter = 'C';
elseif best_grade >= 70
    letter = 'C-';
elseif best_grade >= 60
    letter = 'D';
elseif best_grade < 60
    letter = 'F';
else
    letter = NaN;
end
fprintf('Your course letter grade is %s or above.\n',letter);
    
