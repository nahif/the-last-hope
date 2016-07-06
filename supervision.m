function [ d ] = supervision( S )
%SUPERVISION Summary of this function goes here
%   Detailed explanation goes here
    d = 1:size(S);
    d = d';
    for i = 1:size(S)
       d(i) = str2num(S(i,25:26));
    end
end

