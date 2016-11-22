% add noise to blurred lena image 
s_dir = pwd;
cd Images;

b = imread('blurred_lena.tif');
cd(s_dir);

[N, M] = size(b);
n = rand(N, M)*16;

i = double(n) + double(b);

subplot(1,2,1);
imshow(uint8(b));
title('blurred lena');
subplot(1,2,2);
imshow(uint8(i));
title('noisy lena');

% mse
mean2((double(i) - double(b)).^2)

imwrite(uint8(n), './Images/n_image.tif');
imwrite(uint8(i), './Images/noisy_lena.tif');
