% filename=input('Enter path or name of file\n','s');
d=showpoints(ImgName{1});
%d=interpolation(d);
d=smoothing(d,4);
%[lowerLine,upperLine]=lineCalculation(d);
%d=normalisation(d,lowerLine,upperLine);
%[lowerLine,upperLine]=lineCalculation(d);

