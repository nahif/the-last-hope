function [ p, p_emo ] = unmixedSE( X, S, d, b )

f = subject(S);
fmin = min(f);
fmax = max(f);
n = fmax - fmin + 1;

p = zeros(length(b),1);


p_emo = zeros(length(b),4);

M = zeros(max(d),max(d),length(b));
  
for i = fmin:fmax
  [Ytr,Yte,dtr,dte] = leaveoneout(X,d,f,i);
  dds  = Bcl_structure(Ytr,dtr,Yte,b);
  %calculate False Pos
  p_emo = countPosAndNeg(p_emo,b,dds,dte);
  p = p + Bev_performance(dds,dte);
  size(M)
  size(mistakeMatrix(dds,dte,length(b)))
  M = M + mistakeMatrix(dds,dte,length(b));
end

M

p_emo = normalize(p_emo);
p_emo = p_emo * 100;

p = p/n;
end

function [p_emo] = countPosAndNeg(p_emo,b,dds,dte)
   for k = 1:length(b)
    for j = 1:length(dds)
      if(dds(j,k) == 1)
        if(dte(j) == 1)
          p_emo(k,1) = p_emo(k,1) + 1;  %True +
        else
          p_emo(k,2) = p_emo(k,2) + 1;  %False +
        end
      else
        if(dte(j) ~= 1)
          p_emo(k,3) = p_emo(k,3) + 1;  %True -
        else
          p_emo(k,4) = p_emo(k,4) + 1;  %False -
        end
      end
    end
  end
  
end

function [p_emo_norm] = normalize(p_emo)
  [m,n] = size(p_emo);
  p_emo_norm = zeros(m,4);
  for i = 1:m
    certainPositive = p_emo(i,1)/(p_emo(i,1) + p_emo(i,2));
    certainNegative = p_emo(i,3)/(p_emo(i,3) + p_emo(i,4));
    detectPositive  = p_emo(i,1)/(p_emo(i,1) + p_emo(i,4));
    detectNegative  = p_emo(i,3)/(p_emo(i,2) + p_emo(i,3));
    
    p_emo_norm(i,:) = [ certainPositive certainNegative detectPositive detectNegative];
  end
  

end