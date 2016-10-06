% Read thresholded images 
s_dir = pwd;
cd Images;

X = imread('target_A1v.bmp');
cd (s_dir);

X = imrotate(X, -50, 'bilinear', 'crop');
imshow(X);