myfolder='D:\8th SEM\words\word_bwOP';

I = imread('D:\8th SEM\words\doc\im48.png');
b = rgb2gray(I);
imshow(b);
%c = 1- im2bw(b,0.75);
c = imcomplement(b);

%c = bwareaopen(c,10);
imshow(c);

%j=i+1;
 imwrite(c,fullfile( myfolder, sprintf('wd48.jpg') ) );
