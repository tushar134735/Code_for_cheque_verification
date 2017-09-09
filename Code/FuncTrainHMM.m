
function FuncTrainHMM(HMMsList, Phones0, HMMParentFolder, TrainingList)

    NUM_ITER=4;
    Q = [1 2 4 8 16 32 64];

    proto = 'proto';
    TryProto(80, 1, '<USER>', proto);
    %%%%read the state number from proto file%%%%%%%%%%%
    fid = fopen(proto);
    for i = 1: 4
         pline = fgets(fid);
    end
    fclose(fid);
    words = strsplit(pline);
    State_Num = double(words{2}) - double('0');

    %%%create folders
    ans = rmdir(HMMParentFolder,'s');
    mkdir(HMMParentFolder);
    HMMFolder0=strcat(HMMParentFolder, '\hmm_0');
    mkdir(HMMFolder0);

    for i = 1: length(Q)
        folderName=strcat('hmm_', int2str(Q(i)));
        mkdir(HMMParentFolder, folderName);
    end

    FLAGSCOMPV = ' -A -D -T 1 -f 0.01 -m';
    syscmd = sprintf('HCompV  %s -S %s -M %s %s %s', FLAGSCOMPV, TrainingList, HMMFolder0, proto);
    system(syscmd);

    %%%%%%% Hmmdefs creation%%%
    hmmdefs = strcat(HMMParentFolder, '\hmm_1\', 'hmmdefs');
    fod =fopen(hmmdefs, 'w');
    proto0 = strcat(HMMParentFolder, '\hmm_0\', 'proto');

    fid = fopen(HMMsList);
    tline = fgets(fid);
    while ischar(tline)
        txt = strtrim(tline);
        fprintf(fod, '~h "%s"\n', txt);
        tline = fgets(fid);

        fid_proto =fopen(proto0);
        pline = fgets(fid_proto);
        count = 1;
        while ischar(pline)
            if(count > 4) 
                fprintf(fod, '%s', pline);
            end
            pline = fgets(fid_proto);
            count = count+1;
        end
        fclose(fid_proto);
    end
    fprintf(fod, '\n');
    fclose(fid);
    fclose(fod);

    %%%%%%% Macro file creation%%%
    macros = strcat(HMMParentFolder, '\hmm_1\', 'macros');
    fod =fopen(macros, 'w');

    fid_proto =fopen(proto0);
    pline = fgets(fid_proto); 
    for i = 1: 3
        fprintf(fod, '%s', pline);
        pline = fgets(fid_proto);    
    end
    fclose(fid_proto);
    vfloors = strcat(HMMParentFolder, '\hmm_0\', 'vFloors');
    fid_vfloor =fopen(vfloors);
    vline = fgets(fid_vfloor);
    while ischar(vline)
        fprintf(fod, '%s', vline);
        vline = fgets(fid_vfloor);
    end
    fclose(fid_vfloor);
    fclose(fod);

    %%%%%%%%%%%First iteration%%%%%%%%%%%
    hmm_1 = strcat(HMMParentFolder, '\hmm_1');
    FLAGSHEREST='-A -D -T 1';

    for iteration = 1:NUM_ITER+1
        syscmd = sprintf('HERest  %s -I %s -S %s -H %s -H %s %s', FLAGSHEREST, Phones0, TrainingList, macros, hmmdefs, HMMsList);
        unix(syscmd);
    end

    %g = 2;
    s = State_Num-1;
    %while g <= NUM_GAUSS
    for i = 2: length(Q)
        tmp_file = 'tmp.txt';
        fod = fopen(tmp_file, 'w');    
        fprintf(fod, 'MU %d {*.state[2-%d].mix}', Q(i), s);
        fclose(fod);
        macros_prev = strcat(HMMParentFolder, '\hmm_', int2str(Q(i-1)), '\', 'macros');
        hmmdefs_prev = strcat(HMMParentFolder, '\hmm_', int2str(Q(i-1)), '\', 'hmmdefs');
        next_folder = strcat(HMMParentFolder, '\hmm_', int2str(Q(i)));
        syscmd = sprintf('HHEd -A -H %s -H %s -M %s %s %s', macros_prev, hmmdefs_prev, next_folder, tmp_file,  HMMsList);
        system(syscmd);
        delete(tmp_file);    
        for iter = 1:NUM_ITER
            macros_cur = strcat(HMMParentFolder, '\hmm_', int2str(Q(i)), '\', 'macros');
            hmmdefs_cur = strcat(HMMParentFolder, '\hmm_', int2str(Q(i)), '\', 'hmmdefs');
            syscmd = sprintf('HERest  %s -I %s -S %s -H %s -H %s %s', FLAGSHEREST, Phones0, TrainingList, macros_cur, hmmdefs_cur, HMMsList);
            system(syscmd);
        end
    %     g = g*2;
    end

end
 
