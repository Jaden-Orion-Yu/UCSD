clc;
close all;
clear;

%% Opening images
opn = imread('opn.jpg');

cyl = imread('cyl.jpg');

rankH = imread('rank_H.jpg');

rankF = imread('rank_F.jpg');

%%Flip and reorient **Might not need, double check**

opn = fliplr(flipud(fliplr(flipud(opn))));

cyl = fliplr(flipud(fliplr(flipud(cyl))));

rankH = fliplr(flipud(fliplr(flipud(rankH))));

rankF = fliplr(flipud(fliplr(flipud(rankF))));
%% Crop images to right size, needs to be done individually for each image
%Example
%initial crop around general area
[h,l] = size(opn)
opn_C1 = imcrop(opn,[1200,600,2300,1000]);
cyl_C1 = imcrop(cyl,[800,400,2100,1100]);
rankH_C1 = imcrop(rankH,[0,400,2100,1100]);
rankF_C1 = imcrop(rankF,[200,500,2300,900]);


%Crop around streamline for binary conversion
opn_C2 = imcrop(opn,[1200,1000,2300,250]);
cyl_C2 = imcrop(cyl,[800,400,2100,1100]);
rankH_C2 = imcrop(rankH,[0,400,2100,1100]);
rankF_C2 = imcrop(rankF,[200,500,2300,900]);

%image check
figure(1)
imshow(opn_C2);
figure(2)
imshow(opn_C1);

%% Open Analysis
ref = [61 75 159];
dist = 90;

opn_bin = processFunc(opn_C2,ref,dist); % Binary'd the cropped picture

[row_opn,col_opn] = find(opn_bin); %find the binary one whatever it ends up being.

x_opn = 1:length(opn_bin(1,:));
[C_opn,ia_opn,ic_opn] = unique(col_opn);
unqroq_opn = row(ia_opn);
unqcol_opn = col(ia_opn);

s = spline(unqcol,unqrow,x); % fit a spline
s2 = s+130; % compensate for 2nd crop
s_smooth=smooth(s2,100); % smooth the spline

figure(3)
imshow(opn_C1)
plot


%repeat for other ones. 
%image Checking
figure(2)
imshow(opn_bin);
%% Cylinder Analysis
%check if the crop is good
[center,radius] = imfindcircles(cyl_C,[300 500],'Sensitivity',0.99,'ObjectPolarity','dark');
cyl_bin = processFunc(cyl_C);


%% Rankine Half Analysis
rankH_bin = processFunc(rankH_C);


%% Rankine Full Analysis
rankF_bin = processFunc(rankF_C);

%% image checking
figure(1)
imshow(opn_C);
figure(2)
imshow(cyl_C);
figure(3)
imshow(rankH_C);
figure(4)
imshow(rankF_C);

%% Image processing Function
function [mat] = processFunc(img,ref,dist)

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
