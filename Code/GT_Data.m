function [DataId, DataGT] = GT_Data(GTdir)
    %GTdir = 'C:\Partha\Dataset\IBN_SINA_DATA\Labels-Symbols-TrainValid\*.lab';
    [Files,Bytes,Names] = Dirr(GTdir,'name');
    
    DataId = [];
    DataGT = [];
    for(n = 1: length(Names))
        TXTName=Names(n);
        [pathstr, name, ext] = fileparts(TXTName{1});
         %L1 = strfind(name, 'Train'); L2 = length(name);
         %Lab = str2num(evalc('disp(name(L1+5:L2))'));
        L1 = strfind(name, 'Test'); L2 = length(name);
        Lab = str2num(evalc('disp(name(L1+4:L2))'));
        DataId = [DataId; Lab];
        
        fid = fopen(TXTName{1});
        tline = fgets(fid);
        DataGT = [DataGT; {tline}];
        fclose(fid);
    end
end


