function [class] = my_schedule(day)
%MY_SCHEDULE Summary of this function goes here
%   Detailed explanation goes here


% switch day
%     case 'mon'
%         class = 'MAE 3';
%     case 'tues'
%         class = 'MAE 8';
%     case 'wed' 
%         class = 'MAE 3';
%     case 'thurs'
%         class = 'MAE 8';
%     case 'fri'
%         class = 'MAE 3';
%     case 'sat'
%         class = 'no class';
%     case 'sun'
%         class = 'no class';
%     otherwise
%         class = 'invalid input';
%        
% end % switch on line 6

switch day
    case {'mon' 'wed' 'fri'} % you cannot use logical operators in switches, only scalars and vectors (including characters)
        class = 'MAE 3';
    case {'tue' 'thurs'}
        class = 'MAE 8';
    case {'sat' 'sun'}
        class = 'no class';
    otherwise
        class = 'invalid input';
end % switch on line 26