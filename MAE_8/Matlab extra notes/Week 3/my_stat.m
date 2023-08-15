
function [min_val, max_val] = my_stat(X)
% MY_STAT: takes in matrix X and return the global min and max values
% call format: [min_val, max_val] = my_stat(X)

min_val = min(X(:));
max_val = max(X(:));


end % function my_stat