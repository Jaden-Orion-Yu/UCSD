% clc;
% close all;
% clear;

 ref = [7 45 82];
%dist also looks interesting at 25
 dist = 45;

airfoil = imread('airfoil.jpg');

airfoil_tip = imread('airfoil_tip.jpg');

airfoil = fliplr(flipud(fliplr(flipud(airfoil))));

airfoil_C1 = imcrop(airfoil,[500,350,2000,2000]);
airfoil_tip_C1 = imcrop(airfoil_tip,[700,100,2000,1748]);



pos1_af = [500 500 450 200];
pos2_af = [950 360 100 240];
pos3_af = [1050 350 250 150];
pos4_af = [1300 400 100 150];
pos5_af = [1400 480 50 120];
pos6_af = [1450 520 50 110];
pos7_af = [1500 550 60 150];
pos8_af = [1560 640 70 120];
pos9_af = [1630 700 40 120];
pos10_af = [1670 770 50 200];
pos11_af = [1720 800 50 200];
pos12_af = [1770 880 50 200];
pos13_af = [1820 920 50 200];
pos14_af = [1870 990 80 200];
pos15_af = [1920 1100 80 200];
pos16_af = [1970 1200 80 200];
pos17_af = [2020 1300 80 200];


posMat_af = [ pos1_af; pos2_af; pos3_af ;pos4_af ; pos5_af;
    pos6_af; pos7_af; pos8_af ;pos9_af ; pos10_af;
    pos11_af; pos12_af; pos13_af;pos14_af; pos15_af; pos16_af ;pos17_af];

airfoil_C2 = imcrop(airfoil,pos1_af);
airfoil_C3 = imcrop(airfoil,pos2_af);
airfoil_C4 = imcrop(airfoil,pos3_af);
airfoil_C5 = imcrop(airfoil,pos4_af);
airfoil_C6 = imcrop(airfoil,pos5_af);
airfoil_C7 = imcrop(airfoil,pos6_af);
airfoil_C8 = imcrop(airfoil,pos7_af);
airfoil_C9 = imcrop(airfoil,pos8_af);
airfoil_C10 = imcrop(airfoil,pos9_af);
airfoil_C11 = imcrop(airfoil,pos10_af);
airfoil_C12 = imcrop(airfoil,pos11_af);
airfoil_C13 = imcrop(airfoil,pos12_af);
airfoil_C14 = imcrop(airfoil,pos13_af);
airfoil_C15 = imcrop(airfoil,pos14_af);
airfoil_C16 = imcrop(airfoil,pos15_af);
airfoil_C17 = imcrop(airfoil,pos16_af);
airfoil_C18 = imcrop(airfoil,pos17_af);



%doing the C2 crop
airfoil_bin1 = processFunc(airfoil_C2,ref,dist);
%doing the C3 crop
airfoil_bin2 = processFunc(airfoil_C3,ref,dist);
%doing the C4 crop
airfoil_bin3 = processFunc(airfoil_C4,ref,dist);
%doing the C5 crop
airfoil_bin4 = processFunc(airfoil_C5,ref,dist);
%doing the C6 crop
airfoil_bin5 = processFunc(airfoil_C6,ref,dist);

airfoil_bin6 = processFunc(airfoil_C7,ref,dist);

airfoil_bin7 = processFunc(airfoil_C8,ref,dist);

airfoil_bin8 = processFunc(airfoil_C9,ref,dist);

airfoil_bin9 = processFunc(airfoil_C10,ref,dist);

airfoil_bin10 = processFunc(airfoil_C11,ref,dist);

airfoil_bin11 = processFunc(airfoil_C12,ref,dist);

airfoil_bin12 = processFunc(airfoil_C13,ref,dist);
airfoil_bin13 = processFunc(airfoil_C14,ref,dist);
airfoil_bin14 = processFunc(airfoil_C15,ref,dist);
airfoil_bin15 = processFunc(airfoil_C16,ref,dist);
airfoil_bin16 = processFunc(airfoil_C17,ref,dist);
airfoil_bin17 = processFunc(airfoil_C18,ref,dist);


airfoil_bin = zeros(1504,2104);

posEditMat_af = posEdit(posMat_af);

airfoil_bin(posEditMat_af(1,2):posEditMat_af(1,4),posEditMat_af(1,1):posEditMat_af(1,3) ) = airfoil_bin1;
airfoil_bin(posEditMat_af(2,2):posEditMat_af(2,4),posEditMat_af(2,1):posEditMat_af(2,3) ) = airfoil_bin2;
airfoil_bin(posEditMat_af(3,2):posEditMat_af(3,4),posEditMat_af(3,1):posEditMat_af(3,3) ) = airfoil_bin3;
airfoil_bin(posEditMat_af(4,2):posEditMat_af(4,4),posEditMat_af(4,1):posEditMat_af(4,3) ) = airfoil_bin4;
airfoil_bin(posEditMat_af(5,2):posEditMat_af(5,4),posEditMat_af(5,1):posEditMat_af(5,3) ) = airfoil_bin5;
airfoil_bin(posEditMat_af(6,2):posEditMat_af(6,4),posEditMat_af(6,1):posEditMat_af(6,3) ) = airfoil_bin6;
airfoil_bin(posEditMat_af(7,2):posEditMat_af(7,4),posEditMat_af(7,1):posEditMat_af(7,3) ) = airfoil_bin7;
airfoil_bin(posEditMat_af(8,2):posEditMat_af(8,4),posEditMat_af(8,1):posEditMat_af(8,3) ) = airfoil_bin8;
airfoil_bin(posEditMat_af(9,2):posEditMat_af(9,4),posEditMat_af(9,1):posEditMat_af(9,3) ) = airfoil_bin9;
airfoil_bin(posEditMat_af(10,2):posEditMat_af(10,4),posEditMat_af(10,1):posEditMat_af(10,3) ) = airfoil_bin10;
airfoil_bin(posEditMat_af(11,2):posEditMat_af(11,4),posEditMat_af(11,1):posEditMat_af(11,3) ) = airfoil_bin11;
airfoil_bin(posEditMat_af(12,2):posEditMat_af(12,4),posEditMat_af(12,1):posEditMat_af(12,3) ) = airfoil_bin12;
airfoil_bin(posEditMat_af(13,2):posEditMat_af(13,4),posEditMat_af(13,1):posEditMat_af(13,3) ) = airfoil_bin13;
airfoil_bin(posEditMat_af(14,2):posEditMat_af(14,4),posEditMat_af(14,1):posEditMat_af(14,3) ) = airfoil_bin14;
airfoil_bin(posEditMat_af(15,2):posEditMat_af(15,4),posEditMat_af(15,1):posEditMat_af(15,3) ) = airfoil_bin15;
airfoil_bin(posEditMat_af(16,2):posEditMat_af(16,4),posEditMat_af(16,1):posEditMat_af(16,3) ) = airfoil_bin16;
airfoil_bin(posEditMat_af(17,2):posEditMat_af(17,4),posEditMat_af(17,1):posEditMat_af(17,3) ) = airfoil_bin17;


[row_airfoil,col_airfoil] = find(airfoil_bin);

x_airfoil = 1:length(airfoil_bin(1,:));

figure(1)
imshow(airfoil_bin)
[C_airfoil,ia_airfoil,ic_airfoil] = unique(col_airfoil);
unqrow_airfoil = row_airfoil(ia_airfoil);
unqcol_airfoil = col_airfoil(ia_airfoil);

s_airfoil = spline(unqcol_airfoil, unqrow_airfoil,x_airfoil); % fit a spline
s2_airfoil = s_airfoil; % compensate for 2nd crop
s_smooth_airfoil =smooth(s2_airfoil,100); % smooth the spldine


figure(8)
imshow(airfoil_C1)
hold on
plot(x_airfoil,s2_airfoil,'or')
hold on
plot(x_airfoil,s_smooth_airfoil,'.b')

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

%% pos array editing
function [posEditMat] = posEdit(posMat)
posEditMat = posMat;
minX = min(posEditMat(:,1));
minY = min(posEditMat(:,2));
posEditMat(:,1) = posEditMat(:,1) - minX;
posEditMat(:,2) = posEditMat(:,2) - minY;
for i = 1:length(posMat(:,1))
    if posEditMat(i,1) == 0
        posEditMat(i,1) = 1;
    end
    if posEditMat(i,2) == 0
       posEditMat(i,2) = 1; 
    end
    %output posEditMat(i) = [x1 y1 x2 y2]
    posEditMat(i,3) = posEditMat(i,1) + posEditMat(i,3);
    posEditMat(i,4) = posEditMat(i,2) + posEditMat(i,4);
end
end