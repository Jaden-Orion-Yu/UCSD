function  days = days_in_month(month,leap)
%DAYS_IN_MONTH takes in a month string and a boolian true or false to
%indicate if the year is a leap year and outputs the total number of days
%in that month
%   month = all lower case 3 letter string indicating month
%   leap = 0 or 1, indicating whether year is leap year or not
%   function uses switch statement to match up input values to the correct
%   number of days.
switch month
    case {'apr', 'jun', 'sep','nov'}
        days = 30;
    case {'jan','mar', 'may', 'jul','aug','oct','dec'}
        days = 31;
    case 'feb'
        switch leap
            case 0
                days = 28;
            case 1
                days = 29;
            otherwise
                days = 'Invalid inputs';
        end
    otherwise
        days = 'Invalid inputs';
end           
end

