clear all;
clc, close all
% warning off

% loading image
img = imread('data/test-3(1).png');
% img = imread('data/test-main.png');
figure, imshow(img)

%% Finding the mask for iris

% converting to gray
img2 = rgb2gray(img);

% Enhancing to find iris
H = fspecial('disk', 20);
img3 = imfilter(img2, H, 'replicate');
en = adapthisteq(img3);
bw = im2bw(en,0.25);
bw2 = ~bw;
bw3 = imfill(bw2, 'holes');
bw4 = imclearborder(bw3);
bw5 = bwmorph(bw4, 'erode', 10);
figure, imshow(bw5);

% Finding radius of iris
stats = regionprops(bw5, 'Centroid', 'Area', 'EquivDiameter');
if(length(stats)==1)
    disp('Mask has been accurately predicted.')
    radius = round(stats.EquivDiameter/2);
    disp(['Radius is ' num2str(stats.EquivDiameter/2) ' pixels'])
else
    disp('Mask was not detected. Exiting...')
    return
end

% Finding the mask
center = [485, 485];
safe_factor = 0.9;
mask = be_circular_mask(size(img,2), size(img,1), center(1), ...
                        center(2), radius*safe_factor);

%% Finding rings from the masked image

im = img2.*uint8(mask); % final masked image
% enhancement
en = adapthisteq(im);
en2 = adapthisteq(en);
% thresholding
bwr = im2bw(en2, 0.49);
bwr2 = bwareaopen(bwr, 5000);
bwr3 = bwmorph(bwr2, 'dilate', 2);
bwr4 = bwmorph(bwr3, 'erode', 2);
figure, imshow(bwr4)

%% 
close all
bwr5 = be_eliminate2(bwr4, center, 1);
figure, imshow(bwr5)
[points] = be_intersection_points2(bwr4, center, 12);