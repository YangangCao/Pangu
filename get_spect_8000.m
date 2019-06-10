function S = get_spect_8000(audio)

FRAME_SIZE = 1024;
OVERLAP_RATIO = 0.5;

window = blackman(FRAME_SIZE);

spect = spectrogram(audio, window, FRAME_SIZE*OVERLAP_RATIO);
spect = abs(spect);
spect(spect == 0) = 0.0000000001;
spect = 20*log10(spect);

%spectMax = max(spect(:)); % get maximum val
% 
% spect = max(spect, spectMax/1000); % filter out 100-40db component


S = spect;
end