% This function take the depth map matrix as the input, since the
% bfilter2.m can only take the matrix with the dimension [m, n, 1]
% or [m, n, 3]
% and the pixel value must within the [0, 1]
%
% This function will first convert the image into [0, 1] and also
% converted back after the filter
%
% If the size of weight is different from the size of the img
% the weight should be resized


function rst = fnBfilter2(img, weight, w, sigma)
img = double(img);
weight = double(weight);

% Check the size of weight
[row, col, plan] = size(img);
if row ~= size(weight, 1) || col ~=size(weight, 2)
	weight = imresize(weight, [row, col]);
end

% Normalize the map into [0. 1]
max_pixel = max(img(:));
min_pixel = min(img(:));

max_weight = max(weight(:));
min_weight = min(weight(:));

img = img - min_pixel;
img = double(img) / (max_pixel - min_pixel);

weight = weight - min_weight;
weight = double(weight) / (max_weight - min_weight);

% Filter
filted_img = jbfilter2(img, weight, w, sigma);

% Convert the image back
filted_img = filted_img * (max_pixel - min_pixel);
filted_img = filted_img + min_pixel;

rst = filted_img;

end
