clc;
clear;

a = 2;
b = 3;
c = 3;
tic
for i = 1: 4
    disp(i)
    try
        if i == 2
            a = d;
        else
            a = i;
            disp('equal');
        end
    catch
        disp('assign error!');
    end
end
toc
disp(a+b)