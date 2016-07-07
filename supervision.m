function [ d ] = supervision( S )
%SUPERVISION Summary of this function goes here
%   Detailed explanation goes here

    d = 1:size(S);
    d = d';
    for i = 1:size(S)
       d(i) = str2num(S(i,16:17));
%        if d(i) ~= 1
%            d(i) = 2;
%        end
    end
end

