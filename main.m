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

% 3 - Extracci�n de caracter�sticas
op.m = 30;
op.show = 0;
op.b.name = 'fisher';
s = Bfs_sfs(X, d, op);
%
X = X(:,s);

% 5 - Clasificador
clear b;
k = 0;
k=k+1;b(k).name = 'lda';   b(k).options.p = [];         b(k).string = 'LDA';            % LDA
% k=k+1;b(k).name = 'qda';   b(k).options.p = [];         b(k).string = 'QDA';            % QDA
k=k+1;b(k).name = 'dmin';  b(k).options = [];           b(k).string = 'Euclidean';      % Euclidean distance
k=k+1;b(k).name = 'nbnnxi'; b(k).options.D = 5;  b(k).options.show =0; b(k).string = 'NBNN';
k=k+1;b(k).name = 'svmplus';   b(k).options.kernel = 1; b(k).options.svm = 1;   b(k).string = 'SVN';                           % KNN with 5 neighbors
%k=k+1;b(k).name = 'knn';   b(k).options.k = 3;   b(k).string = 'KNN=3';

% 6 - Medidor de desempe�o
clear opt;
op.strat=1; op.b = b; op.v = 5; op.show = 1; op.c = 0.95;
[p,ci] = Bev_crossval(X,d,op);
punmixed = unmixed(X, S, d, b );

fprintf('%10s Mixed\n')
% 7 - Resultados
for i=1:length(b)
    fprintf('%15s = %6.2f%%\n',b(i).string,p(i)*100);
end

fprintf('\n%10s Unmixed\n')
for i=1:length(b)
    fprintf('%15s = %6.2f%%\n',b(i).string,punmixed(i)*100);
end
