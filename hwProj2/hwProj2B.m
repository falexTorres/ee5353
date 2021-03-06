% filters image by fft convolution of
% original image and three different kernels

% Read image 
s_dir = pwd;
cd Images;
 
X = imread('aivazovsky78g.tif', 'tif');   
[N, M] = size(X);
X = double(X);

cd(s_dir); 

% define smoothing filters
h3 = [1 0 1; 0 -4 0; 1 0 1];
h4 = [1 0 -1; 1 0 -1; 1 0 -1];
h5 = [1 4 1; 4 -20 4; 1 4 1];
[m, n] = size(h3);
% pad kernels
h3 = horzcat(h3, zeros(m, M-m));
h3 = vertcat(h3, zeros(N-m, M));
h4 = horzcat(h4, zeros(m, M-m));
h4 = vertcat(h4, zeros(N-m, M));
h5 = horzcat(h5, zeros(m, M-m));
h5 = vertcat(h5, zeros(N-m, M));

% perform fft convolution
h3 = double(h3);
h4 = double(h4);
h5 = double(h5);
X = double(X);
Y1 = myIFFT2(myFFT2(X).*myFFT2(h3));
Y2 = myIFFT2(myFFT2(X).*myFFT2(h4));
Y3 = myIFFT2(myFFT2(X).*myFFT2(h5));

% convert results back to tif image
Y1 = uint8(Y1);
Y2 = uint8(Y2);
Y3 = uint8(Y3);
X = uint8(X);

% dispaly results and error
subplot(1,2,1);
imshow(X);
title('original image');
subplot(1,2,2);
imhist(X);

subplot(1,2,1);
imshow(Y1);
title('first filtered image');
subplot(1,2,2);
imhist(Y1);

subplot(1,2,1);
imshow(Y2);
title('second filtered image');
subplot(1,2,2);
imhist(Y2);

subplot(1,2,1);
imshow(Y3);
title('third filtered image');
subplot(1,2,2);
imhist(Y3);

Y = Y1;
filtered1_error = sqrt( sum(sum( (X-Y).*(X-Y) )))/N/M
Y = Y2;
filtered2_error = sqrt( sum(sum( (X-Y).*(X-Y) )))/N/M
Y = Y3;
filtered3_error = sqrt( sum(sum( (X-Y).*(X-Y) )))/N/M