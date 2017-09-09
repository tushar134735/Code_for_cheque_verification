function ErrorCharPair()
    GT_file = 'C:\Partha\HMM\Project\IBN-SINA-Relabel\ExpFiles\M_TestSamples.mlf';

    DataId = [];
    DataGT = [];
    blnk = '';
    fid = fopen(GT_file);
    tline = fgets(fid);
    while ischar(tline)
        Pd = strfind(tline, '.');
        if(strfind(tline, 'MLF'));
        elseif(strfind(tline, '.lab'));
            L1 = strfind(tline, 'Train'); L2 = strfind(tline, '.lab');
            Lab = str2num(evalc('disp(tline(L1+5:L2-1))'));
        elseif(Pd < 2)  
            DataId = [DataId; Lab];
            DataGT = [DataGT; {data blnk}];
        else
            data = tline;
        end
        tline = fgets(fid);
    end

    ResultFile = 'C:\Partha\HMM\Project\IBN-SINA-Relabel\ExpFiles\TestResult2.mlf';
    fid = fopen(ResultFile);
    tline = fgets(fid);
    while ischar(tline)
        Pd = strfind(tline, '.');
        if(strfind(tline, 'MLF'));
        elseif(strfind(tline, '.rec'));
            L1 = strfind(tline, 'Train'); L2 = strfind(tline, '.rec');
            Lab = str2num(evalc('disp(tline(L1+5:L2-1))'));
        elseif(Pd < 2);
        else
            P = strsplit(tline);
            data = P{3};
            ind = find(DataId == Lab);
            DataGT{ind, 2} = data;
        end
        tline = fgets(fid);
    end

    Error = zeros(length(DataGT), 1);
    for i = 1: length(DataGT)
        P = strsplit(DataGT{i,1});
        Q = strsplit(DataGT{i,2});
        if strcmp(P{1}, Q{1})
            Error(i) = 1;
        else 
            Error(i) = 0;
        end
    end

    sum(Error)/length(DataGT)
    IndErr = find(Error ==0);
    
    AllPair{1, 1} = '';
    AllPairHist = 0;
    for i = 1:length(IndErr)
        id = IndErr(i);
        P = strsplit(DataGT{id,1});
        Pairs = CharPair(P{1});        
        
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
    
    [C, I] = max(AllPairHist);
    fprintf('%s', AllPair{I, 1});
    
    fprintf('end');
end


