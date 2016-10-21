function out = myFFT2( in )
%myFFT - my implementation of matlab's fft2
%   calculates 2d fast fourier transform of
%   an input matrix and returns the 
%   fourier transformed representation 
%   of the input matrix

[M, N] = size(in);
real = 0;
imag = 0;
out = in;

for i = 1:M
    for j = 1:N
       for ii = 1:M
          for jj = 1:N
             %real = real + (in(ii, jj) * cos(2 * pi * ((j * jj / N) + (ii * i /
             %M))) / sqrt(N * M);
             %imag = imag + (in(ii, jj) * sin(2 * pi * ((j * jj / N) + (ii * i /
             %M))) / sqrt(N * M);
          end
          out(i, j) = real + i * imag;
       end 
    end
end

