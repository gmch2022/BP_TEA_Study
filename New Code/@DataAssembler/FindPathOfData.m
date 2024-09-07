function [bpFilePath, paramFilePath] = FindPathOfData(obj, bpFileInfo, paramFileInfo)
%FINDPATHOFDATA created by Mingcheng Gu
%   Description
%   tempFindPathOfdata: DataAssembler's member function || This function will return the data/params file path
%   In: ( struct [name, folder, date, bytes, isdir, datenum] )
%       bpFileInfo    : mat file info in dirpath
%       paramFileInfo : txt file info in dirpath
%   Out:( struct [path, point , segmentIndex ] )        || point = ["Base","TaiChong" , "QuChi" , "ZuSanLi" , "RenYin" , "HeGu"];
%       bpFilePath    : BP    file path
%       paramFilePath : Param file path
 
    bpFilePath    = obj.tempFindPathOfdata(bpFileInfo   , "mat");
    paramFilePath = obj.tempFindPathOfdata(paramFileInfo, "txt");
end

