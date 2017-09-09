function f_pro=projection(img)


%E=entropy(img);

x = sum(img,2);
[row, col]= size(x);
x_sum=sum(x);
meanX=x_sum/row;


y = sum(img,1);
y_sum = sum(y);
meanY=y_sum/row;


varX=0;
for i=1:row
    varX=varX+( x(i)-meanX)*( x(i)-meanX);
end
varX=varX/row;
%f_pro=[meanX meanY varX];

%s_dX=sqrt(varX);

varY=0;
for i=1:row
    varY=varY+( y(i)-meanY)*( y(i)-meanY);
end
varY=varY/row;
%s_dY=sqrt(varY);
%f_pro=[f_pro varY];

% 
% Ex = 0;
% for i=1:row
%     Ex = Ex +( (x(i)/x_sum)*log((x(i)/x_sum)) );
% end
% Ex=Ex*-1;
% f_pro=[f_pro Ex];
% 
% 
% Ey = 0;
% for i=1:row
%     Ey = Ey +( (y(i)/y_sum)*log((y(i)/y_sum)) );
% end
% Ey=Ey*-1;
% 
% f_pro=[f_pro Ey];

poisX=0;
poisY=0;
for i=1:row
    poisX=poisX+((exp(-meanX))*meanX.^x(i))/(factorial(x(i)));
    poisY=poisY+((exp(-meanY))*meanX.^y(i))/(factorial(y(i)));
end

f_pro=[meanX varX poisX varY poisY];