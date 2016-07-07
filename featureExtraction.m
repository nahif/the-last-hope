function [X, Xn, S] = FeatureExtraction3()
  F       = dir('jaffe_new/*.png');
  nImages = length(F);
  nFeatures = 64 * 4; %Magic number, fix

  options.nj    = 4;
  options.ni    = 4;
  options.B     = 4;
  options.show  = 0;

  X = zeros(2*nImages,nFeatures);
  for i = 1:nImages
    ['Processing image ' F(i).name]
    I   = imread(['jaffe_new/' F(i).name]);
    X(2*i-1:2*i,:) = singleImageFeatureExtraction(I,options);
    s = num2str(['jaffe_new/' F(i).name]);
    S(2*i-1,:) = s;
    S(2*i,  :) = s;
  end

  Xn = 0;

end
