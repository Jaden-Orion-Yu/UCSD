clear;clc;

% finding highest value (Original version)
% y_beta_array = 0:0.1:10;
% eigs = zeros(2,length(y_beta_array));
% v0 = 750;
% 
% for i = 1:legnth(y_beta_array)

v0 = 750;
y_beta= 1;
eigs_final = [0;0];
y_beta_final = 0;
while true
    mat = [y_beta/v0, -747.5;0.016, -0.31];
    eigs = eig(mat);
    if (real(eigs(1)) > 0) && (real(eigs(2)) > 0)
        eigs_final = eigs_temp;
        y_beta_final = y_beta_temp;
        break
    else
        y_beta = y_beta + 1;
    end
    eigs_temp = eigs;
    y_beta_temp = y_beta;
end