
DicFile ='C:\Partha\HMM\Project\IBN-SINA-Relabel\ExpFiles\M_Dictionary.txt';
GrammarFile = 'C:\Partha\HMM\Project\IBN-SINA-Relabel\ExpFiles\M_Grammar.txt';

fid =fopen(DicFile);
fod =fopen(GrammarFile, 'w');

fprintf(fod, '$keyword = ');

vline = fgets(fid);
count = 1;
while ischar(vline)
    A = strsplit(vline);
    if count == 1
        fprintf(fod, '%s ', A{1});
        count = count + 1;
    else 
        fprintf(fod, '| %s', A{1});        
    end
    vline = fgets(fid);
end
fclose(fid);
fprintf(fod, ';\n');
fprintf(fod, '($keyword) \n');
fclose(fod);

NetworkFile = 'C:\Partha\HMM\Project\IBN-SINA-Relabel\ExpFiles\M_Network.txt';
syscmd = sprintf('./HParse %s %s', GrammarFile, NetworkFile);
system(syscmd);