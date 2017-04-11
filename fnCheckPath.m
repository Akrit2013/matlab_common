% This function check the given path
% If not exist, create one

function rst = fnCheckPath(target_path, is_create)

if nargin < 2
	is_create = true;
end

if iscell(target_path) && length(target_path) == 1
    target_path = target_path{1};
end

if ~exist(target_path, 'dir')
	rst = false;
	if is_create
		mkdir(target_path);
	end
else
	rst = true;
end



end
