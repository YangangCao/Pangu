function fp_hash = bc_fp_file(filename)
try
    [audio, fs] = audioread(filename);
    
    FS = 8000;
    if fs ~= 8000
        audio = resample(audio, FS, fs);
    end
    
    isStereo = is_stereo(audio);
    
    if ~isStereo
        hash_normal = bc_fp_mono_au2hash(audio(:, 1), 0);
        hash_hp = bc_fp_mono_au2hash(audio(:, 1), 1);
        hash = unique([hash_normal; hash_hp], 'row');
        disp(strcat("Mono case:", filename));
    else
        audio_center = (audio(:,1) + audio(:,2))/2;
        audio_side = audio(:,1) - audio_center;

        
        hash_center_normal = bc_fp_mono_au2hash(audio_center, 0);
        hash_center_hp = bc_fp_mono_au2hash(audio_center, 1);
        hash_side_normal = bc_fp_mono_au2hash(audio_side, 0);
        hash_side_hp = bc_fp_mono_au2hash(audio_side, 1);
        
%         audio_left = audio(:,1);
%         audio_right = audio(:,2);     
%         hash_l_normal = bc_fp_mono_au2hash(audio_left, 0);
%         hash_l_hp = bc_fp_mono_au2hash(audio_left, 1);
%         hash_r_normal = bc_fp_mono_au2hash(audio_right, 0);
%         hash_r_hp = bc_fp_mono_au2hash(audio_right, 1);
        % hash = unique([hash_center_normal; hash_center_hp; hash_side_normal; hash_side_hp; hash_l_hp; hash_l_normal; hash_r_hp; hash_r_normal], 'row');
        hash = unique([hash_center_normal; hash_center_hp; hash_side_normal; hash_side_hp;], 'row');
    end
    fp_hash = sortrows(hash, 2);
catch
    fp_hash = 0;
    disp(strcat("Error on reading and fp gen: ", filename));
end

end