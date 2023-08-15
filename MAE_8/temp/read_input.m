function [Xo, Yo, Zo, Uo, Vo, Wo] = read_input(input_filename,sat_id)
% Function read_input reads and extracts the data stored within
% satellite_data.txt for a specified satellite id. The inputs for the
% function should be the file name and sat_id which specifies which
% satellite's data is needed while the function's output should contain (X,
% Y, X) = Satellites position and (U, V, W) = The Satellites Velocity. IF
% the satellite id does not exist then function should output NaN for all
% variables and display an error warning. 

input = importdata(input_filename, ',' ,2);
[row,col]= size (input.data);

if sat_id< 1 || sat_id> row 
    Xo = NaN;
    Yo = NaN;
    Zo = NaN;
    Uo = NaN;
    Vo = NaN;
    Wo = NaN;
    disp('Error: sat_id is invalid');
    return;
end

Xo = input.data(sat_id, 2);
Yo = input.data(sat_id, 3);
Zo = input.data(sat_id, 4);
Uo = input.data(sat_id, 5);
Vo = input.data(sat_id, 6);
Wo = input.data(sat_id, 7);
end
