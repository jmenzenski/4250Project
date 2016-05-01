function [t,x] = ifft_real(f,y)

% returns the original signal from the fourier transform of the real
% signal. 
fp = f(2)-f(1);
N = length(f);
fs = N*fp;
Ly = length(y);

x = ifft(ifftshift(y));
t = [0:(N-1)]*(1/fs);

end

