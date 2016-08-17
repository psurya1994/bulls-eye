function img_out = be_eliminate2(img, center, bool_plot)
% BE_ELIMINATE removes the rings that are only partial. It leaves the rings
% almost completed untouched.
% Uses the property of center to find that out.


    img_label = bwlabel(img);
    stats = regionprops(img, 'Centroid', 'Image');
    
    for i = 1:length(stats)
        if(pdist2(stats(i).Centroid, center)>150)
            img_label(img_label==i)=0;
        end
    end
    
    img_out = logical(img_label);
    
    if(bool_plot==true)
        figure, imshow(img_out);
    end
end