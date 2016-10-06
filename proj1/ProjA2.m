% Call: ProjA2.m
% Reconstruct nearest 
% neighbor downsampled image.
% For class EE5353, UTSA Fall 2016
% Alex Torres (rkc870), 09/15/2016
    
% Read image 
s_dir = pwd;
cd Images;
 
X1 = imread('aivazovsky78g.tif', 'tif');   
[N, M] = size(X1);

cd(s_dir); 

% resample
N2 = N/2;
M2 = M/2;
X2 = X1(1:2:N, 1:2:M);

% display the image
subplot(1, 2, 1);
imshow(X2);
title('downsampled image');

% reconstruct image
X3 = X2(ceil(0.5:0.5:N2), ceil(0.5:0.5:M2));

% display reconstructed image
subplot(1, 2, 2);
imshow(X3);
title('reconstructed image');


