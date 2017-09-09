function [ hist ] = histogram( z )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if(size(z)==0)
    z=[-1];
end
edges=[0,1,2,3,4,5,6,7];
hist=histc(z,edges);
sz=size(z);
hist=hist./sz(2);

end

