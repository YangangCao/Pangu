% high pass the spectrum
function spect_hp = hp_spect(spect)
B = [1, -1];
A = [1, -0.97];

spect = filter(B, A, spect');
spect_hp = spect';
end