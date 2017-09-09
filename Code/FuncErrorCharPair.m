function [Success, EPairs] = FuncErrorCharPair(GTdir, ResultFile, File_Dictionary, k)

    %GTdir = 'C:\Partha\Dataset\IBN_SINA_DATA\Labels-Symbols-TrainValid\*.lab';
    [Files,Bytes,Names] = Dirr(GTdir,'name');
    
    DataId = [];
    DataGT = [];
    blnk = '';
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
        DataGT = [DataGT; {tline blnk}];
        fclose(fid);
    end
    
    %File_Dictionary = 'C:\Partha\HMM\Project\IBN-SINA-Relabel\ExpFiles\M_Dictionary.txt';
    Dic1 = [];
    Dic2 = [];
    fid = fopen(File_Dictionary);
    tline = fgets(fid);
    while ischar(tline)
        LID = strfind(tline, 'LID');
        sp = strfind(tline, ' ');
        id = str2num(evalc('disp(tline(LID+3:sp-1))'));
        Dic1 = [Dic1; id];
        val = tline(sp: length(tline));
        Dic2 = [Dic2; {val}];
        tline = fgets(fid);
    end
            
    %ResultFile = 'C:\Partha\HMM\Project\IBN-SINA-Relabel\ExpFiles\TestResult.mlf';
    fid = fopen(ResultFile);
    tline = fgets(fid);
    while ischar(tline)
        Pd = strfind(tline, '.');
        if(strfind(tline, 'MLF'));
        elseif(strfind(tline, '.rec'));
             %L1 = strfind(tline, 'Train'); L2 = strfind(tline, '.rec');
             %Lab = str2num(evalc('disp(tline(L1+5:L2-1))'));
                L1 = strfind(tline, 'Test'); L2 = strfind(tline, '.rec');
                Lab = str2num(evalc('disp(tline(L1+4:L2-1))'));
        elseif(Pd < 2);
        else
            P = strsplit(tline);
            data = P{3};
            LID = strfind(data, 'LID');
            id = str2num(evalc('disp(data(LID+3:length(data)))'));
            did = find(Dic1 ==id);
            ind = find(DataId == Lab);
            DataGT{ind, 2} = Dic2{did};
        end
        tline = fgets(fid);
    end    

    Error = zeros(length(DataGT), 1);
    for i = 1: length(DataGT)
        P = strsplit(DataGT{i,1});
        Q = strsplit(DataGT{i,2});
        if(length(P) ~= length(Q))
            Error(i) = 0;
        else
            flag = 0;
            for j = 1:length(P)
                if(strcmp(P{1}, Q{1}) == 0)
                    flag = 1;                
                end
            end
            if (flag == 0)
                Error(i) = 1;
            else 
                Error(i) = 0;
            end
        end
    end

    Success = sum(Error)/length(DataGT);
    IndErr = find(Error ==0);
    
    PEdat = cell(500, 2);
    for i = 1:length(IndErr)
        PEdat{i, 1} = DataGT(IndErr(i), 1);
        PEdat{i, 2} = DataGT(IndErr(i), 2);
    end
    
    
    AllPair = {};
    AllPairHist = [];
    for i = 1:length(IndErr)
        id = IndErr(i);
        
        Pairs = SymbolPair(DataGT{id,1});
        for j = 1:length(Pairs)
            flag = 0;
            for k = 1:length(AllPair)
                if (strcmp(AllPair{k, 1}, Pairs{j}))
                   flag = 1;
                   AllPairHist(k) = AllPairHist(k) + 1;
                end
            end          
            if(flag == 0)
                AllPair = [AllPair; Pairs{j}];
                AllPairHist = [AllPairHist; 0];
            end
        end
    end
    
    APHmat = zeros(length(AllPairHist), 2);
    for i = 1:length(AllPairHist)
        APHmat(i, 1) = i;
        APHmat(i, 2) = AllPairHist(i);
    end
    
   [sV, sI] = sort(APHmat(:, 2),'descend');
   
   EPairs = cell(k, 1);
   for i = 1:k
       id = sI(i);
       EPairs{i} = [AllPair{id}, ' '];
   end
end


