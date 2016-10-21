function out = myFFT( in )
%myFFT - my implementation of matlab's fft
%   calculates fast fourier transform of
%   an input array and returns the 
%   fourier transformed representation 
%   of the input array

out = in;
[M, N] = size(in);

if N == 1
    return;
end

signal1 = zeros(round(N/2));
signal2 = zeros(round(N/2));
x = 0;
y = 0;
for m = 1:1:N
   if mod(m,2) == 0
       signal1(x) = in(m); 
       x = x + 1;
   end
end
for n = 2:1:N
    if mod(n,2) == 1
        signal2(y) = in(n);
        y = y + 1;
    end
end

evens = myFFT(signal1);
odds = myFFT(signal2);

merged = zeros(N);

for k = 1:N/2
   merged(k) = evens(k) + twiddle(k, N) * odds(k);
   merged(k + N/2) = evens(k) -twiddle(k, N) * odds(k);
end

out = merged;

end