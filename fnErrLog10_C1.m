% This is a C1 measure of the log10
% It should be used in the Make3D dataset
% -=================================================================
% Calc the mean log error between the prediction depth map and the ground truth

function rst = fnErrLog10_C1(pred, gt, C1)

if nargin < 3
	C1 = 70;
end

mask1 = gt>=C1;
mask2 = gt<=0.5;
mask = mask1 | mask2;

valid_num = numel(mask) - sum(mask(:));

gt(mask) = 1;
pred(mask) = 1;


[row, col] = size(pred);
[row_gt, col_gt] = size(gt);

if row ~= row_gt || col ~= col_gt
	disp('ERROR; The size of the prediction and ground truth are not match')
	return
end

val = abs(log10(pred) - log10(gt));
val(mask) = 0;

rst = sum(val(:)) / valid_num;

end
