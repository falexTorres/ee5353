% Call: ProjA1.m
% Downsample an image by 2x2 using 
% the nearest neighbor algorithm.
% For class EE5353, UTSA Fall 2016
% Alex Torres (rkc870), 09/15/2016

% Read thresholded images 
s_dir = pwd;
cd Images;

Y = imread('5.3.02.tiff', 'tiff'); 
original = Y;
Y = Y(:,:,1);
X = imread('target_A1v.tiff', 'tiff');
X = X(:,:,1);
[N2, M2] = size(X);

cd(s_dir);

% get cropped image from big image
Y1 = Y(1:1:N2, 1:1:M2);
myCorr(X,Y1)
corr2(X, Y1)