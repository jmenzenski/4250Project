function [f,y] = fft_real(t,x)

%finds the fft of a real signal, with proper reordering

y = fftshift(fft(x));
Ts = t(2)-t(1);
Tp = Ts*length(x);
fp = 1/Tp;
N = length(x);

if(mod(N,2) == 0)
    f = [-(N/2-1):(N/2)]*fp;
else
    f = [-(N-1)/2:(N-1)/2]*fp;
end


end

