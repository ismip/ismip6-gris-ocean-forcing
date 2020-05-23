function [outmask] = marginid(inmask);
% find all points that are connected to the margin 
    seed = zeros(size(inmask));
    seed(:,[1,end]) = 1;
    seed([1,end],:) = 1;

    outmask = isfinite(bwdistgeodesic(inmask>0,seed>0,'chessboard'));
