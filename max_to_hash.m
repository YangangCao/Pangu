% max point to fp

function hash = max_to_hash(tmaxes, time, freq)
DEL_TIME = time;
DEL_FREQ = freq; % bilateral

fingerprint = [0, 0];
% build up fingerprints
len_max = length(tmaxes);
for i = 1:len_max
    tmp_finger = [0, 0];
    for j = 1:100 % check onehundred points
        if i+j <= len_max
            freq1 = tmaxes(i, 1);
            freq2 = tmaxes(i+j, 1);
            freq_del = freq2 - freq1;
            t1 = tmaxes(i, 2);
            t2 = tmaxes(i+j, 2);
            t_del = t2 - t1;
            
            if t_del < DEL_TIME && abs(freq_del)<DEL_FREQ
                id = freq1*10^6 + freq2*10^3 + t_del;
                tmp_finger = [tmp_finger; [id, t1]];
            end
        end
    end
    fingerprint = [fingerprint; tmp_finger(2:end,:)];
end
fingerprint = fingerprint(2:end,:);

hash = fingerprint;
end