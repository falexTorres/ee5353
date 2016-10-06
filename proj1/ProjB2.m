% Call: ProjB2.m
% Reconstruct nearest neighbor 
% average downsampled image.
% For class EE5353, UTSA Fall 2016
% Alex Torres (rkc870), 09/15/2016
    
% Read image 
s_dir = pwd;
cd Images;
 
X1 = imread('aivazovsky78g.tif', 'tif');   
[N, M] = size(X1);

cd(s_dir); 

% resample
X1 = single(X1);
X2_a = X1(1:2:N, 1:2:M);
X2_b = X1(1:2:N, 2:2:M);
X2_c = X1(2:2:N, 1:2:M);
X2_d = X1(2:2:N, 2:2:M);
X2_sum = X2_a + X2_b + X2_c + X2_d;
X2 = X2_sum / 4;
X2 = uint8(X2);

% display the image
subplot(1, 2, 1);
imshow(X2);
title('downsampled by 2x2 using averaging');

% reconstruct image
X3 = X2(ceil(0.5:0.5:N/2), ceil(0.5:0.5:M/2));

% display reconstructed image
subplot(1, 2, 2);
imshow(X3);
title('reconstructed image');