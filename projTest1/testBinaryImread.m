s_dir = pwd;
cd Images; 

Y = imread('5.03.02.bmp'); 
X = imread('target_A1v.bmp');
cd (s_dir);

subplot(1, 2, 1);
imshow(Y);

subplot(1, 2, 2);
imshow(X);

