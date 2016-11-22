% Read imshow 
s_dir = pwd;
cd Images;

i = imread('noisy_lena.tif');
cd(s_dir);

subplot(1, 1, 1);
imshow(i);