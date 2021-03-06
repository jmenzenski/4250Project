function [S_one_sided,F,T,fundamental] = my_spectrogram(x,percent_overlap,nff,threshold,fs,max_frequency)

%-----------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SPECTROGRAMS
%--------------------------------------------

%STFT parameters

NFFT=nff;
window_length=nff;
window=hamming(window_length);
window = window(:);
overlap=floor(percent_overlap*window_length/100); %number of windows samples without overlapping

%construct spectrogram

[S,F,T] = spectrogram(x,window,window_length-overlap,NFFT,fs); %put a short imaginary part to obtain two-sided spectrogram
[Nf,Nw]=size(S);
S = thresholdMatrix(S,threshold);

% Show spectrograms

figtitle1 = 'Specrogram of a song file';
figure('name',figtitle1)
%---------------------------------------------

F_max = find(F <= max_frequency*2);
F = F(1:F_max(end));

t_epsilon=0.00001;
S_one_sided=max(S(1:fix(length(F)/2),:),t_epsilon); %keep only the positive frequency

pcolor(T,F(1:fix(length(F)/2)),10*log10(abs(S_one_sided))); 
shading interp;

colormap('jet');
title('Spectrogram: Original');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

fundamental = fundamental_finder(S_one_sided, F);

end