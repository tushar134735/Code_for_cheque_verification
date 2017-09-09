function [maximum] = maxm(a,b,c,d,e,f,g,h)
sample(1)=a;
sample(2)=b;
sample(3)=c;
sample(4)=d;
sample(5)=e;
sample(6)=f;
sample(7)=g;
sample(8)=h;

maximum=sample(1);
for i=2:8
    if(sample(i)>maximum)
        maximum=sample(i);
    end
end

	
