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
	w3=width/3;
	h3=height/3;
	z147x=min_x+w3;
	z258x=z147x+w3;
    z369x=z258x+w3;
	z123y=min_y+h3;
	z456y=z123y+h3;
	z789y=z456y+h3;
    
    
hordirz1=zeros(sz(1),1);
verdirz1=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=min_x && d(i,1)<=z147x && d(i,2)>=min_y && d(i,2)<=z123y && d(i-3,1)>=min_x && d(i-3,1)<=z147x && d(i-3,2)>=min_y && d(i-3,2)<=z123y && d(i+3,1)>=min_x && d(i+3,1)<=z147x && d(i+3,2)>=min_y && d(i+3,2)<=z123y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz1(p)=cos_alpha;
        verdirz1(p)=sin_alpha;
    end
end

h_dz1=zeros(p,1);
v_dz1=zeros(p,1);

if(p>0)
for i=1:p
    h_dz1(i)=hordirz1(i);
    v_dz1(i)=verdirz1(i);
end
end
% curvatures in zone 1

cos_beta=0.0;
sin_beta=0.0;
horcurz1=zeros(sz(1),1);
vercurz1=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz1(i-2)*h_dz1(i)+v_dz1(i-2)*v_dz1(i);
    sin_beta=h_dz1(i-2)*v_dz1(i)-v_dz1(i-2)*h_dz1(i);
    horcurz1(q)=cos_beta;
    vercurz1(q)=sin_beta;
end
end

h_cz1=zeros(q,1);
v_cz1=zeros(q,1);

if(q>0)
for i=1:q
    h_cz1(i)=horcurz1(i);
    v_cz1(i)=vercurz1(i);
end
end

hordirz2=zeros(sz(1),1);
verdirz2=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=z147x && d(i,1)<=z258x && d(i,2)>=min_y && d(i,2)<=z123y && d(i-3,1)>=z147x && d(i-3,1)<=z258x && d(i-3,2)>=min_y && d(i-3,2)<=z123y && d(i+3,1)>=z147x && d(i+3,1)<=z258x && d(i+3,2)>=min_y && d(i+3,2)<=z123y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz2(p)=cos_alpha;
        verdirz2(p)=sin_alpha;
    end
end

h_dz2=zeros(p,1);
v_dz2=zeros(p,1);

if(p>0)
for i=1:p
    h_dz2(i)=hordirz2(i);
    v_dz2(i)=verdirz2(i);
end
end

% curvatures in zone 2

cos_beta=0.0;
sin_beta=0.0;
horcurz2=zeros(sz(1),1);
vercurz2=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz2(i-2)*h_dz2(i)+v_dz2(i-2)*v_dz2(i);
    sin_beta=h_dz2(i-2)*v_dz2(i)-v_dz2(i-2)*h_dz2(i);
    horcurz2(q)=cos_beta;
    vercurz2(q)=sin_beta;
end
end

h_cz2=zeros(q,1);
v_cz2=zeros(q,1);

if(q>0)
for i=1:q
    h_cz2(i)=horcurz2(i);
    v_cz2(i)=vercurz2(i);
end
end

hordirz3=zeros(sz(1),1);
verdirz3=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=z258x && d(i,1)<=max_x && d(i,2)>=min_y && d(i,2)<=z123y && d(i-3,1)>=z258x && d(i-3,1)<=max_x && d(i-3,2)>=min_y && d(i-3,2)<=z123y && d(i+3,1)>=z258x && d(i+3,1)<=max_x && d(i+3,2)>=min_y && d(i+3,2)<=z123y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz3(p)=cos_alpha;
        verdirz3(p)=sin_alpha;
    end
end

h_dz3=zeros(p,1);
v_dz3=zeros(p,1);

if(p>0)
for i=1:p
    h_dz3(i)=hordirz3(i);
    v_dz3(i)=verdirz3(i);
end
end

% curvatures in zone 3

cos_beta=0.0;
sin_beta=0.0;
horcurz3=zeros(sz(1),1);
vercurz3=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz3(i-2)*h_dz3(i)+v_dz3(i-2)*v_dz3(i);
    sin_beta=h_dz3(i-2)*v_dz3(i)-v_dz3(i-2)*h_dz3(i);
    horcurz3(q)=cos_beta;
    vercurz3(q)=sin_beta;
end
end

h_cz3=zeros(q,1);
v_cz3=zeros(q,1);

if(q>0)
for i=1:q
    h_cz3(i)=horcurz3(i);
    v_cz3(i)=vercurz3(i);
end
end

hordirz4=zeros(sz(1),1);
verdirz4=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=min_x && d(i,1)<=z147x && d(i,2)>=z123y && d(i,2)<=z456y && d(i-3,1)>=min_x && d(i-3,1)<=z147x && d(i-3,2)>=z123y && d(i-3,2)<=z456y && d(i+3,1)>=min_x && d(i+3,1)<=z147x && d(i+3,2)>=z123y && d(i+3,2)<=z456y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz4(p)=cos_alpha;
        verdirz4(p)=sin_alpha;
    end
end

h_dz4=zeros(p,1);
v_dz4=zeros(p,1);

if(p>0)
for i=1:p
    h_dz4(i)=hordirz4(i);
    v_dz4(i)=verdirz4(i);
end
end

% curvatures in zone 4

cos_beta=0.0;
sin_beta=0.0;
horcurz4=zeros(sz(1),1);
vercurz4=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz4(i-2)*h_dz4(i)+v_dz4(i-2)*v_dz4(i);
    sin_beta=h_dz4(i-2)*v_dz4(i)-v_dz4(i-2)*h_dz4(i);
    horcurz4(q)=cos_beta;
    vercurz4(q)=sin_beta;
end
end

h_cz4=zeros(q,1);
v_cz4=zeros(q,1);

if(q>0)
for i=1:q
    h_cz4(i)=horcurz4(i);
    v_cz4(i)=vercurz4(i);
end
end

hordirz5=zeros(sz(1),1);
verdirz5=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=z147x && d(i,1)<=z258x && d(i,2)>=z123y && d(i,2)<=z456y && d(i-3,1)>=z147x && d(i-3,1)<=z258x && d(i-3,2)>=z123y && d(i-3,2)<=z456y && d(i+3,1)>=z147x && d(i+3,1)<=z258x && d(i+3,2)>=z123y && d(i+3,2)<=z456y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz5(p)=cos_alpha;
        verdirz5(p)=sin_alpha;
    end
end

h_dz5=zeros(p,1);
v_dz5=zeros(p,1);

if(p>0)
for i=1:p
    h_dz5(i)=hordirz5(i);
    v_dz5(i)=verdirz5(i);
end
end

% curvatures in zone 5

cos_beta=0.0;
sin_beta=0.0;
horcurz5=zeros(sz(1),1);
vercurz5=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz5(i-2)*h_dz5(i)+v_dz5(i-2)*v_dz5(i);
    sin_beta=h_dz5(i-2)*v_dz5(i)-v_dz5(i-2)*h_dz5(i);
    horcurz5(q)=cos_beta;
    vercurz5(q)=sin_beta;
end
end

h_cz5=zeros(q,1);
v_cz5=zeros(q,1);

if(q>0)
for i=1:q
    h_cz5(i)=horcurz5(i);
    v_cz5(i)=vercurz5(i);
end
end


hordirz6=zeros(sz(1),1);
verdirz6=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=z258x && d(i,1)<=max_x && d(i,2)>=z123y && d(i,2)<=z456y && d(i-3,1)>=z258x && d(i-3,1)<=max_x && d(i-3,2)>=z123y && d(i-3,2)<=z456y && d(i+3,1)>=z258x && d(i+3,1)<=max_x && d(i+3,2)>=z123y && d(i+3,2)<=z456y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz6(p)=cos_alpha;
        verdirz6(p)=sin_alpha;
    end
end

h_dz6=zeros(p,1);
v_dz6=zeros(p,1);

if(p>0)
for i=1:p
    h_dz6(i)=hordirz6(i);
    v_dz6(i)=verdirz6(i);
end
end

% curvatures in zone 6

cos_beta=0.0;
sin_beta=0.0;
horcurz6=zeros(sz(1),1);
vercurz6=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz6(i-2)*h_dz6(i)+v_dz6(i-2)*v_dz6(i);
    sin_beta=h_dz6(i-2)*v_dz6(i)-v_dz6(i-2)*h_dz6(i);
    horcurz6(q)=cos_beta;
    vercurz6(q)=sin_beta;
end
end

h_cz6=zeros(q,1);
v_cz6=zeros(q,1);

if(q>0)
for i=1:q
    h_cz6(i)=horcurz6(i);
    v_cz6(i)=vercurz6(i);
end
end


hordirz7=zeros(sz(1),1);
verdirz7=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=min_x && d(i,1)<=z147x && d(i,2)>=z456y && d(i,2)<=z789y && d(i-3,1)>=min_x && d(i-3,1)<=z147x && d(i-3,2)>=z456y && d(i-3,2)<=z789y && d(i+3,1)>=min_x && d(i+3,1)<=z147x && d(i+3,2)>=z456y && d(i+3,2)<=z789y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz7(p)=cos_alpha;
        verdirz7(p)=sin_alpha;
    end
end

h_dz7=zeros(p,1);
v_dz7=zeros(p,1);

if(p>0)
for i=1:p
    h_dz7(i)=hordirz7(i);
    v_dz7(i)=verdirz7(i);
end
end

% curvatures in zone 7

cos_beta=0.0;
sin_beta=0.0;
horcurz7=zeros(sz(1),1);
vercurz7=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz7(i-2)*h_dz7(i)+v_dz7(i-2)*v_dz7(i);
    sin_beta=h_dz7(i-2)*v_dz7(i)-v_dz7(i-2)*h_dz7(i);
    horcurz7(q)=cos_beta;
    vercurz7(q)=sin_beta;
end
end

h_cz7=zeros(q,1);
v_cz7=zeros(q,1);

if(q>0)
for i=1:q
    h_cz7(i)=horcurz7(i);
    v_cz7(i)=vercurz7(i);
end
end

hordirz8=zeros(sz(1),1);
verdirz8=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=z147x && d(i,1)<=z258x && d(i,2)>=z456y && d(i,2)<=z789y && d(i-3,1)>=z147x && d(i-3,1)<=z258x && d(i,2)>=z456y && d(i,2)<=z789y && d(i+3,1)>=z147x && d(i+3,1)<=z258x && d(i,2)>=z456y && d(i,2)<=z789y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz8(p)=cos_alpha;
        verdirz8(p)=sin_alpha;
    end
end

h_dz8=zeros(p,1);
v_dz8=zeros(p,1);

if(p>0)
for i=1:p
    h_dz8(i)=hordirz8(i);
    v_dz8(i)=verdirz8(i);
end
end

% curvatures in zone 8

cos_beta=0.0;
sin_beta=0.0;
horcurz8=zeros(sz(1),1);
vercurz8=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz8(i-2)*h_dz8(i)+v_dz8(i-2)*v_dz8(i);
    sin_beta=h_dz8(i-2)*v_dz8(i)-v_dz8(i-2)*h_dz8(i);
    horcurz8(q)=cos_beta;
    vercurz8(q)=sin_beta;
end
end

h_cz8=zeros(q,1);
v_cz8=zeros(q,1);

if(q>0)
for i=1:q
    h_cz8(i)=horcurz8(i);
    v_cz8(i)=vercurz8(i);
end
end


hordirz9=zeros(sz(1),1);
verdirz9=zeros(sz(1),1);
cos_alpha=0.0;
sin_alpha=0.0;
p=0;
for i=4:sz(1)-3
    if(d(i,1)>=z258x && d(i,1)<=max_x && d(i,2)>=z456y && d(i,2)<=z789y && d(i-3,1)>=z258x && d(i-3,1)<=max_x && d(i,2)>=z456y && d(i,2)<=z789y && d(i+3,1)>=z258x && d(i+3,1)<=max_x && d(i,2)>=z456y && d(i,2)<=z789y)
        p=p+1;
        del_x_i=d(i-3,1)-d(i+3,1);
        del_y_i=d(i-3,2)-d(i+3,2);
        del_s_i=realsqrt(del_x_i*del_x_i+del_y_i*del_y_i);
        if(del_x_i~=0)
			cos_alpha=del_x_i/del_s_i;
        end
		if(del_y_i~=0)
			sin_alpha=del_y_i/del_s_i;
        end
        hordirz9(p)=cos_alpha;
        verdirz9(p)=sin_alpha;
    end
end

h_dz9=zeros(p,1);
v_dz9=zeros(p,1);

if(p>0)
for i=1:p
    h_dz9(i)=hordirz9(i);
    v_dz9(i)=verdirz9(i);
end
end

% curvatures in zone 9

cos_beta=0.0;
sin_beta=0.0;
horcurz9=zeros(sz(1),1);
vercurz9=zeros(sz(1),1);
q=0;
if(p>0)
for i=3:p
    q=q+1;
    cos_beta=h_dz9(i-2)*h_dz9(i)+v_dz9(i-2)*v_dz9(i);
    sin_beta=h_dz9(i-2)*v_dz9(i)-v_dz9(i-2)*h_dz9(i);
    horcurz9(q)=cos_beta;
    vercurz9(q)=sin_beta;
end
end

h_cz9=zeros(q,1);
v_cz9=zeros(q,1);

if(q>0)
for i=1:q
    h_cz9(i)=horcurz9(i);
    v_cz9(i)=vercurz9(i);
end
end

        
        