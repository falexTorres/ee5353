% PART (A) OF PROJECT TEST 2 / Grigoryan - EE5353 / FALL 2016
% Project Test 2 consists of 
% applying Wiener filtering techniques
% to blurred and noise-induced images.

%%%% 1. Process image “lena”-image degraded by a smooth filter.  %%%%
s_dir = pwd;
cd Images; 
N=256;
% open original image
fid1=fopen('lena.raw','rb'); 
o=fread(fid1,[N,N]); fclose(fid1);  clear fid1; o=o'; 
cd(s_dir);
% apply smoothing filter to original image
h = (1 / 16) * [0 0 0 0 0; 0 1 2 1 0; 0 2 4 2 0; 0 1 2 1 0; 0 0 0 0 0];
b = myConv2(o, h);

%%%% 2. Generate the normal distribution noise-image, n(n, m), %%%%
%%%%    with mean 0 and standard deviation 4.                  %%%%
%%%%    Add the noise-image to the blur ‘lena’ image.           %%%%
[N, M] = size(b);
n = rand(N, M)*16;
% add noise to blurred image
i = double(n) + double(b);

%%%% 3. Compute the transfer functions of the smooth H(?) and  %%%% 
%%%%    Wiener filters, Y(?), ? = (?1, ?2).                    %%%%
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
N = myFFT2(double(n));
O = myFFT2(double(o));
Y = myWiener2(double(H), double(N), double(O));

%%%% 4. Apply the Wiener filter to the DFT of the degraded image,  %%%%
%%%%    which is I(?) = O(?)H(?) + N(?).                           %%%% 
I = myFFT2(double(i));
R = Y .* I;
r = fftshift(myIFFT2(double(R)));
% optional smoothing filter for output
h = (1 / 16) * [0 0 0 0 0; 0 1 2 1 0; 0 2 4 2 0; 0 1 2 1 0; 0 0 0 0 0];
r = myConv2(double(r), double(h));

%%%% 5. Compute errors of blurring, degradation, and filtration.  %%%%
msr_blurring = msr_error(b, o)
msr_degradation = msr_error(i, o)
msr_filtration = msr_error(real(r), o)

%%%% 5a. Display results.  %%%%
subplot(2,2,1);
imshow(uint8(o));
title('original image');
subplot(2,2,2);
imshow(uint8(b));
title('blurred image');
subplot(2,2,3);
imshow(uint8(i));
title('blurred image + noise');
subplot(2,2,4);
imshow(uint8(r));
title('restored with Wiener filter');
figure
%%%% 5b. Display on the next figure two meshes 20 log |H(?1, ?2)|  %%%% 
%%%%     and 20 log |Y(?1, ?2)+ 0.0001|.                           %%%%
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