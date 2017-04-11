% Calc the mean log error between the prediction depth map and the ground truth

function rst = fnErrLog10(pred, gt)

[row, col] = size(pred);
[row_gt, col_gt] = size(gt);

if row ~= row_gt || col ~= col_gt
	disp('ERROR; The size of the prediction and ground truth are not match')
	return
end

val = abs(log10(pred) - log10(gt));

rst = mean(val(:));
end
