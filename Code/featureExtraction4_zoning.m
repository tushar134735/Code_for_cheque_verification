function [inp] = featureExtraction4_zoning(d,iter,inp)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


n=size(d);

q=quantized_slope(d);
disp(q);

%dominant points calculation
ct=2;      %curvature threshold
szq=size(q);
dom(1,:)=d(1,:);        %first and last points are dominant by default
top=2;
for i=2:(szq(2)-1)
    m1=mod(q(i+1)-q(i)+8,8);
    %m2=mod(q(i)-q(i-1)+8,8);
    if (m1>=ct)
        dom(top,:)=d(i,:);
      top(1)=top(1)+1;
   end
end
dom(top,:)=d(n(1),:);
%disp(dom);
%[z1,z2,z3,z4,z5,z6,z7,z8,z9]=quantized_slope_zoning(dom);      %quantized slopes among dominant points
[z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16]=quantized_slope_16zoning(dom);
%[z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16]=quantized_slope18_16zoning(dom);
%[z1,z2,z3,z4]=quantized_slope_4zoning(dom);
%disp(q_dom);    
                            %histogram
h1=histogram(z1);
h2=histogram(z2);
h3=histogram(z3);
h4=histogram(z4);
h5=histogram(z5);
h6=histogram(z6);
h7=histogram(z7);
h8=histogram(z8);
h9=histogram(z9);
h10=histogram(z10);
h11=histogram(z11);
h12=histogram(z12);
h13=histogram(z13);
h14=histogram(z14);
h15=histogram(z15);
h16=histogram(z16);

q_dom=[h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16];                %sixteen zoning
%q_dom=[h1,h2,h3,h4];                              %four zoning
%q_dom=[z1,z2,z3,z4,z5,z6,z7,z8,z9];
%q_dom=[h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16];
%fprintf(fid,'%d ',class);
s=size(q_dom);
jec=1;
for i=1:s(2)
   inp(iter,jec)=q_dom(i);
   jec=jec+1;
end
%fprintf(fid, '\n');
%fprintf(flab,'%d\n', class );

end


