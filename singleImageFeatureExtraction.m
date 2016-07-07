function [X] = SingleImageFeatureExtraction(I,options)
  [I_eye1, I_eye2, I_nose, I_mouth] = preProcessing(I);
  I2_eye1 = fliplr(I_eye1);
  I2_eye2 = fliplr(I_eye2);
  I2_nose = fliplr(I_nose);
  I2_mouth = fliplr(I_mouth);


  [Xe1] = Bfx_hog(I_eye1,options);
  [Xe2] = Bfx_hog(I_eye2,options);
%   [Xno] = Bfx_hog(I_nose,options);
  [Xmo] = Bfx_hog(I_mouth,options);

  [X2e1] = Bfx_hog(I2_eye1,options);
  [X2e2] = Bfx_hog(I2_eye2,options);
%   [X2no] = Bfx_hog(I2_nose,options);
  [X2mo] = Bfx_hog(I2_mouth,options);




%   X = [Xe1 Xe2 Xno Xmo; X2e1 X2e2 X2no X2mo ];
    X = [Xe1 Xe2 Xmo; X2e1 X2e2 X2mo ];
end
