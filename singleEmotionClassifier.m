function [ p, punmixed, p_emo ] = singleEmotionClassifier( X,d,S,n,b,emotion )
%SINGLEEMOTIONCLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
  [Y,d_emo] = emotionFeatSelector(X,d,n,emotion);
  
  op.strat=1; op.b = b; op.v = 5; op.show = 1; op.c = 0.95;
  [p,ci] = Bev_crossval(Y,d,op);
  [punmixed, p_emo] = unmixedSE(Y, S, d_emo, b);
  
end

