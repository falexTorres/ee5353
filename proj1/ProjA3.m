% Call: ProjA2.m
% Calculate mean-square-root error
% for original vs nearest neighbor
% reconstructed image.
% For class EE5353, UTSA Fall 2016
% Alex Torres (rkc870), 09/15/2016
    
% Read image 
s_dir = pwd;
cd Images;
 
X1 = imread('aivazovsky78g.tif', 'tif');   
[N, M] = size(X1);

cd(s_dir); 

% resample
N2 = N/2;
M2 = M/2;
X2 = X1(1:2:N, 1:2:M);

% reconstruct image
X3 = X2(ceil(0.5:0.5:N2), ceil(0.5:0.5:M2));

error = cast((X1 - X3), 'double');

msr = 0.0;
n = sqrt(N*M);
for i = 1:N
    for j = 1:M
        msr = msr + (error(i, j)/n)*(error(i,j)/n);
    end
end

msr = sqrt(msr) / n



