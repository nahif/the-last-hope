clt;

F       = dir('jaffe_new/*.png');
nImages = length(F);

for i = 1:nImages
    I   = imread(['jaffe_new/' F(i).name]);
    [I_eye1, I_eye2, I_nose, I_mouth] = preProcessing(I);
    imshow(I_eye1);
    input(F(i).name)
    imshow(I_eye2);
    input('next')
    imshow(I_nose);
    input('next')
    imshow(I_mouth);
    input('next')
end


