function [ W ] = myWiener2( H, N, O )
%myWiener2 returns wiener filter
%   Given transfer function of LTI system H, noise image, and
%   original image, the function then returns the transfer function of 
%   the derived 2D Wiener filter
    
    % compute power spectral densities
    phi_N = mean2(abs(N).^2);
    phi_O = mean2(abs(O).^2);
%     phi_n = fft2(xcorr2(n));
%     phi_o = fft2(xcorr2(o));
%     phi_n = phi_n(1:N, 1:M);
%     phi_o = phi_o(1:N, 1:M);
    phi = phi_N ./ phi_O;
  
    % return transfer function of Wiener filter
    W = conj(H) ./ ((abs(H).^2) + phi);
end

