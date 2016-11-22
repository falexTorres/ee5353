% compute transfer functions of smoothing filter
% and Wiener filter
s_dir = pwd;
cd Images;
% read images
N=256;
fid1=fopen('lena.raw','rb'); 
o=fread(fid1,[N,N]); fclose(fid1);  clear fid1; o=o'; 
n = imread('n_image.tif');
b = imread('blurred_lena.tif');
i = imread('noisy_lena.tif');
cd(s_dir);

h = zeros(N, N);
h(128, 128) = 4;
h(128, 127) = 2;
h(128, 129) = 2;
h(127, 127) = 1;
h(127, 128) = 2;
h(127, 129) = 1;
h(129, 127) = 1;
h(129, 128) = 2;
h(129, 129) = 1;
h = h / 16;

% obtain transfer function of smoothing filter
H = myFFT2(double(h));
I = myFFT2(double(i));
N = myFFT2(double(n));
O = myFFT2(double(o));
% obtain transfer function of Wiener filter
Y = myWiener2(double(H), double(N), double(O));
% apply Wiener filter to degraded image
R = Y .* I;
r = fftshift(myIFFT2(double(R)));

h = (1 / 16) * [0 0 0 0 0; 0 1 2 1 0; 0 2 4 2 0; 0 1 2 1 0; 0 0 0 0 0];
r = myConv2(double(r), double(h));
% show mesh plots
H_mesh = 20 * log(abs(H));
Y_mesh = 20 * log(abs(Y) + 0.0001);
subplot(1,2,1);
mesh(H_mesh);
axis([0,300,0,300,-400,0]);
title('smoothing filter');
subplot(1,2,2);
mesh(Y_mesh);
axis([0,300,0,300,-200,100]);
title('Wiener filter');
% display results
% subplot(2,2,1);
% imshow(uint8(o));
% title('original image');
% subplot(2,2,2);
% imshow(uint8(b));
% title('blurred image');
% subplot(2,2,3);
% imshow(uint8(i));
% title('blurred image + noise');
% subplot(2,2,4);
% imshow(uint8(r));
% title('restored with Wiener filter');


