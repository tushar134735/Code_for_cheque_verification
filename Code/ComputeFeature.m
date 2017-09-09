
function ComputeFeature(ImgFolder, FeatureFolder, FeatureFolder48)
%function ComputerFeature(FeatureFolder, FeatureFolder48)
%     ImgFolder = '/home/proy/Dataset/IBN_SINA/PAWTrain_m30';
%     FeatureFolder = '/home/proy/Dataset/IBN_SINA/FeatureCCV/Train_m30';
%     FeatureFolder48 = '/home/proy/Dataset/IBN_SINA/FeatureCCV/Train_m30_DA';
    mkdir(FeatureFolder);
    [Files,Bytes,Names] = Dirr(ImgFolder,'name');
    for(n = 1: length(Names))
        ImgName=Names(n);
        [pathstr, name, ext] = fileparts(ImgName{1});
        FeaName=strcat(FeatureFolder, '/', name, '.fea');
        I = imread(ImgName{1});
        F = get_img_feature(I, 0);
        writehtk(FeaName, F, 10E-3, 9);
    end
    
    [Files,Bytes,Names] = Dirr(FeatureFolder,'name');
    SaveFile = 'HTK_convert.txt';
    fod =fopen(SaveFile, 'w');
    for n = 1 : length(Names)
        TXTName=Names(n);
        [pathstr, name, ext] = fileparts(TXTName{1});
        target = strcat(FeatureFolder48, '/', name, ext); 
        fprintf(fod, '%s %s\n',TXTName{1}, target);
    end
    fclose(fod);

    mkdir(FeatureFolder48);
    syscmd = sprintf('./HCopy -T 1 -C %s -S %s', 'config.txt', SaveFile);
    unix(syscmd);

    delete(SaveFile);
end
 

SrcDir = '/home/proy/Dataset/IBN_SINA/FeatureMB/Train';
TgtDir = '/home/proy/Dataset/IBN_SINA/FeatureMB/Train_P';
 mkdir(TgtDir);
[Files,Bytes,Names] = Dirr(SrcDir,'name');
for n = 1 : length(Names)
    src=Names(n);
    [pathstr, name, ext] = fileparts(src{1});
    tgt = strcat(TgtDir, '/', name, ext);
    syscmd = sprintf('./HList -r %s > %s', src{1}, tgt);
    unix(syscmd);
end