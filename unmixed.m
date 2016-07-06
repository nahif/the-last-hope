function [ p ] = unmixed( X, S, d, b )

f = subject(S);
fmin = min(f);
fmax = max(f);
n = fmax - fmin + 1;

p = zeros(length(b),1);

for i = fmin:fmax
  [Ytr,Yte,dtr,dte] = leaveoneout(X,d,f,i);
  dds  = Bcl_structure(Ytr,dtr,Yte,b);
  p = p + Bev_performance(dds,dte);
end

p = p/n;
end