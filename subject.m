function [ f ] = subject( S )
%SUPERVISION Summary of this function goes here
%   Detailed explanation goes here
    f = 1:size(S);
    f = f';
    for i = 1:size(S)
       f(i) = str2num(S(i,19:20));
    end
end

