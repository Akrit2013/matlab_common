% This function take a full path and the condidate path as input
% it replace the path with the candidate path, and return the new file
%
% For example:
% fnReplacePath('aaa/bb/c.mat','new/path')
% The result is: new/path/c.mat

function rst = fnReplacePath(full_path, cand_path)

[p, f, ext] = fileparts(full_path);

if cand_path(end) == '/'
	rst = [cand_path, f, ext];
else
	rst = [cand_path, '/', f, ext];
end

end
