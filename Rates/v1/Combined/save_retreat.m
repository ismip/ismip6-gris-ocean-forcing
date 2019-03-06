% save retreat to individual files

% Should be saved as a matlab variable retreat = zeros(7,87);
%with relative ice front positions every year (0:1:86) for 7 regions [NO, NE, CE, SE, SW, CW, NW] 

clear

% load
in = load('projected_retreat.mat');

% sort by regions
reorder = [7,5,3,1,2,4,6];
IDs = {in.retreat.regions(reorder).name}
time = 1950:2100;

%%%%%%%% MIROC

% rcp85
retreat =  in.retreat.MIROC5.RCP85.med(reorder,65:151);
save(['../MIROC5-rcp85-Rmed/retreat.mat'],'retreat','IDs');

retreat =  in.retreat.MIROC5.RCP85.high(reorder,65:151);
save(['../MIROC5-rcp85-Rhigh/retreat.mat'],'retreat','IDs');

retreat =  in.retreat.MIROC5.RCP85.low(reorder,65:151);
save(['../MIROC5-rcp85-Rlow/retreat.mat'],'retreat','IDs');


% rcp26
retreat =  in.retreat.MIROC5.RCP26.med(reorder,65:151);
save(['../MIROC5-rcp26-Rmed/retreat.mat'],'retreat','IDs');

retreat =  in.retreat.MIROC5.RCP26.high(reorder,65:151);
save(['../MIROC5-rcp26-Rhigh/retreat.mat'],'retreat','IDs');

retreat =  in.retreat.MIROC5.RCP26.low(reorder,65:151);
save(['../MIROC5-rcp26-Rlow/retreat.mat'],'retreat','IDs');

%%%%%%%% NorESM

% rcp85
retreat =  in.retreat.NorESM.RCP85.med(reorder,65:151);
save(['../NorESM1-rcp85-Rmed/retreat.mat'],'retreat','IDs');

retreat =  in.retreat.NorESM.RCP85.high(reorder,65:151);
save(['../NorESM1-rcp85-Rhigh/retreat.mat'],'retreat','IDs');

retreat =  in.retreat.NorESM.RCP85.low(reorder,65:151);
save(['../NorESM1-rcp85-Rlow/retreat.mat'],'retreat','IDs');

