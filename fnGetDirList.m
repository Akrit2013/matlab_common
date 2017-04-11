% This function return the Dir list from the target path
% It will ommit the files and return a cell list

function dir_list = fnGetDirList(in_path)

raw_list = dir(in_path);
dir_list = repmat({[]}, 1, length(in_path));

counter = 1;
for i = 3:length(raw_list)
	fileinfo = raw_list(i);
	if fileinfo.isdir == false
		continue
	end
	if in_path(end) == '/'
		ff = [in_path, fileinfo.name];
    else
		ff = [in_path, '/', fileinfo.name];
	end
	dir_list(counter) = {ff};
    counter = counter + 1;
end
dir_list(counter:end) = [];

end
