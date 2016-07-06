clt;

folder = dir('./jaffe_new');
S = extractfield(folder, 'name')';
S = S(3:size(S),1);
for i = 1:size(S)
   I = imread(strcat('./jaffe_new/', char(S(i))));
   I = processingImage(I);
   I = imresize(I, [90 110]);
   imwrite(I,strcat('./jaffe_new_parser/', char(S(i))));
end