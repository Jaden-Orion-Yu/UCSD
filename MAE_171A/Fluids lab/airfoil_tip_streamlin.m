clc;
close all;
clear;

 ref = [20 126 143];
%dist also looks interesting at 25
 dist = 90;


aft = imread('airfoil_tip.jpg');



%aft_C1 = imcrop(aft,[670,100,2000,2000]);
aft_C1 = imcrop(aft,[570,270,2000,2000]);
pos1_aft = [570 500 430 120];
pos2_aft = [1000 430 130 170];
pos3_aft = [1130 270 250 200];
pos4_aft = [1380 290 100 160];
pos5_aft = [1480 376 60 200];
pos6_aft = [1540 400 30 200];
pos7_aft = [1570 450 30 200];
pos8_aft = [1600 450 30 200];
pos9_aft = [1630 490 30 200];
pos10_aft = [1660 530 30 200];
pos11_aft = [1690 580 50 200];
pos12_aft = [1720 610 80 200];
pos13_aft = [1750 630 80 200];
pos14_aft = [1780 660 80 200];
pos15_aft = [1810 690 80 200];
pos16_aft = [1840 720 80 200];
pos17_aft = [1870 750 80 200];
pos18_aft = [1900 770 80 200];
pos19_aft = [1930 800 80 200];
pos20_aft = [1960 830 80 200];
pos21_aft = [1990 860 80 200];
pos22_aft = [2020 890 80 200];
pos23_aft = [2050 920 80 200];
pos24_aft = [2050 920 80 200];
pos25_aft = [2080 950 80 200];
pos26_aft = [2110 980 80 200];
pos27_aft = [2140 1010 80 200];
pos28_aft = [2140 1040 80 200];
pos29_aft = [2140 1070 80 200];
pos30_aft = [2180 1100 80 200];
pos31_aft = [2180 1130 80 200];
pos32_aft = [2180 1160 80 200];
pos33_aft = [2200 1190 80 200];
pos34_aft = [2200 1210 120 200];

posMat_aft = [ pos1_aft; pos2_aft; pos3_aft ;pos4_aft ; pos5_aft;
    pos6_aft; pos7_aft; pos8_aft ;pos9_aft ; pos10_aft;
    pos11_aft ; pos12_aft; pos13_aft; pos14_aft ; pos15_aft;pos16_aft;pos17_aft;pos18_aft;pos19_aft;
    pos20_aft;pos21_aft;pos22_aft;pos23_aft;pos24_aft;pos25_aft;pos26_aft;pos27_aft;pos28_aft;pos29_aft;pos30_aft;
    pos31_aft;pos32_aft;pos33_aft;pos34_aft];

% Higher streamline
% pos1_aft = [670 180 240 80];
% pos2_aft = [910 110 120 40];
% pos3_aft = [1000 100 250 100];
% pos4_aft = [1250 100 250 160];
% pos5_aft = [1500 200 200 200];
% pos6_aft = [1600 300 400 200];
% pos7_aft = [1700 450 400 200];
% pos8_aft = [1800 640 400 200];
% pos9_aft = [1900 700 400 200];
% pos10_aft = [2000 800 400 200];
% pos11_aft = [2100 800 400 200];


% %Position calcs pre- automation
% aft_C2 = imcrop(aft,pos1_aft);
% aft_C3 = imcrop(aft,pos2_aft);
% aft_C4 = imcrop(aft,pos3_aft);
% aft_C5 = imcrop(aft,pos4_aft);
% aft_C6 = imcrop(aft,pos5_aft);
% aft_C7 = imcrop(aft,pos6_aft);
% aft_C8 = imcrop(aft,pos7_aft);
% aft_C9 = imcrop(aft,pos8_aft);
% aft_C10 = imcrop(aft,pos9_aft);
% aft_C11 = imcrop(aft,pos10_aft);
% aft_C12 = imcrop(aft,pos11_aft);
% aft_C13 = imcrop(aft,pos12_aft);
% aft_C14 = imcrop(aft,pos13_aft);
% aft_C15 = imcrop(aft,pos14_aft);
% aft_C16 = imcrop(aft,pos15_aft);
% aft_C17 = imcrop(aft,pos16_aft);
% aft_C18 = imcrop(aft,pos17_aft);
% aft_C19 = imcrop(aft,pos18_aft);
% aft_C20 = imcrop(aft,pos19_aft);



% %doing the C2 crop
% aft_bin1 = processFunc(aft_C2,ref,dist);
% %doing the C3 crop
% aft_bin2 = processFunc(aft_C3,ref,dist);
% %doing the C4 crop
% aft_bin3 = processFunc(aft_C4,ref,dist);
% %doing the C5 crop
% aft_bin4 = processFunc(aft_C5,ref,dist);
% %doing the C6 crop
% aft_bin5 = processFunc(aft_C6,ref,dist);
% 
% aft_bin6 = processFunc(aft_C7,ref,dist);
% 
% aft_bin7 = processFunc(aft_C8,ref,dist);
% 
% aft_bin8 = processFunc(aft_C9,ref,dist);
% 
% aft_bin9 = processFunc(aft_C10,ref,dist);
% 
% aft_bin10 = processFunc(aft_C11,ref,dist);
% 
% aft_bin11 = processFunc(aft_C12,ref,dist);
% 
% aft_bin12 = processFunc(aft_C13,ref,dist);
% 
% aft_bin13 = processFunc(aft_C14,ref,dist);
% aft_bin14 = processFunc(aft_C15,ref,dist);
% 
% 

% 
% posEditMat_af = posEdit(posMat_af);

% aft_bin(posEditMat_af(1,2):posEditMat_af(1,4),posEditMat_af(1,1):posEditMat_af(1,3) ) = aft_bin1;
% aft_bin(posEditMat_af(2,2):posEditMat_af(2,4),posEditMat_af(2,1):posEditMat_af(2,3) ) = aft_bin2;
% aft_bin(posEditMat_af(3,2):posEditMat_af(3,4),posEditMat_af(3,1):posEditMat_af(3,3) ) = aft_bin3;
% aft_bin(posEditMat_af(4,2):posEditMat_af(4,4),posEditMat_af(4,1):posEditMat_af(4,3) ) = aft_bin4;
% aft_bin(posEditMat_af(5,2):posEditMat_af(5,4),posEditMat_af(5,1):posEditMat_af(5,3) ) = aft_bin5;
% aft_bin(posEditMat_af(6,2):posEditMat_af(6,4),posEditMat_af(6,1):posEditMat_af(6,3) ) = aft_bin6;
% aft_bin(posEditMat_af(7,2):posEditMat_af(7,4),posEditMat_af(7,1):posEditMat_af(7,3) ) = aft_bin7;
% aft_bin(posEditMat_af(8,2):posEditMat_af(8,4),posEditMat_af(8,1):posEditMat_af(8,3) ) = aft_bin8;
% aft_bin(posEditMat_af(9,2):posEditMat_af(9,4),posEditMat_af(9,1):posEditMat_af(9,3) ) = aft_bin9;
% aft_bin(posEditMat_af(10,2):posEditMat_af(10,4),posEditMat_af(10,1):posEditMat_af(10,3) ) = aft_bin10;
% aft_bin(posEditMat_af(11,2):posEditMat_af(11,4),posEditMat_af(11,1):posEditMat_af(11,3) ) = aft_bin11;
% aft_bin(posEditMat_af(12,2):posEditMat_af(12,4),posEditMat_af(12,1):posEditMat_af(12,3) ) = aft_bin12;
% aft_bin(posEditMat_af(13,2):posEditMat_af(13,4),posEditMat_af(13,1):posEditMat_af(13,3) ) = aft_bin13;
% aft_bin(posEditMat_af(14,2):posEditMat_af(14,4),posEditMat_af(14,1):posEditMat_af(14,3) ) = aft_bin14;


 
posEdit_aft = posEdit(posMat_aft);

aft_bin = zeros(1504,2104);

aft_bin = pos2bin(aft,posMat_aft,posEdit_aft,aft_bin,ref,dist);

[row_aft,col_aft] = find(aft_bin);

x_aft = 1:length(aft_bin(1,:));

figure(1)
imshow(aft_bin)
[C_aft,ia_aft,ic_aft] = unique(col_aft);
unqrow_aft = row_aft(ia_aft);
unqcol_aft = col_aft(ia_aft);

s_aft = spline(unqcol_aft, unqrow_aft,x_aft); % fit a spline
s2_aft = s_aft; % compensate for 2nd crop
s_smooth_aft =smooth(s2_aft,100); % smooth the spldine


figure(6)
imshow(aft_C1)
hold on
plot(x_aft,s2_aft,'or')
hold on
plot(x_aft,s_smooth_aft,'.b')

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

%% image construction
function [outbin] = pos2bin(img,posMat,posEditmat,zeroBin,ref,dist)
    outbin = zeroBin;
    for i = 1:length(posMat(:,1))
     %Cropping
     aft_C = imcrop(img,posMat(i,:));
     %Binary Conversion
     aft_bin = processFunc(aft_C,ref,dist);
     %using position edited by posEdit
     outbin(posEditmat(i,2):posEditmat(i,4),posEditmat(i,1):posEditmat(i,3) ) = aft_bin;
    end
end