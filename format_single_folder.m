% deal with a folder in which it contains audiofiles

clc;
clear;

% CONFIGURATION
% must be clear about folder and 
folderpath = '/Users/baboo/tmp/001';
diarypath = '/Users/baboo/tmp/matlab_log.txt';
% folderpath = ...

% By default, there should be a _csv folder
targetpath = strcat(folderpath, '_csv');

diary(diarypath);

diary on;
disp('<<<--- Start!');
disp('<<<--- Start!');
tic;

disp(strcat('Audio folder ->', folderpath));
disp(strcat('Target folder is ->', targetpath));

toc;
disp('<<<--- Finished!');
disp('<<<--- Finished!');
diary off;

