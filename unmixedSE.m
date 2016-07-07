function [ p, p_emo ] = unmixedSE( X, S, d, b, singleEmotion )

f = subject(S);
fmin = min(f);
fmax = max(f);
n = fmax - fmin + 1;

p = zeros(length(b),1);


p_emo = zeros(length(b),4);

  
for i = fmin:fmax
  [Ytr,Yte,dtr,dte] = leaveoneout(X,d,f,i);
  dds  = Bcl_structure(Ytr,dtr,Yte,b);
  size(dds)
  %calculate False Pos
  if(singleEmotion)
    for k = 1:length(b)
      for j = 1:length(dds)
        if(dds(j,k) == dte(j))
          if(dte(j) == 1)%True Positive
            p_emo(k,1) = p_emo(k,1) + 1;
          else %True Negative
            p_emo(k,2) = p_emo(k,2) + 1;
          end
        else
          if(dte(j) == 1)%False Negative
            p_emo(k,4) = p_emo(k,4) + 1;
          else %False Positive
            p_emo(k,3) = p_emo(k,3) + 1;
          end
        end
      end
    end
  end
  
  p = p + Bev_performance(dds,dte);
end

n1 = p_emo(1,1) + p_emo(1,4);
n2 = p_emo(1,2) + p_emo(1,3);
p_emo(:,1) = p_emo(:,1)/n1;
p_emo(:,2) = p_emo(:,2)/n2;
p_emo(:,3) = p_emo(:,3)/n2;
p_emo(:,4) = p_emo(:,4)/n1;

p_emo = p_emo * 100

p = p/n;
end