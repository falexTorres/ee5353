% Read imshow 
s_dir = pwd;
cd Images;
 
N=256;
fid1=fopen('lena.raw','rb'); 
X1=fread(fid1,[N,N]); fclose(fid1);  clear fid1; X1=uint8(X1'); 

cd(s_dir); 

% display imshows
subplot(1,2,1);
imshow(X1);