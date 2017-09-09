function FileList(SourceDir, FileList)
    [Files,Bytes,Names] = DIRR(SourceDir,'name');
    fod =fopen(FileList, 'w');

    for n = 1 : length(Names)
        TXTName=Names(n);
        fprintf(fod, '%s\n',TXTName{1});
    end
    fclose(fod);
end