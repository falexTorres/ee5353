% compute transfer functions of smoothing filter
% and Wiener filter
s_dir = pwd;
cd Images;
% read images
N=256;
fid1=fopen('lena.raw','rb'); 
o=fread(fid1,[N,N]); fclose(fid1);  clear fid1; o=o'; 
n = imread('n_image.tif');
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

% obtain transfer function of Wiener filter
W = myWiener2(H, double(n), double(o));


