
airfoil = imread('airfoil.jpg');
bw = im2bw(airfoil, graythresh(airfoil)); 
cc = bwconncomp(bw);
lblMatrix = labelmatrix(cc);
%imshow(lblMatrix)
edgeMatrix=edges(lblMatrix,'log',0);
imshow(edgeMatrix)