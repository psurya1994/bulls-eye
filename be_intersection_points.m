function [points] = be_intersection_points(img, center, segments)
%INTERSECTIONPOINTS This function returns the intersection points between
%an thresholded image and lines drawn from the center at various angles.
% 
% Inputs:
% img -> input image
% center -> center of the rings through which the lines have to be drawn
% segments -> number of segments for the line drawn
%   typical value of segments has to be between 2 and 30.
% 
% Outputs:
% points -> coordinates of the intersection points


    len = size(img, 1);
    bre = size(img, 2);
    
    
    points = cell(segments,1);
    % looping through all segments
    i = 1;
    for theta = 0:360/segments:359
%     for theta = 70
        theta_rad = theta*pi/180;
        disp(['Processing ' num2str(i) 'th segment'])
        search_point = center;
        r = 1; % step size for search point
        prev_spvalue = false; % previous search point value
        while(inside_bounds_sp(search_point, size(img))==true)
            
            if(img(search_point(1), search_point(2)) == ~prev_spvalue)
                points{i} = [points{i}; search_point];
                prev_spvalue = ~prev_spvalue;
            end
            % update search point
            search_point = center + ...
                        [floor(r*sin(theta_rad)), floor(r*cos(theta_rad))];
            r = r + 1;
        end
        i = i + 1;
    end

    % Plotting the dots
    bool_plot = true;
    if(bool_plot == true)
        figure, imshow(img)
        for j = 1:length(points)
            hold on, plot(points{j}(:,2),points{j}(:,1), 'b.')
        end
    end
    
end

function in = inside_bounds_sp(point, img_size)
% INSIDE_BOUNDS_SP function returns if a search given point is inside the 
% bounds of the image.

    if(point(1)>0 && point(1)<img_size(1) ...
       && point(2)>0 && point(2)<img_size(2))
        in = true;
    else
        in = false;
    end
    
end

