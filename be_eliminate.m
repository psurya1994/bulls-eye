function img_out = be_eliminate(img, bool_plot)
% BE_ELIMINATE removes the rings that have not been constructed properly.
% Uses the property of area to find that out.


    img_label = bwlabel(img);
    stats = regionprops(img, 'Area', 'FilledArea', 'Image');
    
    for i = 1:length(stats)
        if(stats(i).Area == stats(i).FilledArea)
            img_label(img_label==i)=0;
        end
    end
    
    img_out = logical(img_label);
    
    if(bool_plot==true)
        figure, imshow(img_out);
    end
end