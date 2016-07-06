function [ Xtrain, Xtest, dtrain, dtest ] = leaveoneout( X,d,f,subject )
nImages = length(d);
trainIndexes = zeros(nImages,1);
testIndexes  = zeros(nImages,1);
j = 0;
for i=1:nImages
    if f(i) == subject
        j = j + 1;
        testIndexes(j) = i;
    else
        trainIndexes(i-j) = i;
    end
end
trainIndexes = trainIndexes(1:nImages-j);
testIndexes = testIndexes(1:j);
Xtrain = X(trainIndexes,:);
Xtest  = X(testIndexes,:);
dtrain = d(trainIndexes);
dtest  = d(testIndexes);

end