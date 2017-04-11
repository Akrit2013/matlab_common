% This function will save a txt cell list to a txt file

function rst = fnSaveTxtList(file_name, txt_list)

% Open the file
fp = fopen(file_name, 'w');

for i = 1:length(txt_list)
	str = txt_list{i};
	%if str(end) ~= '\n'
	%	str = [str, '\n'];
	%end
	fprintf(fp, '%s\n', str);
end

fclose(fp);
end
