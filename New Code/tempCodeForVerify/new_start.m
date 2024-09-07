
path = uigetdir;
fileList = dir(path);

matFiles = dir(fullfile(path, '*.mat'));
matFilePaths = fullfile({matFiles.folder}, {matFiles.name});

txtFiles = dir(fullfile(path, '*.txt'));
txtFilePaths = fullfile({txtFiles.folder}, {txtFiles.name});