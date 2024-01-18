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
%cyl_C = imcrop(cyl,[x1,y1,x2,y2])
%rankH_C = imcrop(rankH,[x1,y1,x2,y2])
%rankF_C = imcrop(rankF,[x1,y1,x2,y2])

%% Open Analysis



%% Cylinder Analysis
%check if the crop is good
[center,radius] = imfindcircles(opn_C,[300 500],'Sensitivity',0.99,'ObjectPolarity','dark')


%% Rankine Half Analysis



%% Rankine Full Analysis



%% Image processing Function
function [mat] = processFunc(img)
ref = [80 140 140];
dist = 50;
tempVec = [0 0 0];
tempMat = zeros(size(img,1),size(img,2)); 
for i = 1:size(img,1) 
    for j = 1:size(img,2)
        tempVec(1)=img(i,j,1);
        tempVec(2)=img(i,j,2);
        tempVec(3)=img(i,j,3);
        if norm(tempVec-ref) < dist
            % check if the color is within color distance
            tempMat(i,j)=1; % if so, set to 1
        end
    end
end
mat = tempMat;

end
