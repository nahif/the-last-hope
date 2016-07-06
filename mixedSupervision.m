function [X_train, X_test, d_train, d_test] = mixedSupervision( X, d)
%MIXEDSUPERVISION Summary of this function goes here
%   Detailed explanation goes here
    [X_train, d_train, X_test ,d_test] = Bds_stratify(X,d,1/5);
end

