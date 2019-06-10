
function bc_fp_folder2csv(folderpath, targetpath)

% prepare files
folder_path = strcat(folderpath,'/');
file_list = dir(folder_path);
numFile = length(file_list);

parfor i = 1: numFile
    [~, name, ext] = fileparts(file_list(i).name);
    % if (strcmp(ext,'.mp3') || strcmp(ext,'.wav') || strcmp(ext,'.m4a'))
    if (strcmp(ext,'.wav'))
         tmp_path = strcat(folder_path, name, ext);
         try
             writing_path = strcat(targetpath, '/', name, '.csv');
             fp_hash = bc_fp_file(tmp_path);
             if fp_hash(1, 1) ~= 0
                 dlmwrite(writing_path, fp_hash, 'precision', 32, 'delimiter', ',');
                 disp(strcat('Finish file: ', tmp_path));
             end
         catch
             disp(strcat('Error for file: ', tmp_path));
         end
    end
end
disp(strcat("Process is Finished for: ", folder_path));
