function [inp] = featureExtraction_word( d,iter,inp)%,lowerLine,upperLine )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%ver=verticalPosition(d,lowerLine,upperLine);
%versz=size(ver);
%lowerPos=ones(versz(1));
%upperPos=ones(versz(1));
%lowerPos(:,1)=ver(:,1);
%upperPos(:,1)=ver(:,2);

%dir=writingDirection(d,3);
%dirsz=size(dir);
%horizdir=ones(dirsz(1),1);
%horizdir(:,1)=dir(:,1);
%vertdir=ones(dirsz(1),1);
%vertdir(:,1)=dir(:,2);

%curv=curvature(dir,3);
%curvsz=size(curv);
%horizcurv=ones(curvsz(1));
%horizcurv(:,1)=curv(:,1);
%vertcurv=ones(curvsz(1));
%vertcurv(:,1)=curv(:,2);

%asp=aspect(d,6);
%curl=curliness(d,6);
%lin=linearity(d,6);
slp=slope(d,6);
%stddev;
stddev_zones;
writingDirection_zones;
curvature_zones;
curliness_zones;
st_xsz=size(st_x);
st_ysz=size(st_y);
hsst_x=hist(st_x,8);
hsst_y=hist(st_y,8);
h_dz1sz=size(h_dz1);
v_dz1sz=size(v_dz1);
hsh_dz1=hist(h_dz1,8);
hsv_dz1=hist(v_dz1,8);
h_dz2sz=size(h_dz2);
v_dz2sz=size(v_dz2);
hsh_dz2=hist(h_dz2,8);
hsv_dz2=hist(v_dz2,8);
h_dz3sz=size(h_dz3);
v_dz3sz=size(v_dz3);
hsh_dz3=hist(h_dz3,8);
hsv_dz3=hist(v_dz3,8);
h_dz4sz=size(h_dz4);
v_dz4sz=size(v_dz4);
hsh_dz4=hist(h_dz4,8);
hsv_dz4=hist(v_dz4,8);
h_dz5sz=size(h_dz5);
v_dz5sz=size(v_dz5);
hsh_dz5=hist(h_dz5,8);
hsv_dz5=hist(v_dz5,8);
h_dz6sz=size(h_dz6);
v_dz6sz=size(v_dz6);
hsh_dz6=hist(h_dz6,8);
hsv_dz6=hist(v_dz6,8);
h_dz7sz=size(h_dz7);
v_dz7sz=size(v_dz7);
hsh_dz7=hist(h_dz7,8);
hsv_dz7=hist(v_dz7,8);
h_dz8sz=size(h_dz8);
v_dz8sz=size(v_dz8);
hsh_dz8=hist(h_dz8,8);
hsv_dz8=hist(v_dz8,8);
h_dz9sz=size(h_dz9);
v_dz9sz=size(v_dz9);
hsh_dz9=hist(h_dz9,8);
hsv_dz9=hist(v_dz9,8);
h_cz1sz=size(h_cz1);
v_cz1sz=size(v_cz1);
hsh_cz1=hist(h_cz1,8);
hsv_cz1=hist(v_cz1,8);
h_cz2sz=size(h_cz2);
v_cz2sz=size(v_cz2);
hsh_cz2=hist(h_cz2,8);
hsv_cz2=hist(v_cz2,8);
h_cz3sz=size(h_cz3);
v_cz3sz=size(v_cz3);
hsh_cz3=hist(h_cz3,8);
hsv_cz3=hist(v_cz3,8);
h_cz4sz=size(h_cz4);
v_cz4sz=size(v_cz4);
hsh_cz4=hist(h_cz4,8);
hsv_cz4=hist(v_cz4,8);
h_cz5sz=size(h_cz5);
v_cz5sz=size(v_cz5);
hsh_cz5=hist(h_cz5,8);
hsv_cz5=hist(v_cz5,8);
h_cz6sz=size(h_cz6);
v_cz6sz=size(v_cz6);
hsh_cz6=hist(h_cz6,8);
hsv_cz6=hist(v_cz6,8);
h_cz7sz=size(h_cz7);
v_cz7sz=size(v_cz7);
hsh_cz7=hist(h_cz7,8);
hsv_cz7=hist(v_cz7,8);
h_cz8sz=size(h_cz8);
v_cz8sz=size(v_cz8);
hsh_cz8=hist(h_cz8,8);
hsv_cz8=hist(v_cz8,8);
h_cz9sz=size(h_cz9);
v_cz9sz=size(v_cz9);
hsh_cz9=hist(h_cz9,8);
hsv_cz9=hist(v_cz9,8);
curlz1sz=size(curlz1);
hscurlz1=hist(curlz1,8);
curlz2sz=size(curlz2);
hscurlz2=hist(curlz2,8);
curlz3sz=size(curlz3);
hscurlz3=hist(curlz3,8);
curlz4sz=size(curlz4);
hscurlz4=hist(curlz4,8);
curlz5sz=size(curlz5);
hscurlz5=hist(curlz5,8);
curlz6sz=size(curlz6);
hscurlz6=hist(curlz6,8);
%hslowerPos=hist(lowerPos,18);
%hsupperPos=hist(upperPos,18);
%hshorizdir=hist(horizdir,8);
%hsvertdir=hist(vertdir,8);
%hshorizcurv=hist(horizcurv,8);
%hsvertcurv=hist(vertcurv,8);
%hsasp=hist(asp,8);
%hscurl=hist(curl,8);
%hslin=hist(lin,8);
hsslp=hist(slp,8);


%versz=size(ver);
%aspsz=size(asp);
%linsz=size(lin);
slpsz=size(slp);
%curlsz=size(curl);

%hslowerPos=hslowerPos./versz(1);
%hsupperPos=hsupperPos./versz(1);
%hshorizdir=hshorizdir./dirsz(1);
%hsvertdir=hsvertdir./dirsz(1);
%hshorizcurv=hshorizcurv./curvsz(1);
%hsvertcurv=hsvertcurv./curvsz(1);
%hsasp=hsasp./aspsz(1);
%hslin=hslin./linsz(1);
hsslp=hsslp./slpsz(1);
%hscurl=hscurl./curlsz(1);
hsst_x=hsst_x./st_xsz(1);
hsst_y=hsst_y./st_ysz(1);
if(h_dz1sz(1)>0)
    hsh_dz1=hsh_dz1./h_dz1sz(1);
else
    for i=1:8
        hsh_dz1(i)=0.0;
    end
end
if(v_dz1sz(1)>0)
    hsv_dz1=hsv_dz1./v_dz1sz(1);
else
    for i=1:8
        hsv_dz1(i)=0.0;
    end
end
if(h_dz2sz(1)>0)
    hsh_dz2=hsh_dz2./h_dz2sz(1);
else
    for i=1:8
        hsh_dz2(i)=0.0;
    end
end
if(v_dz2sz(1)>0)
    hsv_dz2=hsv_dz2./v_dz2sz(1);
else
    for i=1:8
        hsv_dz2(i)=0.0;
    end
end
if(h_dz3sz(1)>0)
    hsh_dz3=hsh_dz3./h_dz3sz(1);
else
    for i=1:8
        hsh_dz3(i)=0.0;
    end
end
if(v_dz3sz(1)>0)
    hsv_dz3=hsv_dz3./v_dz3sz(1);
else
    for i=1:8
        hsv_dz3(i)=0.0;
    end
end
if(h_dz4sz(1)>0)
    hsh_dz4=hsh_dz4./h_dz4sz(1);
else
    for i=1:8
        hsh_dz4(i)=0.0;
    end
end
if(v_dz4sz(1)>0)
    hsv_dz4=hsv_dz4./v_dz4sz(1);
else
    for i=1:8
        hsv_dz4(i)=0.0;
    end
end
if(h_dz5sz(1)>0)
    hsh_dz5=hsh_dz5./h_dz5sz(1);
else
    for i=1:8
        hsh_dz5(i)=0.0;
    end
end
if(v_dz5sz(1)>0)
    hsv_dz5=hsv_dz5./v_dz5sz(1);
else
    for i=1:8
        hsv_dz5(i)=0.0;
    end
end
if(h_dz6sz(1)>0)
    hsh_dz6=hsh_dz6./h_dz6sz(1);
else
    for i=1:8
        hsh_dz6(i)=0.0;
    end
end
if(v_dz6sz(1)>0)
    hsv_dz6=hsv_dz6./v_dz6sz(1);
else
    for i=1:8
        hsv_dz6(i)=0.0;
    end
end
if(h_dz7sz(1)>0)
    hsh_dz7=hsh_dz7./h_dz7sz(1);
else
    for i=1:8
        hsh_dz7(i)=0.0;
    end
end
if(v_dz7sz(1)>0)
    hsv_dz7=hsv_dz7./v_dz7sz(1);
else
    for i=1:8
        hsv_dz7(i)=0.0;
    end
end
if(h_dz8sz(1)>0)
    hsh_dz8=hsh_dz8./h_dz8sz(1);
else
    for i=1:8
        hsh_dz8(i)=0.0;
    end
end
if(v_dz8sz(1)>0)
    hsv_dz8=hsv_dz8./v_dz8sz(1);
else
    for i=1:8
        hsv_dz8(i)=0.0;
    end
end
if(h_dz9sz(1)>0)
    hsh_dz9=hsh_dz9./h_dz9sz(1);
else
    for i=1:8
        hsh_dz9(i)=0.0;
    end
end
if(v_dz9sz(1)>0)
    hsv_dz9=hsv_dz9./v_dz9sz(1);
else
    for i=1:8
        hsv_dz9(i)=0.0;
    end
end

if(h_cz1sz(1)>0)
    hsh_cz1=hsh_cz1./h_cz1sz(1);
else
    for i=1:8
        hsh_cz1(i)=0.0;
    end
end
if(v_cz1sz(1)>0)
    hsv_cz1=hsv_cz1./v_cz1sz(1);
else
    for i=1:8
        hsv_cz1(i)=0.0;
    end
end
if(h_cz2sz(1)>0)
    hsh_cz2=hsh_cz2./h_cz2sz(1);
else
    for i=1:8
        hsh_cz2(i)=0.0;
    end
end
if(v_cz2sz(1)>0)
    hsv_cz2=hsv_cz2./v_cz2sz(1);
else
    for i=1:8
        hsv_cz2(i)=0.0;
    end
end
if(h_cz3sz(1)>0)
    hsh_cz3=hsh_cz3./h_cz3sz(1);
else
    for i=1:8
        hsh_cz3(i)=0.0;
    end
end
if(v_cz3sz(1)>0)
    hsv_cz3=hsv_cz3./v_cz3sz(1);
else
    for i=1:8
        hsv_cz3(i)=0.0;
    end
end
if(h_cz4sz(1)>0)
    hsh_cz4=hsh_cz4./h_cz4sz(1);
else
    for i=1:8
        hsh_cz4(i)=0.0;
    end
end
if(v_cz4sz(1)>0)
    hsv_cz4=hsv_cz4./v_cz4sz(1);
else
    for i=1:8
        hsv_cz4(i)=0.0;
    end
end
if(h_cz5sz(1)>0)
    hsh_cz5=hsh_cz5./h_cz5sz(1);
else
    for i=1:8
        hsh_cz5(i)=0.0;
    end
end
if(v_cz5sz(1)>0)
    hsv_cz5=hsv_cz5./v_cz5sz(1);
else
    for i=1:8
        hsv_cz5(i)=0.0;
    end
end
if(h_cz6sz(1)>0)
    hsh_cz6=hsh_cz6./h_cz6sz(1);
else
    for i=1:8
        hsh_cz6(i)=0.0;
    end
end
if(v_cz6sz(1)>0)
    hsv_cz6=hsv_cz6./v_cz6sz(1);
else
    for i=1:8
        hsv_cz6(i)=0.0;
    end
end
if(h_cz7sz(1)>0)
    hsh_cz7=hsh_cz7./h_cz7sz(1);
else
    for i=1:8
        hsh_cz7(i)=0.0;
    end
end
if(v_cz7sz(1)>0)
    hsv_cz7=hsv_cz7./v_cz7sz(1);
else
    for i=1:8
        hsv_cz7(i)=0.0;
    end
end
if(h_cz8sz(1)>0)
    hsh_cz8=hsh_cz8./h_cz8sz(1);
else
    for i=1:8
        hsh_cz8(i)=0.0;
    end
end
if(v_cz8sz(1)>0)
    hsv_cz8=hsv_cz8./v_cz8sz(1);
else
    for i=1:8
        hsv_cz8(i)=0.0;
    end
end
if(h_cz9sz(1)>0)
    hsh_cz9=hsh_cz9./h_cz9sz(1);
else
    for i=1:8
        hsh_cz9(i)=0.0;
    end
end
if(v_cz9sz(1)>0)
    hsv_cz9=hsv_cz9./v_cz9sz(1);
else
    for i=1:8
        hsv_cz9(i)=0.0;
    end
end
if(curlz1sz(1)>0)
    hscurlz1=hscurlz1./curlz1sz(1);
else
    for i=1:8
        hscurlz1(i)=0.0;
    end
end
if(curlz2sz(1)>0)
    hscurlz2=hscurlz2./curlz2sz(1);
else
    for i=1:8
        hscurlz2(i)=0.0;
    end
end
if(curlz3sz(1)>0)
    hscurlz3=hscurlz3./curlz3sz(1);
else
    for i=1:8
        hscurlz3(i)=0.0;
    end
end
if(curlz4sz(1)>0)
    hscurlz4=hscurlz4./curlz4sz(1);
else
    for i=1:8
        hscurlz4(i)=0.0;
    end
end
if(curlz5sz(1)>0)
    hscurlz5=hscurlz5./curlz5sz(1);
else
    for i=1:8
        hscurlz5(i)=0.0;
    end
end
if(curlz6sz(1)>0)
    hscurlz6=hscurlz6./curlz6sz(1);
else
    for i=1:8
        hscurlz6(i)=0.0;
    end
end



%inp(itr,1)=class;
%for i=1:18
   % p=p+1;
	%fprintf(fid,'%d:%f  ',p,hslowerPos(i));
%end
%for i=1:18
    %p=p+1;
	%fprintf(fid,'%d:%f  ',p,hsupperPos(i));
%end
%for i=1:8
    %p=p+1;
	%fprintf(fid,'%d:%f  ',p,hshorizdir(i));
%end
%for i=1:8
    %p=p+1;
	%fprintf(fid,'%d:%f  ',p,hsvertdir(i));
%end
%for i=1:8
    %p=p+1;
	%fprintf(fid,'%d:%f  ',p,hshorizcurv(i));
%end
%for i=1:8
    %p=p+1;
	%fprintf(fid,'%d:%f  ',p,hsvertcurv(i));
%end
%for i=1:8
    %p=p+1;
	%fprintf(fid,'%d:%f  ',p,hsasp(i));
%end
%for i=1:8
    %p=p+1;
	%fprintf(fid,'%d:%f  ',p,hscurl(i));
%end
%for i=1:8
    %p=p+1;
	%fprintf(fid,'%d:%f  ',p,hslin(i));
%end
jec=1;
for i=1:8
    inp(iter,jec)=hsslp(i);
    jec=jec+1;
end

for i=1:8
    inp(iter,jec)=hsst_x(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsst_y(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz1(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz1(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz2(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz2(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz3(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz3(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz4(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz4(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz5(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz5(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz6(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz6(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz7(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz7(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz8(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz8(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_dz9(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_dz9(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz1(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz1(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz2(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz2(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz3(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz3(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz4(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz4(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz5(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz5(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz6(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz6(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz7(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz7(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz8(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz8(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsh_cz9(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hsv_cz9(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hscurlz1(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hscurlz2(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hscurlz3(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hscurlz4(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hscurlz5(i);
    jec=jec+1;
end
for i=1:8
    inp(iter,jec)=hscurlz6(i);
    jec=jec+1;
end

%for i=1:1
    %p=p+1;
    %fprintf(fid,'%d:%f  ',p,d_w_h);
%end

    



