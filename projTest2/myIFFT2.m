function out = myFFT2( in )
%myFFT - my implementation of matlab's fft2
%   calculates 2d fast fourier transform of
%   an input matrix and returns the 
%   fourier transformed representation 
%   of the input matrix

[M, N] = size(in);
out = in;

rowz = zeros(1, N);
colz = zeros(M, 1);

for u = 1:M
    % for each row do 1d fft
    row = ifft(in(u,:));
    rowz = vertcat(rowz, row);
end

for v = 1:N
   % using result from fft rows
   % do 1d fft on each column
   col = ifft(rowz(2:M+1,v));
   colz = horzcat(colz, col);
end

out = colz(:, 2:N+1);

end

