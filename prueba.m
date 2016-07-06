clear;

I = imread('jaffe_new/face_01_01_02.png');

[I_eye1, I_eye2, I_nose, I_mouth] = preProcessing(I);

imshow(I_mouth);
