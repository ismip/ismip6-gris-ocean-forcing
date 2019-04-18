% save retreat to individual files

% Should be saved as a matlab variable retreat = zeros(7,87);
%with relative ice front positions every year (0:1:86) for 7 regions [NO, NE, CE, SE, SW, CW, NW] 

%clear

% load
%in = load('projected_retreat.mat');
in = load('April10/projected_retreat.mat');

% sort by regions
reorder = [7,5,3,1,2,4,6];
IDs = {in.retreat.regions(reorder).name}
time = 1950:2100;
time = time(65:151);


%%%%%%%% MIROC

%% rcp85
%retreat =  in.retreat.MIROC5.RCP85.med(reorder,65:151);
%save(['../MIROC5-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.MIROC5.RCP85.high(reorder,65:151);
%save(['../MIROC5-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.MIROC5.RCP85.low(reorder,65:151);
%save(['../MIROC5-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');
%
%
%% rcp26
%retreat =  in.retreat.MIROC5.RCP26.med(reorder,65:151);
%save(['../MIROC5-rcp26-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.MIROC5.RCP26.high(reorder,65:151);
%save(['../MIROC5-rcp26-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.MIROC5.RCP26.low(reorder,65:151);
%save(['../MIROC5-rcp26-Rlow/retreat.mat'],'retreat','IDs','time');
%
%%%%%%%%% NorESM
%
%% rcp85
%retreat =  in.retreat.NorESM.RCP85.med(reorder,65:151);
%save(['../NorESM1-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.NorESM.RCP85.high(reorder,65:151);
%save(['../NorESM1-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.NorESM.RCP85.low(reorder,65:151);
%save(['../NorESM1-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');
%

%%%%%%%% HadGEM2-ES

% rcp85
retreat =  in.retreat.HadGEM.RCP85.med(reorder,65:151);
! mkdir ../HadGEM2-ES-rcp85-Rmed
save(['../HadGEM2-ES-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.HadGEM.RCP85.high(reorder,65:151);
! mkdir ../HadGEM2-ES-rcp85-Rhigh
save(['../HadGEM2-ES-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.HadGEM.RCP85.low(reorder,65:151);
! mkdir ../HadGEM2-ES-rcp85-Rlow
save(['../HadGEM2-ES-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');


%%%%%%%% CSIRO-Mk3.6

% rcp85
retreat =  in.retreat.CSIRO.RCP85.med(reorder,65:151);
! mkdir ../CSIRO-Mk3.6-rcp85-Rmed
save(['../CSIRO-Mk3.6-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CSIRO.RCP85.high(reorder,65:151);
! mkdir ../CSIRO-Mk3.6-rcp85-Rhigh
save(['../CSIRO-Mk3.6-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CSIRO.RCP85.low(reorder,65:151);
! mkdir ../CSIRO-Mk3.6-rcp85-Rlow
save(['../CSIRO-Mk3.6-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');


%%%%%%%% IPSL-CM5-MR

% rcp85
retreat =  in.retreat.IPSLCM.RCP85.med(reorder,65:151);
! mkdir ../IPSL-CM5-MR-rcp85-Rmed
save(['../IPSL-CM5-MR-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.IPSLCM.RCP85.high(reorder,65:151);
! mkdir ../IPSL-CM5-MR-rcp85-Rhigh
save(['../IPSL-CM5-MR-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.IPSLCM.RCP85.low(reorder,65:151);
! mkdir ../IPSL-CM5-MR-rcp85-Rlow
save(['../IPSL-CM5-MR-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');


%%%%%%%%% ZERO

%retreat =  in.retreat.MIROC5.RCP85.med(reorder,65:151)*0.;
%save(['../ZERO/retreat.mat'],'retreat','IDs','time');

