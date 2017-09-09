% % Read in the file name
path = ('D:\8th_SEM\words\CCV\TestSample1\');

files = dir('*.fea');

size(files)
%files = sort(files1);

prefix=('Test');

SourceDir = 'D:\8th_SEM\words\CCV\TestSample1';

[Files,Bytes,Names] = DIRR(SourceDir,'name');
for id=1:;

     newName=([prefix num2str(id)]);     
     movefile( fullfile(path, files(id).name), fullfile(path, sprintf('%s.fea',newName)) );
%      disp (files(id).name);
     
end
