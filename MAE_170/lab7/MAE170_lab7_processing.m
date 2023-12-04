% Setup your image processing code in a separate script (initialize settings and display the first image). In the following, you will build a script to process your images. The start of the sample script is provided below (it will likely be easiest if this is a separate script from the previous). You will likely want to modify the parameters highlighted in yellow. This section sets up the major parameters used in your code, reads in the first image, and then displays it. Implement the code below, and review the comments on each line to understand its function. 

workingDir = pwd;
frames=200; % number of frames to process
pause('on'); % enable pausing
fps=30; % number of frames per second of the original video
%% Start by processing the first frame
name = ['001.jpg']; % filename of the first frame
filename = fullfile(workingDir,'images',name);  % 1st frame filename with path
testfig=imread(filename); % load the first frame into matlab
figure(01) % setup the first figure
imshow(testfig); % plot the first frame
h=gca; % get the handle for the current plot axes
h.Visible='On'; % get the handle for the current plot
title('Original Image'); % set the plot title


% Add this next section of sample script to your signal processing code. This section will crop your image based on your set parameters, convert the image to grayscale, and then display it. Review the comments on each line to understand its function. 

%% Grayscale
figure(02)
topleft_x=270; % number of pixels to crop from the left
topleft_y=70; % number of pixels to crop from the top
width=470; % width of the cropped frame (in pixels)
height=470; % height of the cropped frame (in pixels)
testfig_crop=imcrop(testfig,[topleft_x topleft_y width height]);
% crop the image to the dimensions specified above
testfig_crop_gray=rgb2gray(testfig_crop);
% convert the cropped image to grayscale
imshow(testfig_crop_gray);
h=gca;
h.Visible='On';
colorbar; %provide a color scale bar
title('Cropped Image in Grayscale');
% 
% Add this next section of sample script to your signal processing code. This section will convert your grayscale image to binary based on your threshold setting, and then display the binary image. Review the comments on each line to understand its function. 


%% Threshold Image
figure(03)
threshold=60; % threshold value to turn grayscale into binary (0 to 255)
dims_img = size(testfig_crop_gray); % get image dimensions
test_fig_binary=uint8(zeros(dims_img)); % initialize a new figure with zeros
for i=1:dims_img(1) % loop along the cropped grayscale image rows
      for j=1:dims_img(2) % loop along the cropped grayscale image columns
             if double(testfig_crop_gray(i,j))>threshold
% check if grayscale value is below/above your specified threshold
          	 test_fig_binary(i,j)=255; %if it is above, set to maximum value
             end
      end
end
imshow(test_fig_binary,'Colormap',jet(255));
colorbar;
h=gca;
h.Visible='On';
title('Cropped Binary Image with Identified Points');


% 
% Add this next section of sample script to your signal processing code. This section identifies the center and rotating points of your disk. You will want to adjust the highlighted yellow parameters to ensure you identify only one center point and one rotating point. Review the comments on each line to understand its function. 


%% Identify points in first binary image
hold on % turn ‘hold’ on to allow addtl. plots to be overlayed on binary plot
rot_min = 20; % rotating point minimum pixel radius
rot_max = 45; % rotating point maximum pixel radius
ctr_min = 10; % center point minimum pixel radius
ctr_max = 25; % center point maximum pixel radius
rot_sens = 0.975; % algorithm sensitivity to find rotating point
ctr_sens = 0.95; % algorithm sensitivity to find center point
[rotatingpoint.center,rotatingpoint.radii] = imfindcircles(test_fig_binary,[rot_min rot_max],'ObjectPolarity','dark','Sensitivity',rot_sens);
% find dark circles in the range of 10 to 30 pixel radii (in this case, this will be the “rotating point”)
% sensitivity denotes threshold for detection of a circle; a lower value will detect fewer circles
% https://www.mathworks.com/help/images/detect-and-measure-circular-objects-in-an-image.html
% function returns a vector of the center coordinates of each circle, and a vector of each circle’s radius
viscircles(rotatingpoint.center,rotatingpoint.radii);  
% plot the rotating point (overlay on binary plot)
[centerpoint.center,centerpoint.radii] = imfindcircles(test_fig_binary,[ctr_min ctr_max],'ObjectPolarity','dark','Sensitivity',ctr_sens)
% find the “center” point
viscircles(centerpoint.center,centerpoint.radii); 
% plot the center point (overlay on binary plot)


% 
% Add this next section of sample script to your signal processing code. This section draws a line between your identified points. Review the comments on each line to understand its function. 

line([rotatingpoint.center(1) centerpoint.center(1)],[rotatingpoint.center(2) centerpoint.center(2)],'Color','k','LineWidth',2);
% plot a line from the rotating point to the center point (overlay it on the binary plot)
line([centerpoint.center(1) centerpoint.center(1)+width/4],[centerpoint.center(2) centerpoint.center(2)],'Color','g','LineWidth',2);
% plot a line corresponding to a starting angle (overlay it on the binary plot)
hold off % turn the plot hold off
 
% 
% Add this section of sample script to your signal processing code. This section calculates the angle between your two lines [e.g. the angle of the rotating point from the horizontal). Review the comments on each line to understand its function. 

zerovector=[1 0 0]; % initialize a zero vector
pointvector=[rotatingpoint.center-centerpoint.center, 0]; 
% Calculate vector from center to rotating point 

angle_sign=cross(zerovector,pointvector); 
% Check what the sign of the angle should be resulting from the next calculation  
angle=sign(angle_sign(3))*atan2(norm(cross(zerovector,pointvector)),dot(zerovector,pointvector)); 
% Calculate the angle in radians
angled=angle*180/pi  % Convert to degrees
% 
% Add this next section of sample script to your signal processing code. This section repeats the above process that you set up for all of the recorded images (up to the number of frames you specified in the previously set parameters). The highlighted yellow parameters may need to be adjusted compared to the first image due to image distortion as the wheel speeds up. 

%% Loop through all the frames
rot_min = rot_min; % change these if needed
rot_max = rot_max; % change these if needed
rot_sens = rot_sens; % change these if needed
for k=1:frames
  
   if k<1000 % Concatenate to dynamically obtain the filename
       name = ['' int2str(k) '.jpg']; % Use the function int2str() to convert integer to string
   end
   if k<100
       name = ['0' int2str(k) '.jpg'];
   end
   if k<10
       name = ['00' int2str(k) '.jpg'];
   end
 
   filename = fullfile(workingDir,'images',name);
  
   testfig=imread(filename);
   testfig_crop=imcrop(testfig,[topleft_x topleft_y width height]);
   testfig_crop_gray=rgb2gray(testfig_crop);
   test_fig_binary=uint8(zeros(dims_img));
  
   for i=1:dims_img(1)
          for j=1:dims_img(2)
              if double(testfig_crop_gray(i,j))>threshold
                 test_fig_binary(i,j)=255;
              end
          end
   end
   figure(04)
   imshow(test_fig_binary,'Colormap',jet(255));
   colorbar;
   h=gca;
   h.Visible='On';
   title(['Cropped Binary Image ' num2str(k) ' with Identified Points']); 
   % dynamically adjust the plot title
   hold on
   [rotatingpoint.center,rotatingpoint.radii] = imfindcircles(test_fig_binary,[rot_min  rot_max],'ObjectPolarity','dark', 'Sensitivity',rot_sens);
   viscircles(rotatingpoint.center(1,:),rotatingpoint.radii(1,:));
   viscircles(centerpoint.center,centerpoint.radii);
  
   line([rotatingpoint.center(1,1) centerpoint.center(1)],...
[rotatingpoint.center(1,2)    centerpoint.center(2)],'Color','k','LineWidth',2);
   line([centerpoint.center(1) centerpoint.center(1)+width/4],...
[centerpoint.center(2) centerpoint.center(2)],'Color','g','LineWidth',2);
 
   hold off
  
   zerovector=[1 0 0];
   pointvector=[rotatingpoint.center(1,:)-centerpoint.center, 0];
   angle_sign=cross(zerovector,pointvector);
   angle=sign(angle_sign(3))*atan2(norm(cross(zerovector,pointvector)),dot(zerovector,pointvector));
   angle_degrees=angle*180/pi
   angled(k)=angle_degrees;
   if mod(k,10)==0 % display every 10 frames to the command line
       k
   end
   pause(0.2); % pause for 200 ms for each frame to allow time for plotting
end
%shift measured angles to be from 0 to 360 instead of -180 to 180 degrees
angled=angled+180;


% 
% Q2: Explain what trigonometric calculations are being used to obtain the angle of the rotating point with respect to the horizontal.
% 
% Q3: Discuss the difference between exposure time and sampling rate (frames per second) and their relative effects. 
% 
% Q4: When imaging at high speeds, you typically need to shine more light on your sample than you would when imaging at low speeds. Why is this? 
% 
% Q5: What is the field of view and spatial resolution of your image (before cropping the image)? The disk is 76 mm in diameter. 
% 
% Q6: After Matlab reads in the video file, it has 24 bits of data per pixel, which is equivalent to 3 bytes per pixel (as a result of Red-Green-Blue [RGB] color information). Given that the video is recorded with 480x640 pixels per image, and you are recording at 30 frames per second, how much data is 10 seconds of uncompressed video in Megabytes? 
% 
% 
% Part III: Technical writing
% 
% Q7: This question pertains to WLO2. Main task: Create, via Matlab, and turn in a plot, including caption, with three panels: angle measured vs. time; total angle traversed vs. time; and revolutions per minute vs. time. You should use the data obtained from your image processing. Make sure to construct your figure in the context of the WLO2 dimensions. Purpose: to gain practice presenting data visually in an accessible and information dense manner. 
% 
% To obtain a continuous curve of angle traversed vs. time, you would need to account for the angle crossing from 360 degrees to 0 degrees. You can use a script like the following to achieve this. In the following script, we use the knowledge that we need at least two points per cycle to accurately characterize the wheel’s motion. Your identified onset of aliasing (if your wheel is spinning fast enough) should correspond to when you see the wheel appear to spin backwards. As such, you should obtain a “negative” angular velocity at the onset of aliasing.  
% 
% %setup an adjusted angle vector (for total accumulated angle)
% adjustedangle=angled; 
% for i=2:frames
%     if angled(i)<180 & angled(i-1)>180 % check for crossing from 360 to 0
%         adjustedangle(i:frames)=adjustedangle(i:frames)+360;
%     end
%     % check for >180 degree motion
%     if adjustedangle(i)-adjustedangle(i-1)>180 
%         % if so, undo the prior addition
%         adjustedangle(i:frames)=adjustedangle(i:frames)-360; 
%     end
% end