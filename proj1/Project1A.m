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
subplot(2, 2, 1);
imshow(X2);
title('downsampled image');

% reconstruct image
X3 = X2(ceil(0.5:0.5:N2), ceil(0.5:0.5:M2));

% display reconstructed image
subplot(2, 2, 3);
imshow(X3);
title('reconstructed from downsampled image');

% resample
X1 = single(X1);
X2_a = X1(1:2:N, 1:2:M);
X2_b = X1(1:2:N, 2:2:M);
X2_c = X1(2:2:N, 1:2:M);
X2_d = X1(2:2:N, 2:2:M);
X2_sum = X2_a + X2_b + X2_c + X2_d;
X4 = X2_sum / 4;
X4 = uint8(X4);

% display the image
subplot(2, 2, 2);
imshow(X4);
title('downsampled by 2x2 using averaging');

% reconstruct image
X5 = X4(ceil(0.5:0.5:N/2), ceil(0.5:0.5:M/2));

% display reconstructed image
subplot(2, 2, 4);
imshow(X5);
title('reconstructed from average downsampled image');