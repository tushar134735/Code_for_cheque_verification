function Phone2word(File_Phone, File_Dictionary, File_Word)

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
            
    fid = fopen(File_Phone);
    tline = fgets(fid);
    
    fod = fopen(File_Word, 'w');
    
    while ischar(tline)
        Pd = strfind(tline, '.');
        if(strfind(tline, 'MLF'))
            fprintf(fod, '%s', tline);
        elseif(strfind(tline, '.lab'))
             count = 1;
             fprintf(fod, '%s', tline);
        elseif(Pd < 2)
            %txt = [txt '   '];
            P = strsplit(txt);            
            for i = 1:length(Dic2)
                flag = 0;
                Q = strsplit(Dic2{i});
                if(length(P) == length(Q))
                    for j = 1:length(P)
                        ans = strcmp(P{j}, Q(j));
                        if(ans == 0) flag = 1;
                        end
                    end
                else 
                    flag = 1;
                end                
                if(flag == 0) 
                    ix = i;
                end
            end            
            fprintf(fod, 'LID%d\n', Dic1(ix));
            %fprintf(fod, '%s\n', txt);
            fprintf(fod, '.\n', txt);
        else
            P = strsplit(tline);
            if( count == 1)                 
                txt = P{1};
                count = count + 1;
            else
                txt = [txt ' ' P{1}];            
            end
        end
        tline = fgets(fid);
    end
end


