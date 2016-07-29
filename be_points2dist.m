function [ points_distance ] = be_points2dist(points, center)
%BE_POINTS2DIST converts point coordinates to distance from center
    
    points_distance = zeros(length(points),length(points{1}));
    % loop for each segment
    for i = 1:length(points)
        points_diff = points{i}-repmat(center,length(points{1}),1);
        points_distance(i,:) = sqrt(points_diff(:,1).^2 + points_diff(:,2).^2);
    end

end

