clt;

%Agregamos vlfeat
run('vlfeat-0.9.20/toolbox/vl_setup');

% 1 - Extracci�n de caracter�sticas
if exist('data.mat')
    load('data.mat')
else
    [X, Xn, S] = featureExtraction();
end

% 2 - Supervisin
[d] = supervision(S);
emotion = [3 6];

clear b;
k = 0;
k=k+1;b(k).name = 'lda';    b(k).options.p = [];  b(k).string = 'LDA';            % LDA
k=k+1;b(k).name = 'dmin';   b(k).options = [];    b(k).string = 'Euclidean';      % Euclidean distance
k=k+1;b(k).name = 'nbnnxi'; b(k).options.D = 5;   b(k).options.show =0; b(k).string = 'NBNN';

[p, punmixed, p_emo] = singleEmotionClassifier(X,d,S,30,b,emotion);

fprintf('%10s Mixed\n')
% 7 - Resultados
for i=1:length(b)
    fprintf('%15s = %6.2f%%\n',b(i).string,p(i)*100);
end

fprintf('\n%10s Unmixed\n')
for i=1:length(b)
    fprintf('%15s = %6.2f%%\n',b(i).string,punmixed(i)*100);
end

fprintf('\nTrue+ | False- | True+ | False- \n')
p_emo
