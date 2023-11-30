% 
% Q1: Neglecting issues related to focus, is it better for the camera to be closer or further from the disk? Briefly explain why.  
% 
% 
% Part III: Process your digital video data
% 
% Setup a script to convert the recorded video to images. The sample script provided below will convert your recorded video into a folder of images corresponding to each recorded frame. When you download the lab data video file, it should be placed in the same folder as your Matlab script. Implement the code below, and review the comments on each line to understand its function. 

workingDir = pwd; % set the working directory to the current directory
frames = 200; % set the number of frames to record
v_read = VideoReader('recorded_video_02_06_10.avi'); % setup the video reader

mkdir(workingDir,'images'); % make a subfolder to store your images

for i = 1:frames % Create a loop to move through each frame
    img = readFrame(v_read); % read current frame as an image
    name = [sprintf('%03d',i) '.jpg']; % dynamically create image filename
    filename = fullfile(workingDir,'images',name); % add file path/directory
    imwrite(img,filename);  % create the image file
end



