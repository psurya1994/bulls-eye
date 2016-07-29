function points_xy = be_points_cell2xy(points)
%BE_POINTS_CELL2XY takes the cells format as input and output in 2D matrix
%format

    points_xy = zeros(length(points)*length(points{1}),2);
    k = length(points{1});
    for i = 1:length(points)
        points_xy((i-1)*k+1:i*length(points{1}),:) = points{i};
    end

end

