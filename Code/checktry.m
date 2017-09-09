mkdir TargetDir
TargetDir = 'D:\8th SEM\words\Test\';
[Files,Bytes,Names] = DIRR(SourceDir,'name');
for i=3:48
     ImgName=Names(n);
    [pathstr, name, ext] = fileparts(ImgName{1});
file_name = dir(strcat('D:\8th SEM\words\word_bwOP1\and\'));
I = imread(strcat('D:\8th SEM\words\word_bwOP1\and\',file_name(i).name));
  FeaName=strcat(TargetDir, name, '.fea')
imshow(I);
F = feature_extractor(I);
 writehtk(FeaName, F, 10E-3, 9);
end



