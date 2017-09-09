% %%sobel horizontal and vertical mask
function fGG = global_gradient(image)
%%

% clc;
%  file='test_data\Test2.jpg';
%  image=preprocessing(imread(file));


 BW2 = bwmorph(image,'thin',Inf);
 
   %imrotate(BW2,0);
% %     figure(9);
% %     imshow(~BW2);
% %     title('~n1');
    image=BW2;
    %figure;
   % imshow(image);
row=size(image,1);
column=size(image,2);

[Gmag, Gdir]=imgradient(image,'sobel');
z1=[];
z2=[];
z3=[];
z4=[];
z5=[];
z6=[];
z7=[];
z8=[];
code0=0;
code1=0;
code2=0;
code3=0;
code4=0;
code5=0;
code6=0;
code7=0;
code8=0;
code9=0;
code10=0;
code11=0;
%%
for r = 1:row
    for c = 1:column
        
%         %%%%code written by mukesh:
%         if (Gdir(r,c) >= 0 && Gdir(r,c) < 90)
%            Code(r,c) = 0;
%            code0=code0+1;
%         elseif (Gdir(r,c) >= 90 && Gdir(r,c) < 180)
%                 Code(r,c) = 1;
%                 code1=code1+1;
%         elseif (Gdir(r,c) >=-180  && Gdir(r,c) < -90)
%                 Code(r,c) = 2;
%                 code2=code2+1;
%         elseif (Gdir(r,c) >= -90 && Gdir(r,c) < 0)
%                 Code(r,c) = 3;
%                 code3=code3+1;
%         end
%         %%

%%
if (Gdir(r,c) >= 0 && Gdir(r,c)< 45)
            s=size(z1);
            z1(s(2)+1)=0;
           Code(r,c) = 0;
           code0=code0+1;
        elseif (Gdir(r,c) >= 45 && Gdir(r,c) < 90)
            s=size(z2);
            z2(s(2)+1)=0;    
            Code(r,c) = 1;
                code1=code1+1;
        elseif (Gdir(r,c) >= 90 && Gdir(r,c) < 135)
            s=size(z3);
            z3(s(2)+1)=0;  
            Code(r,c) = 2;
                code2=code2+1;
        elseif (Gdir(r,c) >= 135 && Gdir(r,c) < 180)
            s=size(z4);
            z4(s(2)+1)=0;  
            Code(r,c) = 3;
                code3=code3+1;
        elseif (Gdir(r,c) >= -180 && Gdir(r,c) < -135)
            s=size(z5);
            z5(s(2)+1)=0;    
            Code(r,c) = 4;
                code4=code4+1;
        elseif (Gdir(r,c) >= -135 && Gdir(r,c) <-90)
            s=size(z6);
            z6(s(2)+1)=0;  
            Code(r,c) = 5;
                code5=code5+1;
        elseif (Gdir(r,c) >= -90 && Gdir(r,c) < -45)
            s=size(z7);
            z7(s(2)+1)=0;  
            Code(r,c) = 6;
                code6=code6+1;
        elseif (Gdir(r,c) >= -45 && Gdir(r,c) < 0)
            s=size(z8);
            z8(s(2)+1)=0;  
            Code(r,c) = 7;
                code7=code7+1;
        end
        
% %%
%         if (Gdir(r,c) >= 0 && Gdir(r,c) < 30)
%            Code(r,c) = 0;
%            code0=code0+1;
%         elseif (Gdir(r,c) >= 30 && Gdir(r,c) < 60)
%                 Code(r,c) = 1;
%                 code1=code1+1;
%         elseif (Gdir(r,c) >= 60 && Gdir(r,c) < 90)
%                 Code(r,c) = 2;
%                 code2=code2+1;
%         elseif (Gdir(r,c) >= 90 && Gdir(r,c) < 120)
%                 Code(r,c) = 3;
%                 code3=code3+1;
%         elseif (Gdir(r,c) >= 120 && Gdir(r,c) < 150)
%                 Code(r,c) = 4;
%                 code4=code4+1;
%         elseif (Gdir(r,c) >= 150 && Gdir(r,c) <180)
%                 Code(r,c) = 5;
%                 code5=code5+1;
%         elseif (Gdir(r,c) >= -180 && Gdir(r,c) < -150)
%                 Code(r,c) = 6;
%                 code6=code6+1;
%         elseif (Gdir(r,c) >= -150 && Gdir(r,c) < -120)
%                 Code(r,c) = 7;
%                 code7=code7+1;
%         elseif (Gdir(r,c) >= -120 && Gdir(r,c) < -90)
%                 Code(r,c) = 8;
%                 code8=code8+1;
%         elseif (Gdir(r,c) >= -90 && Gdir(r,c) < -60)
%                 Code(r,c) = 9;
%                 code9=code9+1;
%         elseif (Gdir(r,c) >= -60 && Gdir(r,c) < -30)
%                 Code(r,c) = 10;
%                 code10=code10+1;
%         elseif (Gdir(r,c) >= -30 && Gdir(r,c) < 0)
%                 Code(r,c) = 11;
%                 code11=code11+1;
%         end
%     r=r
%     c=c
%     code=Code(r,c)    
    end
    
end
%fGG =[code0 code1 code2 code3] ;
fGG=[code0, code1, code2, code3, code4, code5, code6, code7];
% fGG=[code0 code1 code2 code3 code4 code5 code6 code7 code8 code9 code10 code11]
glo_grad_feat=size(fGG)

%% 
% %%2nd method for sobel edge detector
% C = img_r;
% for i=1:size(C,1)-2
%     for j=1:size(C,2)-2
%         %Sobel mask for x-direction:
%         Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
%         %Sobel mask for y-direction:
%         Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
%       
%         %The gradient of the image
%         %B(i,j)=abs(Gx)+abs(Gy);
%         B(i,j)=sqrt(Gx.^2+Gy.^2);
%       
%     end
% end
% 
% figure,imshow(~B);
% fid = fopen('abc.txt','w');
% [row ,col] = size(~B);
% for x=1:row    
%     for y=1:col
%         fprintf(fid,'%d ',~B(x,y));
%     end
%     fprintf(fid,'\n');
% end
% fclose(fid);
% 
% 
% 
