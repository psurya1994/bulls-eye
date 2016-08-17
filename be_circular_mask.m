function [circlePixels] = be_circular_mask(imageSizeX, imageSizeY, ...
                                            centerX, centerY, radius)
%BE_CIRCULAR_MASK to create a circular mask

    % First create the image.
    [columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
    circlePixels = (rowsInImage - centerY).^2 ...
        + (columnsInImage - centerX).^2 <= radius.^2;

end

