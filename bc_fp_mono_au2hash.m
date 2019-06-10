% audio2hash function

function hash = bc_fp_mono_au2hash(audio, hp_control)

dialation = [70, 30];
time = dialation(1) + 10;
freq = floor(dialation(2)/2 + 10);

% VIP: audio must be mono


% get spectrum
spect = get_spect_8000(audio);

% apply filter to spectrum
if hp_control
    spect = hp_spect(spect);
end


tmaxes = find_max_point(spect, dialation);
hash = max_to_hash(tmaxes, time, freq);

end