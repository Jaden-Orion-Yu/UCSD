function [Xo, Yo, Zo, Uo, Vo, Wo] = read_input(input_filename, sat_id)
%read_input takes the filename of a data file and an ID of a set of data
%and returns that set of data
%   read_input is specialized for the satellite_data.txt file. it takes in
%   the filename and imports the data using the importdata function. it
%   then creates a data structure containing all the different data forms
%   in the file. 
inputdata = importdata(input_filename, ',' ,2);

[row,col] = size(inputdata.data);

if sat_id< 1 || sat_id > row
    Xo = NaN;
    Yo = NaN;
    Zo = NaN;
    Uo = NaN;
    Vo = NaN;
    Wo = NaN;
    disp('Error: sat_id is invalid');
    return;
end

    Xo = inputdata.data(sat_id,2);
    Yo = inputdata.data(sat_id,3);
    Zo = inputdata.data(sat_id,4);
    Uo = inputdata.data(sat_id,5);
    Vo = inputdata.data(sat_id,6);
    Wo = inputdata.data(sat_id,7);

end