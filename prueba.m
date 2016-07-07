clt;
% 
F       = dir('jaffe_new/*.png');
nImages = length(F);

for i = 145:nImages
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
% 
% [I_eye1, I_eye2, I_nose, I_mouth] = preProcessing(imread('jaffe_new/face_07_08_02.png'));
% imshow(I_eye1);
% input('next')
% imshow(I_eye2);
% input('next')
% imshow(I_nose);
% input('next')
% imshow(I_mouth);
% input('next')
% 

