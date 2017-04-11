% Get the pure name of the full name
% For example
%	input: /fdsa/egasd3/addc.g
%	out: addc.g
% if '/' not exist, return the original str

function rst = fnGetPureName(in_str)

slash_idx = findstr(in_str, '/');
if isempty(slash_idx)
	rst = in_str;
else
	rst = in_str(slash_idx(end)+1: end);
end


end
