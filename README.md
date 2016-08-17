# Bulls Eye: A Portable Corneal Topograpy Device

This is the algorithm for the Srujana Innovation Center project, Bulls Eye expected to be a low-cost hand held corneal topography device.

The code here needs the following functions from MATLAB file exchange to be imported. 
- Adaptive Threshold by Guanglei Xiong ([link](http://in.mathworks.com/matlabcentral/fileexchange/8647-local-adaptive-thresholding))
- Surf from Scatter by ([link](https://www.mathworks.com/matlabcentral/fileexchange/5105-making-surface-plots-from-scatter-data))

Run the m-file be_main_sphere.m to see the results for a sphere image.
Run the m-file be_main_eye.m to see the results for a eye image.

The code has been tested in MATLAB 2014a.

This yet to be done:
- geometry compensation for getting the right surface ([link](Halstead, Mark A., et al. "Reconstructing curved surfaces from specular reflection patterns using spline surface fitting of normals." Proceedings of the 23rd annual conference on Computer graphics and interactive techniques. ACM, 1996.))
- interpolate instead of removing full circles (done in be_eliminate.m)
