function corr = myCorr( A, B )
% Calculates the correlation between two matrices
A = single(A);
B = single(B);
A_mean = mean2(A);
B_mean = mean2(B);
numerator_sum = 0;
denominator_sum1 = 0;
denominator_sum2 = 0;
[M, N] = size(B);
[M2, N2] = size(A);

if (M ~= M2)
    error('inputs not same size')
end

if (N ~= N2)
    error('inputs not same size')
end

for m = 1:M
    for n = 1:N
        numerator_sum = numerator_sum + (A(m,n) - A_mean)*(B(m,n) - B_mean);
        denominator_sum1 = denominator_sum1 + ((A(m,n) - A_mean)^2);
        denominator_sum2 = denominator_sum2 + ((B(m,n) - B_mean)^2);
    end
end

corr = numerator_sum / (sqrt(denominator_sum1*denominator_sum2));

end



