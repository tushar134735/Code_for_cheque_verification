sz=size(d);
max_x=d(1,1);
max_y=d(1,2);
min_x=d(1,1);
min_y=d(1,2);
dis=0;
    
for i=2:sz(1)
    if(max_x<d(i,1))
        max_x=d(i,1);
    end
    if(max_y<d(i,2))
        max_y=d(i,2);
    end
    if(min_x>d(i,1))
        min_x=d(i,1);
    end
    if(min_y>d(i,2))
        min_y=d(i,2);
    end
end

    width=max_x-min_x;
	height=max_y-min_y;
	w2=width/2;
	h3=height/3;
	z135x=min_x+w2;
	z246x=z135x+w2;
	z12y=min_y+h3;
	z34y=z12y+h3;
	z56y=z34y+h3;
    
    p=0;
    curliz1=zeros(sz(1),1);
    
    for i=5:sz(1)-4
        if(d(i,1)>=min_x && d(i,1)<=z135x && d(i,2)>=min_y && d(i,2)<=z12y && d(i-4,1)>=min_x && d(i-4,1)<=z135x && d(i-4,2)>=min_y && d(i-4,2)<=z12y && d(i+4,1)>=min_x && d(i+4,1)<=z135x && d(i+4,2)>=min_y && d(i+4,2)<=z12y )
            p=p+1;
            length_vic=0.0;
            mx_x=maxm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mn_x=minm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mx_y=maxm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            mn_y=minm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            del_x=mx_x-mn_x;
            del_y=mx_y-mn_y;
            for j=i-4:i+4-1
                n1=d(j,1)-d(j+1,1);
                n2=d(j,2)-d(j+1,2);
                length_vic=length_vic+realsqrt(n1*n1+n2*n2);
            end
            curliz1(p)= ((length_vic)/max(del_x,del_y))-2;
        end
    end
    
    curlz1=zeros(p,1);
    
    if(p>0)
        for i=1:p
            curlz1(i)=curliz1(i);
        end
    end
    
    p=0;
    curliz2=zeros(sz(1),1);
    
    for i=5:sz(1)-4
        if(d(i,1)>=z135x && d(i,1)<=max_x && d(i,2)>=min_y && d(i,2)<=z12y && d(i-4,1)>=z135x && d(i-4,1)<=max_x && d(i-4,2)>=min_y && d(i-4,2)<=z12y && d(i+4,1)>=z135x && d(i+4,1)<=max_x && d(i+4,2)>=min_y && d(i+4,2)<=z12y )
            p=p+1;
            length_vic=0.0;
            mx_x=maxm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mn_x=minm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mx_y=maxm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            mn_y=minm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            del_x=mx_x-mn_x;
            del_y=mx_y-mn_y;
            for j=i-4:i+4-1
                n1=d(j,1)-d(j+1,1);
                n2=d(j,2)-d(j+1,2);
                length_vic=length_vic+realsqrt(n1*n1+n2*n2);
            end
            curliz2(p)= ((length_vic)/max(del_x,del_y))-2;
        end
    end
    
    curlz2=zeros(p,1);
    
    if(p>0)
        for i=1:p
            curlz2(i)=curliz2(i);
        end
    end
    
    p=0;
    curliz3=zeros(sz(1),1);
    
    for i=5:sz(1)-4
        if(d(i,1)>=min_x && d(i,1)<=z135x && d(i,2)>=z12y && d(i,2)<=z34y && d(i-4,1)>=min_x && d(i-4,1)<=z135x && d(i-4,2)>=z12y && d(i-4,2)<=z34y && d(i+4,1)>=min_x && d(i+4,1)<=z135x && d(i+4,2)>=z12y && d(i+4,2)<=z34y )
            p=p+1;
            length_vic=0.0;
            mx_x=maxm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mn_x=minm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mx_y=maxm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            mn_y=minm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            del_x=mx_x-mn_x;
            del_y=mx_y-mn_y;
            for j=i-4:i+4-1
                n1=d(j,1)-d(j+1,1);
                n2=d(j,2)-d(j+1,2);
                length_vic=length_vic+realsqrt(n1*n1+n2*n2);
            end
            curliz3(p)= ((length_vic)/max(del_x,del_y))-2;
        end
    end
    
    curlz3=zeros(p,1);
    
    if(p>0)
        for i=1:p
            curlz3(i)=curliz3(i);
        end
    end
    
    p=0;
    curliz4=zeros(sz(1),1);
    
    for i=5:sz(1)-4
        if(d(i,1)>=z135x && d(i,1)<=max_x && d(i,2)>=z12y && d(i,2)<=z34y && d(i-4,1)>=z135x && d(i-4,1)<=max_x && d(i-4,2)>=z12y && d(i-4,2)<=z34y && d(i+4,1)>=z135x && d(i+4,1)<=max_x && d(i+4,2)>=z12y && d(i+4,2)<=z34y )
            p=p+1;
            length_vic=0.0;
            mx_x=maxm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mn_x=minm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mx_y=maxm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            mn_y=minm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            del_x=mx_x-mn_x;
            del_y=mx_y-mn_y;
            for j=i-4:i+4-1
                n1=d(j,1)-d(j+1,1);
                n2=d(j,2)-d(j+1,2);
                length_vic=length_vic+realsqrt(n1*n1+n2*n2);
            end
            curliz4(p)= ((length_vic)/max(del_x,del_y))-2;
        end
    end
    
    curlz4=zeros(p,1);
    
    if(p>0)
        for i=1:p
            curlz4(i)=curliz4(i);
        end
    end
    
    p=0;
    curliz5=zeros(sz(1),1);
    
    for i=5:sz(1)-4
        if(d(i,1)>=min_x && d(i,1)<=z135x && d(i,2)>=z34y && d(i,2)<=z56y && d(i-4,1)>=min_x && d(i-4,1)<=z135x && d(i-4,2)>=z34y && d(i-4,2)<=z56y && d(i+4,1)>=min_x && d(i+4,1)<=z135x && d(i+4,2)>=z34y && d(i+4,2)<=z56y )
            p=p+1;
            length_vic=0.0;
            mx_x=maxm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mn_x=minm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mx_y=maxm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            mn_y=minm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            del_x=mx_x-mn_x;
            del_y=mx_y-mn_y;
            for j=i-4:i+4-1
                n1=d(j,1)-d(j+1,1);
                n2=d(j,2)-d(j+1,2);
                length_vic=length_vic+realsqrt(n1*n1+n2*n2);
            end
            curliz5(p)= ((length_vic)/max(del_x,del_y))-2;
        end
    end
    
    curlz5=zeros(p,1);
    
    if(p>0)
        for i=1:p
            curlz5(i)=curliz5(i);
        end
    end
    
    p=0;
    curliz6=zeros(sz(1),1);
    
    for i=5:sz(1)-4
        if(d(i,1)>=z135x && d(i,1)<=max_x && d(i,2)>=z34y && d(i,2)<=z56y && d(i-4,1)>=z135x && d(i-4,1)<=max_x && d(i-4,2)>=z34y && d(i-4,2)<=z56y && d(i+4,1)>=z135x && d(i+4,1)<=max_x && d(i+4,2)>=z34y && d(i+4,2)<=z56y )
            p=p+1;
            length_vic=0.0;
            mx_x=maxm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mn_x=minm(d(i-4,1),d(i-3,1),d(i-2,1),d(i-1,1),d(i+4,1),d(i+3,1),d(i+2,1),d(i+1,1));
            mx_y=maxm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            mn_y=minm(d(i-4,2),d(i-3,2),d(i-2,2),d(i-1,2),d(i+4,2),d(i+3,2),d(i+2,2),d(i+1,2));
            del_x=mx_x-mn_x;
            del_y=mx_y-mn_y;
            for j=i-4:i+4-1
                n1=d(j,1)-d(j+1,1);
                n2=d(j,2)-d(j+1,2);
                length_vic=length_vic+realsqrt(n1*n1+n2*n2);
            end
            curliz6(p)= ((length_vic)/max(del_x,del_y))-2;
        end
    end
    
    curlz6=zeros(p,1);
    
    if(p>0)
        for i=1:p
            curlz6(i)=curliz6(i);
        end
    end
  


            