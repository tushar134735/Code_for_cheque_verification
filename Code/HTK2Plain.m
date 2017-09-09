
function HTK2Plain(SrcDir, TgtDir) 

% SrcDir = '/home/proy/Dataset/IBN_SINA/FeatureCCV/Test_DA';
% TgtDir = '/home/proy/Dataset/IBN_SINA/FeatureCCV/Test_DA_P';
 mkdir(TgtDir);
[Files,Bytes,Names] = Dirr(SrcDir,'name');
for n = 1 : length(Names)
    src=Names(n);
    [pathstr, name, ext] = fileparts(src{1});
    tgt = strcat(TgtDir, '/', name, ext);
    syscmd = sprintf('./HList -r %s > %s', src{1}, tgt);
    unix(syscmd);
end

end