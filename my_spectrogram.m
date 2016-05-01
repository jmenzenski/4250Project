function [y] = my_spectrogram(x,Nx,sections,percent_overlap,nff,threshold)
Nx = length(x);
nsec = nff;
nov = floor(nsec*percent_overlap/100);

y = spectrogram(x,hamming(nsec),nov,nff);

spectrogram(y,'yaxis');
end