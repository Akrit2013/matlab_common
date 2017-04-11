% This function can replace the extend name of the given file name

function rst = fnReplaceExt(in_str, ext_str)

[a, b, c] = fileparts(in_str);

if ext_str(1) ~= '.'
	ext_str = ['.', ext_str];
end

if isempty(c)
	fprintf('WARNING: %s has no extend name.\n', in_str);
end

rst = [fullfile(a, b), ext_str];


end
