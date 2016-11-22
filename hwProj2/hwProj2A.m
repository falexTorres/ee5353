% Read imshow 
s_dir = pwd;
cd Images;
 
X = imread('aivazovsky78g.tif', 'tif');   
[N, M] = size(X);

cd(s_dir); 

% define smoothing filters
h1 = (1 / 13) * [0 0 1 0 0; 0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 0 0 1 0 0];
h2 = (1 / 10) * [0 0 1 0 0; 0 0 1 0 0; 1 1 2 1 1; 0 0 1 0 0; 0 0 1 0 0];

% windowed convolution filtering method
filtered1 = myConv2(single(X), single(h1));
filtered2 = myConv2(single(X), single(h2));
filtered1 = filtered1(1:N, 1:M);
filtered2 = filtered2(1:N, 1:M);

% convert results back to uint8
filtered1 = uint8(filtered1);
filtered2 = uint8(filtered2);

% calculate imshow for (c)
imshow_c1 = 4 * abs(X - filtered1);
imshow_c2 = 4 * abs(X - filtered2);

% generate histograms
% X_histogram = imhist(X);
% filtered1_histogram = imhist(filtered1);
% filtered2_histogram = imhist(filtered2);
% imshow_c1_histogram = imhist(imshow_c1);
% imshow_c2_histogram = imhist(imshow_c2);

% display imshows
subplot(1,2,1);
imshow(X);
title('original imshow');
subplot(1,2,2);
imhist(X);

subplot(1,2,1);
imshow(filtered1);
title('filtered1 imshow');
subplot(1,2,2);
imhist(filtered1);

subplot(1,2,1);
imshow(filtered2);
title('filtered2 imshow');
subplot(1,2,2);
imhist(filtered2);

subplot(1,2,1);
imshow(imshow_c1);
title('(c) first filter');
subplot(1,2,2);
imhist(imshow_c1);

subplot(1,2,1);
imshow(imshow_c2);
title('(c) second filter');
subplot(1,2,2);
imhist(imshow_c2);

% show msre
Y = filtered1;
filtered1_error = sqrt( sum(sum( (X-Y).*(X-Y) )))/N/M
Y = filtered2;
filtered2_error = sqrt( sum(sum( (X-Y).*(X-Y) )))/N/M
Y = imshow_c1;
imshow_c1_error = sqrt( sum(sum( (X-Y).*(X-Y) )))/N/M
Y = imshow_c2;
imshow_c2_error = sqrt( sum(sum( (X-Y).*(X-Y) )))/N/M
