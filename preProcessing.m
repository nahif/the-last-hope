function [I_eye1, I_eye2, I_nose, I_mouth] = preProcessing(I)
%MIXEDSUPERVISION Summary of this function goes here
%   Detailed explanation goes here

  % ojos
  EYES = [];
  i = 30;
  while isempty(EYES)==1
      i = i - 1;
      EyeDetect = vision.CascadeObjectDetector('EyePairSmall','MergeThreshold',i);
      EYES=step(EyeDetect,I);
      if i == 0
        EYES = [16 41 60 14];
      end
      if size(EYES,1) == 3
          EYES = EYES(3,:);
      end
      if size(EYES,1) > 1
          EYES = EYES(1,:);
      end
  end

  EYES(2) = EYES(2) - 13;
  EYES(4) = EYES(4) + 13;

  L_EYE = EYES;
  L_EYE(3) = (EYES(3) / 2) -5;
  R_EYE = EYES;
  R_EYE(1) = EYES(1) + EYES(3)/2 + 5;
  R_EYE(3) = (EYES(3) / 2) -5;

  I_eye1 = imcrop(I, L_EYE);
  I_eye2 = imcrop(I, R_EYE);

  % Nose
  NOSE = [];
  i = 0;
  while isempty(NOSE)==1
      i = i + 1;
      NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',i);
      NOSE=step(NoseDetect,I);
      if size(NOSE,1) > 1
          jaime = NOSE;
          NOSE = NOSE(1,:);
      end
  end
  I_nose = imcrop(I, NOSE);

  % Mouth
  MOUTH = [];
  i = 0;
  while isempty(MOUTH)==1
      i = i + 1;
      MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',i);
      MOUTH=step(MouthDetect,I);
      if size(MOUTH,1) > 1
          jaime = MOUTH;
          MOUTH = MOUTH(2,:);
      end
      if isempty(MOUTH)==0
          if EYES(2) + EYES(4) > MOUTH(2)
              MOUTH = [];
          end
      end
      if i == 90
          MOUTH = EYES;
          MOUTH(1) = EYES(1) + 12;
          MOUTH(2) = EYES(2) + 39;
          MOUTH(3) = EYES(3) - 30;
          MOUTH(4) = EYES(4) + 7;
      end
      if size(MOUTH,1) == 1
         if MOUTH(2) > NOSE(2) + NOSE(4)
             lowmouth = MOUTH(2) + MOUTH(4);
          MOUTH(2) = NOSE(2) + NOSE(4);
          MOUTH(4) = lowmouth - MOUTH(2);
         end
      end
  end
  I_mouth = imcrop(I, MOUTH);

end
