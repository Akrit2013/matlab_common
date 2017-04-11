% Calc the RMS (root mean square error) between the prediction depth map and the ground truth

function rst = fnErrMSE(pred, gt)

[row, col] = size(pred);
[row_gt, col_gt] = size(gt);

if row ~= row_gt || col ~= col_gt
	disp('ERROR; The size of the prediction and ground truth are not match')
	return
end

val = (pred - gt) .^ 2;
val = mean(val(:));

rst = sqrt(val);

end
