function tmaxes = find_max_point(S, dialation)

% row colomn control
SE = strel('rectangle', dialation);
spect_dilate = imdilate(S, SE);
max_thresh = max(max(S))*0.001;
[ROW, COL] = find(S == spect_dilate & S>max_thresh);
max_position = [ROW, COL];

% sort maximum points based on time
tmaxes = sortrows(max_position,2);
end