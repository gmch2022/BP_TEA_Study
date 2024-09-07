function [dataPathList] = tempFindPathOfdata(Typelist,Type)
%TEMPFINDPATHOFDATA 
%   description
%   This function will return the data/params file path
%   acuPoints = ["Base","TaiChong" , "QuChi" , "ZuSanLi" , "RenYin" , "HeGu"];
    
    taiChong = [0, 0];
    quChi    = [0, 0];
    zuSanLi  = [0, 0];
    renYin   = [0, 0];
    heGu     = [0, 0];
    
    dataPathList = struct();
    
    % When type is "mat", code give acupunture data
    if(Type == "mat")
        matFilePaths = fullfile({Typelist.folder}, {Typelist.name});
        
        for i = 1:length(Typelist)
            dataPathList(i).path = char(matFilePaths(i)) ;
            if contains(Typelist(i).name, "TaiChong")
                dataPathList(i).point = "TaiChong";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                taiChong(1) = taiChong(1) + 1;

            elseif contains(Typelist(i).name, "QuChi")
                dataPathList(i).point = "QuChi";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                quChi(1) = quChi(1) + 1;

            elseif contains(Typelist(i).name, "ZuSanLi")
                dataPathList(i).point = "ZuSanLi";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                zuSanLi(1) = zuSanLi(1) + 1;

            elseif contains(Typelist(i).name, "RenYin")
                dataPathList(i).point = "RenYin";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                renYin(1) = renYin(1) + 1;

            elseif contains(Typelist(i).name, "HeGu")
                dataPathList(i).point = "HeGu";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                heGu(1) = heGu(1) + 1;

            elseif contains(Typelist(i).name, "Base")
                dataPathList(i).point = "Base";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
            end
        end
    end

    % When type is "params", code give acupunture params
    if(Type == "txt")
        txtFilePaths = fullfile({Typelist.folder}, {Typelist.name});
        for i = 1:length(Typelist)
            dataPathList(i).path = char(txtFilePaths(i));
            if contains(Typelist(i).name, "TaiChong")
                dataPathList(i).point = "TaiChong";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                taiChong(1) = taiChong(2) + 1;

            elseif contains(Typelist(i).name, "QuChi")
                dataPathList(i).point = "QuChi";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                quChi(1) = quChi(2) + 1;

            elseif contains(Typelist(i).name, "ZuSanLi")
                dataPathList(i).point = "ZuSanLi";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                zuSanLi(1) = zuSanLi(2) + 1;

            elseif contains(Typelist(i).name, "RenYin")
                dataPathList(i).point = "RenYin";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                renYin(1) = renYin(2) + 1;

            elseif contains(Typelist(i).name, "HeGu")
                dataPathList(i).point = "HeGu";
                dataPathList(i).segmentIdx = Typelist(i).name(end -4);
                heGu(1) = heGu(2) + 1;
            else
                dataPathList(i).path = [];
                continue;
            end
        end
    end
    
    emptyIdx = arrayfun(@(s) isempty(s.path), dataPathList);
    dataPathList(emptyIdx) = [];
    
    lastChars = arrayfun(@(s) s.path(end-4), dataPathList);
    [~, sortIndex] = sort(lastChars);
    dataPathList = dataPathList(sortIndex);
    
end

