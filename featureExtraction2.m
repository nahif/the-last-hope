function [ X, Xn, S ] = featureExtraction2( )
%FEAUREEXTRACTION Summary of this function goes here
%   Detailed explanation goes here
    folder = dir('./jaffe_new_parser');
    S = extractfield(folder, 'name')';
    S = S(3:size(S),1);
    X = zeros(213,18);
    for i = 1:size(S)
        I = imread(strcat('./jaffe_new_parser/', char(S(i))));
        R = Bim_segbalu(I);
        [A,Xn] = Bfx_basicgeo(R);
         for j = 1:18
             A
            X(i,j) = A(j);
         end
    end

end

