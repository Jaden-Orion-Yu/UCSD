clc;
close all;
clear;

%% Opening images
opn = imread('');

cyl = imread('');

rankH = imread('');

rankF = imread('');

%%Flip and reorient **Might not need, double check**

opn = fliplr(flipud(opn));

cyl = fliplr(flipud(cyl));

rankH = fliplr(flipud(rankH));

rankF =fliplr(flipud(rankF));

%% Crop images to right size, needs to be done individually for each image
%Example
%opn_C = imcrop(opn,[x1,y1,x2,y2])

%% Set ref RGB *might change*
ref = [80 140 140];
dist = 50;
%% Open Analysis
tempVec = [0 0 0];
tempMat = zeros(size(opn_C,1),size(opn_C,2)); 



%% Cylinder Analysis



%% Rankine Half Analysis



%% Rankine Full Analysis



%% Image processing Function
function [mat] = processFunc(img)
tempVec = [0 0 0];
tempMat = zeros(size(img,1),size(img,2)); 
for i = 1:size(img,1) 
    for j = 1:size(img,2)
        tempvec(1)=img(i,j,1);
        tempvec(2)=img(i,j,2);
        tempvec(3)=img(i,j,3);
        if norm(tempvec-rgbref) < clrdist 
            % check if the color is within color distance
            binary(i,j)=1; % if so, set to 1
        end
    end
end

end