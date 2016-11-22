% apply smoothing filter to lena image
% to create blurred lena image
s_dir = pwd;
cd Images;
 
N=256;
fid1=fopen('lena.raw','rb'); 
o=fread(fid1,[N,N]); fclose(fid1);  clear fid1; o=o'; 
cd(s_dir);

% [N, M] = size(o);
% h = zeros(N, M);
% h(128, 128) = 4;
% h(128, 127) = 2;
% h(128, 129) = 2;
% h(127, 127) = 1;
% h(127, 128) = 2;
% h(127, 129) = 1;
% h(129, 127) = 1;
% h(129, 128) = 2;
% h(129, 129) = 1;
% h = h / 16;

h = (1 / 16) * [0 0 0 0 0; 0 1 2 1 0; 0 2 4 2 0; 0 1 2 1 0; 0 0 0 0 0];
b = myConv2(double(o), h);

% display imshows
subplot(1,2,1);
imshow(uint8(o));
title('original image');
subplot(1,2,2);
imshow(uint8(b));
title('smooth filter');

imwrite(uint8(b), './Images/blurred_lena.tif');

% mse
mean2((double(o) - double(b)).^2)