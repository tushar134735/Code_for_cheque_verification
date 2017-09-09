function [ q ] = quantized_slope( d )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=size(d);

  for i=2:n(1)
    y=(d(i,2)-d(i-1,2));
    x=(d(i,1)-d(i-1,1));
    temp=[y(1)/x(1)];
    temp(1)=atan(temp(1));
    ed=sqrt((y(1)^2)+(x(1)^2));
    cos=x(1)/ed(1);
    sin=y(1)/ed(1);
    if (cos<0 && sin>=0)
        temp(1)=3.14+temp(1);
    elseif (cos<0 && sin<0)
        temp(1)=3.14+temp(1);
    elseif(cos>=0 && sin<0)
        temp(1)=6.28+temp(1);   %here angle will be negative.
    end
    if(temp(1)<0.785)
        q(i-1)=0;
   elseif(temp(1)<1.57)
        q(i-1)=1;
    elseif(temp(1)<2.35)
        q(i-1)=2;
    elseif(temp(1)<3.14)
        q(i-1)=3;
    elseif(temp(1)<3.92)
        q(i-1)=4;
    elseif(temp(1)<4.71)
        q(i-1)=5;
    elseif(temp(1)<5.49)
        q(i-1)=6;
    else
        q(i-1)=7;
    end
  end

end