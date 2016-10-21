% Read image 
s_dir = pwd;
cd Images;
 
X1 = imread('target_A1v.tiff', 'tiff');   
X1 = X1(:, :, 3);
imshow(X1);