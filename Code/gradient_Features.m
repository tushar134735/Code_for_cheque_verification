function [features]=gradient_Features(image)

% clc;
% file='test_data\Test1.jpg';
% imagen=preprocessing(file);
% figure 
% imshow(imagen);title('input');

% n1=imagen(min(r):max(r),min(c):max(c));
%     figure(8);
%     imshow(~n1);
%     title('~n1')

BW2 = bwmorph(image,'thin',Inf);
    imrotate(BW2,0);
%     figure(9);
%     imshow(~BW2);
%     title('~n1');
    image=BW2;
%%

%original_image=imagen;% just backing up the orginal image
row=size(image,1);
column=size(image,2);
% we have to ceil this no.s to the nearest multiple of 3 since
% 3x3 windowing is used

% first we have to ensure that image consists of minimum 9 rows and minimum
% 9 columns
add_rows=0; %no of additional rows to make min of 9x9 matrix
add_columns=0; % similar for columns
if row<9
    add_rows=9-row;
end
if column<9
    add_columns=9-column;
end

if mod(add_rows,2)==0
    image=[zeros(add_rows/2,column);image;zeros(add_rows/2,column)];
else
    image=[zeros((add_rows-1)/2,column);image;zeros((add_rows+1)/2,column)];
end
%appending rows of zeros
%after above op, no.of rows changes so it should be updated
%equal no of rows should be added on top and bottom
row=size(image,1);
if mod(add_columns,2)==0
    image=[zeros(row,(add_columns)/2),image,zeros(row,(add_columns)/2)];
else
    image=[zeros(row,(add_columns-1)/2),image,zeros(row,(add_columns+1)/2)];
end
column=size(image,2); %updating the column value


n_rows=ceil(row/3)*3-row; % no of rows of zeros to be added
n_columns=ceil(column/3)*3-column; % no of columns of zeros to be added
% assume row=4, so 2 rows of zeros should be added. ceil(4/3)*3 will return
% 6 which is nearest multiple of 3 to 4 from right side. So n_rows will
% contain no.of rows to be added to the image.

if mod(n_rows,2)==0
    image=[zeros(n_rows/2,column);image;zeros(n_rows/2,column)];
else
    image=[zeros((n_rows-1)/2,column);image;zeros((n_rows+1)/2,column)];
end
%appending rows of zeros
%after above op, no.of rows changes so it should be updated
%equal no of rows should be added on top and bottom
row=size(image,1);
if mod(n_columns,2)==0
    image=[zeros(row,(n_columns)/2),image,zeros(row,(n_columns)/2)];
else
    image=[zeros(row,(n_columns-1)/2),image,zeros(row,(n_columns+1)/2)];
end
column=size(image,2); %updating the column value
% so now the image can be divided into 3x3 zones
% here in above code some more features are to be added, like if two rows
% of zeros are to be added then one on either side of the image and
% similarily for columns.

zone_height=row/3;
zone_width=column/3;
%say at this point image is 12x9, so no.of rows in each zone should be
%12/3=4, whereas columns should be 9/3=3. This is stored in variables zone
%height and width
%----------------------zones are devided like shown below-------------!!!!!!!
%                              -----------------------
%                             |   z1   |   z4  |  z7  |
%                             |        |       |      |
%                              -----------------------
%                             |   z2   |   z5  |  z8  |
%                             |        |       |      |
%                              -----------------------
%                             |   z3   |   z6  |  z9  |
%                             |        |       |      |
%                              -----------------------
zone1=image(1:zone_height,1:zone_width);
zone2=image(1:zone_height,(zone_width+1):2*zone_width);
zone3=image(1:zone_height,(2*zone_width+1):end);

zone4=image((zone_height+1):2*zone_height,1:zone_width);
zone5=image((zone_height+1):2*zone_height,(zone_width+1):2*zone_width);
zone6=image((zone_height+1):2*zone_height,(2*zone_width+1):end);

zone7=image((2*zone_height+1):end,1:zone_width);
zone8=image((2*zone_height+1):end,(zone_width+1):2*zone_width);
zone9=image((2*zone_height+1):end,(2*zone_width+1):end);

% feature_vectors
zone1_features=zonal_grad_features(zone1);
zone2_features=zonal_grad_features(zone2);
zone3_features=zonal_grad_features(zone3);
zone4_features=zonal_grad_features(zone4);
zone5_features=zonal_grad_features(zone5);
zone6_features=zonal_grad_features(zone6);

zone7_features=zonal_grad_features(zone7);
zone8_features=zonal_grad_features(zone8);
zone9_features=zonal_grad_features(zone9);

% this is a feature called euler no...euler no. is diff between no.of
% objects and holes in that image
euler=bweuler(image);


features=[zone1_features zone2_features zone3_features zone4_features zone5_features zone6_features zone7_features zone8_features zone9_features];
loc_grad_size=size(features)
%stats=regionprops(bwlabel(image),'all');

%skel_size=numel(image);

%convexarea=(stats.ConvexArea)/skel_size;

%eccentricity=stats.Eccentricity;

%extent=stats.Extent;

%filledarea=(stats.FilledArea)/skel_size;

%majoraxislength=(stats.MajorAxisLength)/skel_size;

%minoraxislength=(stats.MinorAxisLength)/skel_size;

%orientation =stats.Orientation;

% this are the regional features
%regional_features=[eccentricity;extent;orientation];

%features=[features;regional_features];   

