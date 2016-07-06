function [X, Xn, S] = featureExtraction () 
  f.path          = './jaffe_new_parser/';  % directory of the images
  f.prefix        =  '*';
  f.extension     =  '.png';
  f.gray          = 0;
  f.imgmin        = 1;
  f.imgmax        = 213;
% 
  b(1).name = 'lbp';
  b(1).options.vdiv = 4;
  b(1).options.hdiv = 4;
  b(1).options.sample = 8;
  b(1).options.mappingtype = 'ri';
  b(1).options.show = 0;
  b(1).options.type = 2;
  b(1).options.mappingtype = 'u2';

%   b(2).name = 'gabor';
%   b(2).options.show = 0;
%   b(2).options.Lgabor=8;
%   b(2).options.Sgabor=6;
%   b(2).options.fhgabor=2;
%   b(2).options.flgabor=0.1;
%   b(2).options.Mgabor=21;
%   b(2).options.type=2;  
%     b(1).name = 'hugeo'; b(1).options.b =1;      b(1).options.show    = 0;    % Hu moments
%                                 b(1).options.type    = 1;    % geometric
%  

  opf.b = b;
  opf.channels = 'g';
  [X,Xn,S] = Bfx_files(f,opf);

end
