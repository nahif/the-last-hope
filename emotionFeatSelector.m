function [ Xemotion,d2,s ] = emotionFeatSelector( X, d, nFeat, emotion )
%SINGLEEMOTIONCLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
  op.m = nFeat;
  op.show = 0;
  op.b.name = 'fisher';
  d2 = d;
  
  for i = 1:length(d)
    d2(i) = length(emotion)+1;
    for j = 1:length(emotion)
      if d(i) == emotion(j)
        d2(i) = j;
      end
    end
  end
  
  s = Bfs_sfs(X,d,op);
  Xemotion = X(:,s);

end

