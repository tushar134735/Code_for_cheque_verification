
SourceDir= 'C:\Partha\Dataset\IBN_SINA_DATA\Labels-Modify-TrainTrain';
%'C:\Partha\Dataset\IBN_SINA_DATA\Labels-TrainTrain\*.lab';
[Files,Bytes,Names] = Dirr(SourceDir,'name');

Val = cell(length(Names), 1);
for n = 1: length(Names)
    TXTName=Names(n);
    [pathstr, name, ext] = fileparts(TXTName{1});
    fid = fopen(TXTName{1});
    Val{n} = fgets(fid);
    fclose(fid);
end

UVal = unique(Val);

TargetFile = 'C:\Partha\HMM\Project\IBN-SINA-Relabel\ExpFiles\M_Dictionary.txt';
fod=fopen(TargetFile, 'w');

for n = 1: length(UVal)
    txt = UVal{n};
    fprintf(fod, '%s ', txt);
    for i = 1: length(txt)
        fprintf(fod, '%c ', txt(i));        
    end
    fprintf(fod, '\n');
end
fclose(fod);

