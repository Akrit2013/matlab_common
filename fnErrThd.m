% Calc the threshold error between the prediction depth map and the ground truth

function rst = fnErrThd(pred, gt, level)

if nargin < 3
	level = 1;
end

[row, col] = size(pred);
[row_gt, col_gt] = size(gt);

if row ~= row_gt || col ~= col_gt
	disp('ERROR; The size of the prediction and ground truth are not match')
	return
end

v1 = pred ./ gt;
v2 = gt ./ pred;

fuse = max(v1, v2);
rst = sum(sum(fuse < 1.25^level)) / numel(gt);


end
