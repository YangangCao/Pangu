% test spect noise
clc;
clear;

A = rand(10, 10);
A(3:7, 4:8) = 0;

A(A == 0) = 0.00000001;

disp(A);
imagesc(A(3:7, 4:8))
