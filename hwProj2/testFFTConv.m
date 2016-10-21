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

%h1 = padarray(h1, [ceil((N - 5)/2), ceil((M - 5)/2)]);
%h1 = double(h1(2:1:n, 2:1:m));

h1 = horzcat(h1, zeros(5, M-5));
h1 = vertcat(h1, zeros(N-5, M));

h1 = double(h1);
X = double(X);
%Y = ifft2(fft2(X).*fft2(h1));
Y = myIFFT2(myFFT2(X).*myFFT2(h1));

Y = uint8(Y);
X = uint8(X);

subplot(1,2,1);
imshow(X);
subplot(1,2,2);
imshow(Y);

% X1 = uint8(X1);
% X2 = uint8(X2);
% subplot(1,2,1);
% imshow(X1);
% subplot(1,2,2);
% imshow(X2);

% test convolution
% h1 = padarray(h1, [ceil((N - 5)/2), ceil((M - 5)/2)]);
% [n, m] = size(h1);
% h1 = h1(1:1:n-1, 1:1:m-1);
% H = fft2(single(h1));
% size(X1)
% size(H)
% conv = X1 .* H;
% result = real(fft2(fft2(conv)));
% result;
% filtered = uint8(result);
