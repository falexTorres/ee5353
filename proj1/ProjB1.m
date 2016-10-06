% Call: ProjB1.m
% Downsample an image by 2x2 using 
% the mean of the four nearest neighbors.
% For class EE5353, UTSA Fall 2016
% Alex Torres (rkc870), 09/15/2016
    
% Read image 
s_dir = pwd;
cd Images;
 
X1 = imread('aivazovsky78g.tif', 'tif');   
[N, M] = size(X1);

cd(s_dir); 

% display the image
subplot(1, 2, 1);
imshow(X1);
title('original image');

% resample
X1 = single(X1);
X2_a = X1(1:2:N, 1:2:M);
X2_b = X1(1:2:N, 2:2:M);
X2_c = X1(2:2:N, 1:2:M);
X2_d = X1(2:2:N, 2:2:M);
X2_sum = X2_a + X2_b + X2_c + X2_d;
X2 = X2_sum / 4;
X2 = uint8(X2);

% display down sampled image
subplot(1, 2, 2);
imshow(X2);
title('downsampled by 2x2 using averaging');