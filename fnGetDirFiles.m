% This function return the file list from the target path
% It will ommit the subdirs and return a cell list

function file_list = fnGetDirFiles(in_path)

raw_list = dir(in_path);
file_list = repmat({[]}, 1, length(in_path));

counter = 1;
for i = 3:length(raw_list)
	fileinfo = raw_list(i);
	if fileinfo.isdir == true
		continue
	end
	if in_path(end) == '/'
		ff = [in_path, fileinfo.name];
    else
		ff = [in_path, '/', fileinfo.name];
	end
	file_list(counter) = {ff};
    counter = counter + 1;
end
file_list(counter:end) = [];

end
