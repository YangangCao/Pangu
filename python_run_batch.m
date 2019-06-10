% python control

function python_run_batch(folder)

folderpath = folder;

diarypath = '/home/baboo/Desktop/matlab_log.txt';

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

end