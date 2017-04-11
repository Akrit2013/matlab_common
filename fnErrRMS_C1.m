% This is a C1 version of the RMS error measure
% This should be used in the Make3D dataset
% ============================================================
% Calc the RMS (root mean square error) between the prediction depth map and the ground truth

function rst = fnErrMSE_C1(pred, gt, C1)

if nargin < 3
	C1 = 70;
end

[row, col] = size(pred);
[row_gt, col_gt] = size(gt);

mask1 = gt >= C1;
mask2 = gt <= 0.5;
mask = mask1 | mask2;

gt(mask) = 1;
pred(mask) = 1;

vaild_num = numel(mask) - sum(mask(:));

if row ~= row_gt || col ~= col_gt
	disp('ERROR; The size of the prediction and ground truth are not match')
	return
end

val = (pred - gt) .^ 2;
val = sum(val(:)) ./ vaild_num;

rst = sqrt(val);

end
