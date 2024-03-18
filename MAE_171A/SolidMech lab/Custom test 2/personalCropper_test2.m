clear;
clc;
close all;


%% test 2
path = 'C:\Users\jaden\OneDrive\Desktop\solidmech photos\Custom test 2\';
myfiles = dir([path '*.jpg']);
myfolder=pwd;

for i=1:length(myfiles)

    myimg=imread([path myfiles(i).name]);
    imshow(myimg);

    cropimg=imcrop(myimg,[2550 1200 500 750]);
    %imshow(cropimg);
    %run matlab in admin in order to write
    imwrite(cropimg,[pwd '/cropped/crop_' myfiles(i).name]);

end

