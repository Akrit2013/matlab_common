% Calc the MARE between the prediction depth map and the ground truth

function rst = fnErrMARE(pred, gt)

[row, col] = size(pred);
[row_gt, col_gt] = size(gt);

if row ~= row_gt || col ~= col_gt
	disp('ERROR; The size of the prediction and ground truth are not match')
	return
end

val = abs(pred - gt) ./ gt;

rst = mean(val(:));

end
