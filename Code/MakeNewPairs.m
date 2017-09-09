
function [Tpair] = MakeNewPairs(File_HMMsList, k)

    Hid = 0;
    fid = fopen(File_HMMsList);
    tline = fgets(fid);
    while ischar(tline)
        L1 = strfind(tline, 'a');
        val = str2num(evalc('disp(tline(L1+1:length(tline)))'));
        if Hid < val
            Hid = val;
        end
        tline = fgets(fid);
    end       
    
    Tpair = cell(k, 1);
    for i = 1:k
        Tpair{i, 1} = ['a', num2str(Hid+i), ' '];
    end
end
