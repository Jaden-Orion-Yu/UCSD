clc;
close all;
clear;
cyl = imread('cyl.jpg');
cyl = fliplr(flipud(fliplr(flipud(cyl))));
cyl_C1 = imcrop(cyl,[800,80,2100,1500]);
cyl_C2 = imcrop(cyl,[800,1000,2100,400]);

[centers,radii] = imfindcircles(cyl_C1,[300 500],'Sensitivity',0.991,'ObjectPolarity','dark');
figure(2)
imshow(cyl_C1)
hold on
viscircles(centers,radii);
plot(centers(1),centers(2),'xr','MarkerSize',20,'LineWidth',3);
