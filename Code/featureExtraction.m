function f_v = feature_extraction(img)
f_v=[];
 proj_f = projection(img);
 f_v = [f_v proj_f];

%---------------Global gradient features----------:
 gradG_f = global_gradient(img);
f_v = [f_v gradG_f];
% 
% 
% 
% %%
% %---------------local gradient features-----------:
grad_f = gradient_Features(img);
f_v = [f_v grad_f];
 
