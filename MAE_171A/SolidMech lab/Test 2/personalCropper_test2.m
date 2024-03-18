clear;
clc;
close all;


%% test 2
path = 'C:\Users\jaden\OneDrive\Desktop\solidmech photos\Test 2\';
myfiles = dir([path '*.jpg']);
myfolder=pwd;

for i=1:length(myfiles)

    myimg=imread([path myfiles(i).name]);
    imshow(myimg);

    cropimg=imcrop(myimg,[2400 1500 700 1200]);
    %imshow(cropimg);
    %run matlab in admin in order to write
    imwrite(cropimg,[pwd '/cropped/crop_' myfiles(i).name]);

end

x1= 149;
x2= 176;
y1= 0;
y2=1200;

