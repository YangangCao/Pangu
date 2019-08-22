% exe batch

clc;
clear;

basepath = '/media/baboo/ac139c16-d683-4132-b2f9-0a1f83695fbe/apm/apm-06/cezame-carte-blanche-ccb';

diarypath = '/home/baboo/Desktop/matlab_log.txt';

diary(diarypath);

diary on;
for i = 1:1
    fullnumber = 10000 + i;
    folder_index = num2str(fullnumber);
    folder_index = folder_index(2:5);
    folderpath = strcat(basepath, '/', folder_index);
    
    targetpath = strcat(folderpath, '_csv');
    
    disp('<<<--- Start!');
    disp('<<<--- Start!');
    tic;
    
    bc_fp_folder2csv(folderpath, targetpath);
    
    disp(strcat('Audio folder ->', folderpath));
    disp(strcat('Target folder is ->', targetpath));
    
    toc;
    disp('<<<--- Finished!');
    disp('<<<--- Finished!');
end
diary off;

% before 29, something went wrong