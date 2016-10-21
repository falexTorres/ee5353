function out = myConv( A, B )
%myConv - my implementation of matlab's conv2
%   calculates 2d convolution of two input matrices
%   and returns the resultant matrix
image = A;
window = B;
[a, b] = size(A);
[c, d] = size(B);
if (a < c && b < d)
    image = B;
    window = A;
end

[rows, cols] = size(image);
[kRows, kCols] = size(window);

% find center position of kernel (half of kernel size)
kCenterX = round(kCols / 2);
kCenterY = round(kRows / 2);

kCenterX = uint64(kCenterX);
kCenterY = uint64(kCenterY);
rows = uint64(rows);
cols = uint64(cols);
kRows = uint64(kRows);
kCols = uint64(kCols);

% for i = 1:rows
%   for j = 1:cols
%       for ii = 1:kRows
%           for jj = 1:kCols
%               conv_sum = conv_sum + image(i + ii, j + jj) * window(ii + kCenterX, jj + kCenterY);
%           end
%       end
%       out(i, j) = conv_sum;
%   end
% end        
conv_sum = 0;
weight_sum = 0;
out = image;
%convolution loop
for i = 1:rows          % rows
    for j = 1:cols          % columns
        for m = 1:kRows     % kernel rows
 
            mm = kRows - m;      % row index of flipped kernel

            for n = 1:kCols % kernel columns
            
                nn = kCols - n;  % column index of flipped kernel

                % index of input signal, used for checking boundary
                ii = i + (m - kCenterY);
                jj = j + (n - kCenterX);

                % ignore input samples which are out of bound
                if( ii > 0 && ii <= rows && jj > 0 && jj <= cols && mm > 0 && nn > 0)
                    
                    conv_sum = conv_sum + image(ii, jj) * window(mm, nn);
                    weight_sum = weight_sum + window(mm, nn);
                    
                end
            end
        end
        out(i, j) = conv_sum / weight_sum;
    end
end


end

