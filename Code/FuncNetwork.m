

function FuncNetwork(DictioanaryFile, NetworkFile)

    tempfile = 'grammar';
    fid =fopen(DictioanaryFile);
    fod =fopen(tempfile, 'w');

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
    
    syscmd = sprintf('HParse %s %s', tempfile, NetworkFile);
    system(syscmd);

end