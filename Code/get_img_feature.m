function features = get_img_feature(img, h_flip)
% feature extraction from 
% Off-line Arabic Handwriting recognitionsystem based on concavity features
% and HMM classifier - Sherif Abdel Azeem et al. ICPR 2012

FRAME_WIDTH = 3;
OVERLAP = 1;
NB_FEATURE = 2; % to update manually if we add more features

% load the image
%img = imread(img_filename);
% make it single channel and binary
img = img(:,:,1) > 0.5;
% reverse background color
img = ~img;

% reverse image horizontal axis if needed (for Arabic)
if(h_flip)
    img = fliplr(img);
end

% normalise the stroke thickness
img = bwmorph(img, 'thin', Inf);
img = bwmorph(img, 'dilate'); 

% prepare all the mask
pattern = [ 0 -1  0;
           -1 -1 -1;
            0 -1  0];
all_mask = cell(8, 1);
for i = 1:length(all_mask)
    all_mask{i} = pattern;
end

all_mask{1}(2,3) = 1; % right
all_mask{2}(2,1) = 1; % left
all_mask{3}(1,2) = 1; % top
all_mask{4}(3,2) = 1; % down

all_mask{5}(1,2) = 1; % right up
all_mask{5}(2,3) = 1;

all_mask{6}(2,1) = 1; % left down
all_mask{6}(3,2) = 1;

all_mask{7}(1,2) = 1; % left up
all_mask{7}(2,1) = 1;

all_mask{8}(2,3) = 1; % right down
all_mask{8}(3,2) = 1;

mask_images = cell(length(all_mask), 1);
for i = 1:length(all_mask)
    mask_images{i} = bwhitmiss(img, all_mask{i});
end

% for i = 1:length(mask_images)
%     imtool(mask_images{i});
% end
img_width = size(img,2);
img_height = size(img,1);

nb_frame = length(1:OVERLAP:img_width);
features = zeros(nb_frame, NB_FEATURE*length(mask_images));

index = 0;
for i = 1:OVERLAP:img_width
    last_col = min(i+FRAME_WIDTH-1, img_width);
    index = index + 1;
    for j = 1:length(mask_images)
        frame = mask_images{j}(:,i:last_col);
        linear_frame = reshape(frame, numel(frame), 1);
        total_one = sum(linear_frame);
        row_total = sum(frame, 2);
        gravity_center_num = sum(row_total .* (1:img_height)');
        gravity_center_den = total_one + (total_one == 0); % avoid division by 0
        gravity_center = gravity_center_num / gravity_center_den;
        gravity_center = 100/img_height * gravity_center;
        
        features(index, (1:2) + 2*(j-1))  = [total_one, gravity_center]  ;     
    end
end

