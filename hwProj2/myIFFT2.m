function out = myIFFT2( in )
%myIFFT2 my implementation of matlab's ifft2
%   Calculates the 2d inverse fourier transform
%   of the input matrix and returns the result
%   as an output matrix.
[M, N] = size(in);
real = 0;
imag = 0;
out = in;

for i = 1:M
    for j = 1:N
       for ii = 1:M
          for jj = 1:N
             real = real + (in(ii, jj) * cos(2 * pi * ((j * jj / N) + (ii * i / M)))) / sqrt(N * M);
             imag = imag + (in(ii, jj) * sin(2 * pi * ((j * jj / N) + (ii * i / M)))) / sqrt(N * M);
          end
       end
       out(i, j) = real + i * imag;
    end
end

end

