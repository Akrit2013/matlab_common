% This function load the datalist txt file into a cell list

function rst = fnLoadTxtList(infile)

fp = fopen(infile);

if fp == -1
	fprintf('ERROR: Can not open %s\n', infile);
    return;
end

rst = [];

while ~feof(fp)
	tline = fgetl(fp);
	rst = [rst; {tline}];
end

fclose(fp);

end
