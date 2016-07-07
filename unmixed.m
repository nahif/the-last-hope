function [ p ] = unmixed( X, S, d, b )

length(b)
f = subject(S);
fmin = min(f);
fmax = max(f);
n = fmax - fmin + 1;

p = zeros(length(b),1);
M = zeros(7,7,length(b));
for i = fmin:fmax
  [Ytr,Yte,dtr,dte] = leaveoneout(X,d,f,i);
  dds  = Bcl_structure(Ytr,dtr,Yte,b);
  p = p + Bev_performance(dds,dte);
  M = M + calculateMistakes(dds,dte,length(b));
end
M
p = p/n;
end

function [M] = calculateMistakes(dds,dte,pages)
  M = zeros(7,7,pages);
  for i = 1:pages
    mistakes = zeros(7,7);
    for j = 1:length(dte)
      mistakes(dds(j,i),dte(j)) = mistakes(dds(j,i),dte(j)) + 1;
    end
    M(:,:,i) = mistakes;
  end
end