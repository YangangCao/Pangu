function y = is_stereo(audio_stream)

[~, num_channel] = size(audio_stream);

if num_channel == 1
    y = 0;
else
    test = audio_stream(:, 1) - audio_stream(:, 2);
    if max(abs(test))< 0.001
        % audio is too narrow
        y = 0;
    else
        % good stereo
        y = 1;
    end
    
end
end