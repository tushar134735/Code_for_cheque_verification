

function FuncDictionary(SourceDir, TgtFile)
    [Files,Bytes,Names] = Dirr(SourceDir,'name');

    Val = cell(length(Names), 1);
    for n = 1: length(Names)
        TXTName=Names(n);
        [pathstr, name, ~] = fileparts(TXTName{1});
        fid = fopen(TXTName{1});
        Val{n} = fgets(fid);
        fclose(fid);
    end

    UVal = unique(Val);

    fod=fopen(TgtFile, 'w');

    for n = 1: length(UVal)
        txt = UVal{n};
        fprintf(fod, '%s ', txt);
        for i = 1: length(txt)
            fprintf(fod, '%c ', txt(i));        
        end
        fprintf(fod, '\n');
    end
    fclose(fod);
end