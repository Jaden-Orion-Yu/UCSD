function [outvar] = my_sqrt(numA)
%MY_SQRT: takes the sqrt of a number or returns NaN if the number is
%negative
% explanation

%%%%
%outvar = sqrt(numA);

%if numA < 0 
%    outvar = NaN;
%end % if on line 8
%%%%


if numA < 0 
    outvar = NaN;
else 
    outvar = sqrt(numA);
end % if on line 15

end % function my_sqrt