function [X, Xn, S] = SingleImageFeatureExtraction(I)
  I2 = fliplr(I);

  [I_eye1, I_eye2, I_nose, I_mouth] = preProcessing(I);

  options.nj    = 20;
  options.ni    = 10;
  options.B     = 9;
  options.show  = 0;

  [Xe1, Xne1] = Bfx_hog(I_eye1,options);
  [Xe2, Xne2] = Bfx_hog(I_eye1,options);
  [Xno, Xnno] = Bfx_hog(I_eye1,options);
  [Xmo, Xnmo] = Bfx_hog(I_eye1,options);

  X = [Xe1 Xe2 Xno Xmo];
  Xn = []

  Xn



end