% converts images from grayscale
% to binary using matlab's
% thresholding function.

s_dir = pwd;
cd Images; 

Y = imread('5.3.02.tiff', 'tiff'); 
Y = Y(:,:,1);
X = imread('target_A1v.tiff', 'tiff');
X = X(:,:,1);

% threshold both images
%X = im2bw(X, 0.5);
%Y = im2bw(Y, 0.5); % corr > 0.05 && corr > 0.2 
X = im2bw(X, 0.35); % corr > ? && corr > ?
Y = im2bw(Y, 0.45);

%imwrite(Y, '5.03.02.bmp');
%imwrite(X, 'target_A1v.bmp');
cd(s_dir);
X1 = imresize(X,0.4);
figure, imshow(Y);
figure, imshow(X);
figure, imshow(X1);
size(Y)
size(X)
size(X1)


