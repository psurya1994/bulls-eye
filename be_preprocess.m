function [ img_out ] = be_preprocess(img, bool_plot)
%BE_PREPROCESSING This takes grayscale image of the rings as input and
%finds the thresholded image with rings marked

    % blurring
    H = fspecial('disk',10);
    img = imfilter(img, H, 'replicate');
    
    if(bool_plot==true)
        figure, imshow(img);
    end

    % adaptive thresholding
    bw = adaptivethreshold(img,20,0.015,0);
    if(bool_plot==true)
        figure, imshow(~bw);
    end
    
    % series of morphological operations
    bw = bwareaopen(~bw, 350);
    bw = bwmorph(bw, 'erode', 1);
    img_out = bwareaopen(bw, 1000);
    
    if(bool_plot==true)
        figure, imshow(img_out);
    end
    
    % Canny edge detector and output
    bw_ed = edge(bw, 'canny');
    if(bool_plot==true)
        figure, imshow(bw_ed);
    end
end

