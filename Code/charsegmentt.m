function [se1] = charsegmentt(a1)
myFolder = 'D:\8th SEM\record2';
c = bwareaopen(a1,20);
i=padarray(c,[0 10]);
verticalProjection = sum(i, 1);
horizontalProjection = sum(i,2);
figure
set(gcf, 'Name', 'Segmentation Trial', 'NumberTitle', 'Off') 
subplot(2, 1, 1);
plot(horizontalProjection,'b-'); 
grid on;
subplot(2,1,2);
plot(verticalProjection, 'b-');
grid on;
[x1,y1] = size(i)
start_x =ceil( x1*.6);
end_x = ceil(x1*.78);
crop_x = i(start_x :end_x ,:);
figure
imshow(crop_x);
verticalProjection1 = sum(crop_x, 1);
t = verticalProjection1;
t(t==20) = inf;
tushar = min(t); 
letterLocations = verticalProjection1 > tushar;
d = diff(letterLocations);
startingColumns = find (d>0);
endingColumns = find(d<0);
y=1;
for k = 1 : length(startingColumns)
  subImage = i(:, startingColumns(k):endingColumns(k)); 
   s = subImage;
   figure, imshow (s);
   imwrite( s, fullfile( myFolder, sprintf('char%d.png', k ) ) );
end;
se1 = (s);