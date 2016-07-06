function [X_train, X_test, Xn] = featureSelection(X_train, X_test, Xn)
%FEATURESELECTION Summary of this function goes here
%   Detailed explanation goes here
s = Bfs_clean(X_train,0);
X_train = X_train(:,s);
X_test = X_test(:,s);
Xn = Xn(s,:);
end

