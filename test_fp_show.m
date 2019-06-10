clc;
clear;

audio_path = '/Users/caoyangang/Desktop/test/Project.wav';

[audio, fs] = audioread(audio_path);

audio = (audio(:, 1) + audio(:, 2))/2;

%audio(1000000:2000000,1) = 0;

audio = resample(audio, 8000, fs);
fs = 8000;

%disp()

% constants
dialation = [60, 30];
time = dialation(1) + 10;
freq = floor(dialation(2)/2 + 10);

S = get_spect_8000(audio);

%S = hp_spect(S);

tmaxes = find_max_point(S, dialation);
hash = max_to_hash(tmaxes, time, freq);

hold on
imagesc(S);
scatter(tmaxes(:,2),tmaxes(:,1));
%hold off

disp(length(hash));