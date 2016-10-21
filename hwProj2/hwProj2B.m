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
h1 = (1 / 13) * [0 0 1 0 0; 0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 0 0 1 0 0];
h2 = (1 / 10) * [0 0 1 0 0; 0 0 1 0 0; 1 1 2 1 1; 0 0 1 0 0; 0 0 1 0 0];
%h3 = () * [ ; ; ; ; ; ];

% pad kernels
h1 = horzcat(h1, zeros(5, M-5));
h1 = vertcat(h1, zeros(N-5, M));
h2 = horzcat(h2, zeros(5, M-5));
h2 = vertcat(h2, zeros(N-5, M));
h3 = horzcat(h3, zeros(5, M-5));
h3 = vertcat(h3, zeros(N-5, M));

% perform fft convolution
h1 = double(h1);
h2 = double(h2);
h3 = double(h3);
X = double(X);
Y1 = ifft2(fft2(X).*fft2(h1));
Y2 = ifft2(fft2(X).*fft2(h2));
Y3 = ifft2(fft2(X).*fft2(h3));
%Y1 = myIFFT2(myFFT2(X).*myFFT2(h1));
%Y2 = myIFFT2(myFFT2(X).*myFFT2(h2));
%Y3 = myIFFT2(myFFT2(X).*myFFT2(h3));

% convert results back to tif image
Y1 = uint8(Y1);
Y2 = uint8(Y2);
Y3 = uint8(Y3);

% dispaly results and error
subplot(2,2,1);
imshow(X);
subplot(2,2,2);
imshow(Y1);
subplot(2,2,3);
imshow(Y2);
subplot(2,2,4);
imshow(Y3);
