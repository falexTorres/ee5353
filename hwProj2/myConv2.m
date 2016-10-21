function out = myConv2( image, kernel )
%myConv2 - my implementation of matlab's conv2
%   Calculates 2d convolution of two input matrices
%   and returns the resultant matrix.
%   A must be image and B must be kernel.
[N M] = size(image);
[n m] = size(kernel);
%kernel = kernel / sum(sum(kernel));
% rotate kernel
kernel = kernel(n:-1:1, m:-1:1);
% windowed convolution
out = image;

for i = 3:N-2
    for j = 3:M-2
        part1 = image(i-2:1:i+2, j-2:1:j+2);
        out(i, j) = sum(sum(part1.*kernel));
    end
end

out = round(out);

end

