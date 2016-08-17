%% Code to detect the Placido rings on sphere for bulls eye
% 
% This is the algorithm for the Srujana Innovation Center project, Bulls 
% Eye expected to be a low-cost hand held corneal topography device.
% 
% Written by Surya Penmetsa on 04-8-2016


% Setting things up
clear all, close all

%% Loading the input image
a = imread('data/test-main.png');

% Convering to grayscale
a = rgb2gray(a);

%% Preprocessing
% enhancement
bw = be_preprocess(a, true);

% this step will not be required after proper illumination from input:
% removing non-properly detected rings
bw = be_eliminate(bw, true);

%% Detecting intersection points
center = [337, 355]; % calculated from analysing intersection_points
segments = 24;

% Finding the points on the topography
points = be_intersection_points(bw, center, segments);

%% Finding the distance of the points from center
points_distance = be_points2dist(points, center);

% Plotting the topography on non-intuitive axis
figure, imagesc(points_distance)
xlabel('ring number')
ylabel('segment number')
title('color represents the distance in pixels from center')

%% Converting distance to centimeter scale
% yet to be done

%% Plotting the topography of the front of the sphere

% Gathering all points in the format (x,y)
points_xy = be_points_cell2xy(points);
points_xy_rel = points_xy-repmat(center,numel(points_distance),1);
points_distance_xy = points_distance';
points_distance_xy = points_distance_xy(:);


%% Plotting the 3D reconstructed surface

x = points_xy_rel(:,1);
y = points_xy_rel(:,2);
z = points_distance_xy;

% Scatter plot
figure, plot3(x, y, z, 'r.');
xlabel('x'), ylabel('y'), zlabel('z')

% Mesh plot
tri = delaunay(x,y);
[r,c] = size(tri);
figure, trisurf(tri, x, y, z)
axis off, grid off

% Use the following lines if you're using the latest version (2016a or
% above)

% [xq, yq] = meshgrid(min(points_xy_rel(:,1)):1:max(points_xy_rel(:,1)), ...
%                     min(points_xy_rel(:,2)):1:max(points_xy_rel(:,2)));
%                 
% vq = gridpoint(points_xy_rel(:,1), points_xy_rel(:,2), points_distance(:), xq, yq);
% figure, mesh(xq, yq, vq);
