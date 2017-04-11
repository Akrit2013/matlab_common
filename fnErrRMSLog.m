% Calc the RMS log between the prediction depth map and the ground truth

function rst = fnErrMSELog(pred, gt)

[row, col] = size(pred);
[row_gt, col_gt] = size(gt);

if row ~= row_gt || col ~= col_gt
	disp('ERROR; The size of the prediction and ground truth are not match')
	return
end

val = (log10(pred) - log10(gt)) .^ 2;

rst = sqrt(mean(val(:)));


end
