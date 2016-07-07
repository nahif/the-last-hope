function [ M ] = mistakeMatrix( dds,dte,pages )
%MISTAKEMATRIX Summary of this function goes here
%   Detailed explanation goes here
  dmax = max(dte);  
  M = zeros(dmax,dmax,pages);
  for i = 1:pages
    mistakes = zeros(dmax,dmax);
    for j = 1:length(dte)
      mistakes(dds(j,i),dte(j)) = mistakes(dds(j,i),dte(j)) + 1;
    end
    M(:,:,i) = mistakes;
  end

end

