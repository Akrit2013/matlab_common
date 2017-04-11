% This is a C1 version of the MARE (rel) err measures
% Any pixel larger than or equal to C1 will be invailed
% This measure should be used in Make3d dataset
% =========================================================
% Calc the MARE between the prediction depth map and the ground truth

function rst = fnErrMARE_C1(pred, gt, C1)

if nargin < 3
	C1 = 70;
end

[row, col] = size(pred);
[row_gt, col_gt] = size(gt);

mask1 = gt>=C1;
mask2 = gt<=0.5;
mask = mask1 | mask2;

vaild_num = numel(mask) - sum(mask(:));

gt(mask) = 1;
pred(mask) = 1;

if row ~= row_gt || col ~= col_gt
	disp('ERROR; The size of the prediction and ground truth are not match')
	return
end

dif = abs(pred - gt) ./ gt;
dif(mask) = 0;

sum_dif = sum(dif(:));
rst = sum_dif / vaild_num;

end
