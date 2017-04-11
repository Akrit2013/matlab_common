% This function take two datalist as input, A and B
% If the string contained in A is a part of a string in B, these two strings
% will be matched as a pair
%
% The return value is a list of struct with a and b elements

function rst = fnMatchDatalist(list_a, list_b)

len_a = length(list_a);
len_b = length(list_b);

len = min(len_a, len_b);

if len_a ~= len_b
	fprintf('WARNING: The length of input list A and list B are not the same. %d vs %d\n', len_a, len_b);
end

% Init the rst
st.a = [];
st.b = [];
rst = repmat(st, [len, 1]);

% Iter the list_a to find the matched string in list_b
empty_idx_list = [];
for i = 1:len
	str = list_a{i};
	[matched_str, idx] = fnFindMatchedString(str, list_b);
	if idx == 0
		empty_idx_list = [empty_idx_list, i];
		fprintf('WARNING: Can not find the matched string for %s\n', str);
		continue;
	end
	list_b(idx) = [];
	rst(i).a = str;
	rst(i).b = matched_str;
end

% Delete the empty entries
rst(empty_idx_list) = [];


end


% ================ Sub function ===================
function [matched_str, idx] = fnFindMatchedString(str, list_str)

% Get the pure name of the str
[prefix, pure_name, ext] = fileparts(str);
idx = 0;
matched_str = [];

% Iter the list str
for i = 1:length(list_str)
	str1 = list_str{i};
	[prefix, pure_name1, ext] = fileparts(str1);
	% Check if the pure_name in the pure_name1
	val1 = strfind(pure_name1, pure_name);
    val2 = strfind(pure_name, pure_name1);
	if ~isempty(val1) || ~isempty(val2)
		matched_str = str1;
		idx = i;
		break;
	end
end

end
