% Read image 
s_dir = pwd;
cd Images;
X = imread('aivazovsky78g.tif', 'tif');   
X = double(X);
cd(s_dir); 

% define smoothing filters
h1 = (1 / 13) * [0 0 1 0 0; 0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 0 0 1 0 0];
h1 = double(h1);
%X = double(X);
Y = fft2(h1);
h1 = horzcat(h1, zeros(5,3))
h1 = vertcat(h1, zeros(3,8))
Y1 = myFFT2(h1);
Y
Y1