function [ Xemotion,d2,s ] = emotionFeatSelector( X, d, nFeat, emotion )
%SINGLEEMOTIONCLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
  op.m = nFeat;
  op.show = 0;
  op.b.name = 'fisher';
  d2 = d;
  
  if emotion > 0
    for i = 1:length(d)
      if d(i) == emotion
        d2(i) = 1;
      else
        d2(i) = 2;
      end
    end
  end
  
  s = Bfs_sfs(X,d,op);
  Xemotion = X(:,s);

end

