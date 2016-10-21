% Read image 
s_dir = pwd;
cd Images;
 
X = imread('aivazovsky78g.tif', 'tif');   
[N, M] = size(X);

cd(s_dir); 

% define smoothing filters
h1 = (1 / 13) * [0 0 1 0 0; 0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 0 0 1 0 0];
h2 = (1 / 10) * [0 0 1 0 0; 0 0 1 0 0; 1 1 2 1 1; 0 0 1 0 0; 0 0 1 0 0];

% test convolution
filtered = conv2(single(X), single(h1));
myFiltered = myConv2(single(X), single(h1));
% convert results back to uint8
filtered = uint8(filtered);
myFiltered = uint8(myFiltered);
filtered = filtered(1:1:N, 1:1:M);
% display images
subplot(1,2,1);
imshow(filtered);
subplot(1,2,2);
imshow(myFiltered);

size(filtered)
size(myFiltered)