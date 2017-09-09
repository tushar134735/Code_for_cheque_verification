

SourceDir='/home/proy/Dataset/IBN_SINA/Labels-Train'; %Test
[Files,Bytes,Names] = Dirr(SourceDir,'name');

TargetFile = '/home/proy/HMM/Project_IBN_SINA/Process/Data/Word_Data.txt'; %GT_File
fod=fopen(TargetFile, 'w');
fprintf(fod,'#!MLF!#\n');

str_beg='"*/';
str_end='.lab"';

[Files,Bytes,Names] = Dirr(SourceDir,'name');
for(n = 1: length(Names))
    FileName=Names(n);
    [pathstr, name, ext] = fileparts(FileName{1});
    fprintf(fod,'%s%s%s\n', str_beg,name,str_end);
    
    fid = fopen(FileName{1});    
    tline = fgets(fid);
    fprintf(fod, '%s\n',tline);
    fprintf(fod, '.\n');
    fclose(fid);
end
fclose(fod);