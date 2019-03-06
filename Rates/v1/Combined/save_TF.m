% save thermal forcing to individual files

clear

% load
in = load('projected_retreat.mat');

% sort by regions
reorder = [7,5,3,1,2,4,6];
IDs = {in.retreat.regions(reorder).name}
time = 1950:2100;

%%%%%%%% MIROC

% rcp85
TF =  in.retreat.MIROC5.RCP85.TF(reorder,:);
save(['../TF_MIROC5-rcp85.mat'],'TF','IDs');
dlmwrite(['../TF_MIROC5-rcp85.dat'],TF','delimiter','\t', 'precision',6);
% rcp26
TF =  in.retreat.MIROC5.RCP26.TF(reorder,:);
save(['../TF_MIROC5-rcp26.mat'],'TF','IDs');
dlmwrite(['../TF_MIROC5-rcp26.dat'],TF','delimiter','\t', 'precision',6);

%%%%%%%% NorESM

% rcp85
TF =  in.retreat.NorESM.RCP85.TF(reorder,:);
save(['../TF_NorESM1-rcp85.mat'],'TF','IDs');
dlmwrite(['../TF_NorESM1-rcp85.dat'],TF','delimiter','\t', 'precision',6);
