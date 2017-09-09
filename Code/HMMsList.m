
function HMMsList(SourceDir, TgtFile)
    
    fod =fopen(TgtFile, 'w');
    for i=1:1200
        fname=['d:\Dataset1\IBN_SINA\Labels\Train\Train',num2str(i),'.lab'];
        fid = fopen(fname,'r');
        txt = fgets(fid);
        fclose(fid);
        m=mod(i-1,20);
        
        if(m==0)
            for j=1:length(txt)
                if(txt(j)~=' ')
                    fprintf(fod, '%s', txt(j));
                end
                if(txt(j)==' ')
                    fprintf(fod,'\n');
                end
            end
            fprintf(fod,'\n');
        end
    end
    fclose(fod);

    
end

