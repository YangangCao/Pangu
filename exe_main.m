%% test unit
clc;
clear;

test_music = '/Users/caoyangang/tmp/weibo/000gCDZFlx07kqwOg82I01040200tqd90k010.mp3';
[audio, fs] = audioread(test_music);
hp_control = 1;

dia = 30;
time = 40;
freq = 20;
%hash = bc_fp_mono_au2hash(audio(:,1), fs, hp_control, 30, 40, 20);
fp_hash = bc_fp(test_music, dia, time, freq);

disp("Finished!")
%% test fp gen
clc;
clear;

folderpath = '/media/caoyangang/ac139c16-d683-4132-b2f9-0a1f83695fbe/song_json/divide_by_provider/Cezame & Gum/0003';

diarypath = '/Users/caoyangang/Desktop/matlab_log.txt';

targetpath = strcat(folderpath, '_csv');

diary(diarypath);

diary on;
disp('<<<--- Start!');
disp('<<<--- Start!');
tic;

bc_fp_folder2csv(folderpath, targetpath);

disp(strcat('Audio folder ->', folderpath));
disp(strcat('Target folder is ->', targetpath));

toc;
disp('<<<--- Finished!');
disp('<<<--- Finished!');
diary off;


