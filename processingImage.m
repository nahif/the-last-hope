function [ I ] = processingImage( I )
%PROCESSINGIMAGE Summary of this function goes here

%   Detailed explanation goes here
%To detect Eyes
BB1 = [];
i = 30;
while isempty(BB1)==1
    i = i - 1;
    EyeDetect = vision.CascadeObjectDetector('EyePairBig','MergeThreshold',i);
    BB1=step(EyeDetect,I);
end

%To detect Mouth
BB2 = [];
i = 0;
while isempty(BB2)==1
    i = i + 1;
    MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',i);
    BB2=step(MouthDetect,I);
    if size(BB2,1) > 1
        BB2 = BB2(2,:);
    end
    %busca que no sea el ojo
    if isempty(BB2)==0
        if BB1(2) + BB1(4) > BB2(2)
            BB2 = [];
        end
    end
    %si es que no encuentra la boca saca un estimado
    if i == 90
        BB2 = BB1;
        BB2(1) = BB1(1) + 12;
        BB2(2) = BB1(2) + 39;
        BB2(3) = BB1(3) - 30;
        BB2(4) = BB1(4) + 7;
    end
end



x = BB1(1) - 1;
y = BB1(2) - 12;
w = max(BB2(1) - BB1(1) + BB2(3) + 1, BB1(3));
h = BB2(2) - BB1(2) + BB1(4) + 20;
E = edge(I,'Sobel',0.075);
I = imfuse(I,E,'blend','Scaling','joint');
I = imcrop(I,[ x y w h ]);
%  I = edge(I,'Sobel',0.075);
end

