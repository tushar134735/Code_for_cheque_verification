function Pairs = CharPair(strA)
    len = length(strA);
    Pairs = [];
    for i = 2:len
        Pairs = [Pairs; {strcat(strA(i-1), strA(i))}];
    end        
end