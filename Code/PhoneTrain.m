

function PhoneTrain(SourceDir, TgtFile)
[Files,Bytes,Names] = DIRR(SourceDir,'name');

fod=fopen(TgtFile, 'w');
fprintf(fod,'#!MLF!#\n');

str_beg='"*/';
str_end='.lab"';
for(n = 1: length(Names))
    TXTName=Names(n);
    [pathstr, name, ext] = fileparts(TXTName{1});
    fprintf(fod,'%s%s%s\n', str_beg,name,str_end);
    fid = fopen(TXTName{1});
    tline = fgets(fid);
    for i = 1: length(tline)
        if(tline(i)~=' ')
            fprintf(fod, '%s', tline(i));
        end
        if(tline(i)==' ')
            fprintf(fod,'\n');
        end
    end
    fclose(fid);
    fprintf(fod,'\n');
    fprintf(fod,'.\n');
end
fclose(fod);