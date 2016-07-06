function [X, Xn, S] = FeatureExtraction3()
f.path          = './jaffe_new/';  % directory of the images
  f.prefix        =  '*';
  f.extension     =  '.png';
  f.gray          = 0;
  f.imgmin        = 1;
  f.imgmax        = 215;

  b(1).name = 'hog';
  b(1).options.nj = 10;
  b(1).options.ni = 10;
  b(1).options.B = 9;
  b(1).options.show = 0;
  b(1).options.type = 2;

%     b(2).name = 'lbp';
%   b(2).options.vdiv = 4;
%   b(2).options.hdiv = 4;
%   b(2).options.sample = 8;
%   b(2).options.mappingtype = 'ri';
%   b(2).options.show = 0;
%   b(2).options.type = 2;
%   b(2).options.mappingtype = 'u2';


  opf.b = b;
  opf.channels = 'g';
  [X,Xn,S] = Bfx_files(f,opf);


end
