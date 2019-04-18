% save retreat to individual files

% Should be saved as a matlab variable retreat = zeros(7,87);
%with relative ice front positions every year (0:1:86) for 7 regions [NO, NE, CE, SE, SW, CW, NW] 

clear

% load
hist = load('hindcast_retreat.mat');

% sort by regions
reorder = [7,5,3,1,2,4,6];
IDs = {hist.retreat.regions(reorder).name}
% time in file
hist_time = 1958:2017;
% selected for output 1959-2014
hist_range = 2:57; 
time = hist_time(hist_range);
hist_time = time;
%%%%%%%%%%%%%%% Historical

% hist control
hist_retreat =  hist.retreat.med(hist_range,reorder)';
hist_retreat = hist_retreat*0.;
! mkdir -p ../hist-Rzero
save(['../hist-Rzero/retreat.mat'],'hist_retreat','IDs','time');

% hist
hist_retreat =  hist.retreat.med(hist_range,reorder)';
hist_retreat = hist_retreat-hist_retreat(:,1);
! mkdir -p ../hist-Rmed
save(['../hist-Rmed/retreat.mat'],'hist_retreat','IDs','time');

hist_retreat =  hist.retreat.high(hist_range,reorder)';
hist_retreat = hist_retreat-hist_retreat(:,1);
! mkdir -p ../hist-Rhigh
save(['../hist-Rhigh/retreat.mat'],'hist_retreat','IDs','time');

%%% Use low retreat for continuation
hist_retreat =  hist.retreat.low(hist_range,reorder)';
hist_retreat = hist_retreat-hist_retreat(:,1);
! mkdir -p ../hist-Rlow
save(['../hist-Rlow/retreat.mat'],'hist_retreat','IDs','time');



%%%%%%%%%%%%%%% Projection
%proj = load('projected_retreat.mat');
proj = load('April10/projected_retreat.mat');

proj_time = 1950:2100;
proj_range = 65:151; 
time = proj_time(proj_range);
proj_time = time;

%%%%%%%%%% ZERO
%proj_retreat =  proj.retreat.MIROC5.RCP85.med(reorder,proj_range)*0.;
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../ZERO
%save(['../ZERO/retreat.mat'],'retreat','IDs','time');
%
%%%%%%%%% MIROC
%%% rcp85
%proj_retreat = proj.retreat.MIROC5.RCP85.med(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../MIROC5-rcp85-Rmed
%save(['../MIROC5-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');
%%
%proj_retreat = proj.retreat.MIROC5.RCP85.high(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../MIROC5-rcp85-Rhigh
%save(['../MIROC5-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');
%%
%proj_retreat = proj.retreat.MIROC5.RCP85.low(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../MIROC5-rcp85-Rlow
%save(['../MIROC5-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');
%%
%%
%%% rcp26
%proj_retreat = proj.retreat.MIROC5.RCP26.med(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../MIROC5-rcp26-Rmed
%save(['../MIROC5-rcp26-Rmed/retreat.mat'],'retreat','IDs','time');
%%
%proj_retreat = proj.retreat.MIROC5.RCP26.high(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../MIROC5-rcp26-Rhigh
%save(['../MIROC5-rcp26-Rhigh/retreat.mat'],'retreat','IDs','time');
%%
%proj_retreat = proj.retreat.MIROC5.RCP26.low(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../MIROC5-rcp26-Rlow
%save(['../MIROC5-rcp26-Rlow/retreat.mat'],'retreat','IDs','time');
%%
%%%%%%%%%% NorESM
%%% rcp85
%proj_retreat = proj.retreat.NorESM.RCP85.med(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../NorESM1-rcp85-Rmed
%save(['../NorESM1-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');
%%
%proj_retreat = proj.retreat.NorESM.RCP85.high(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../NorESM1-rcp85-Rhigh
%save(['../NorESM1-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');
%%
%proj_retreat = proj.retreat.NorESM.RCP85.low(reorder,proj_range);
%retreat = proj_retreat+hist_retreat(:,end);
%! mkdir -p ../NorESM1-rcp85-Rlow
%save(['../NorESM1-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');

%%%%%%%% HadGEM2-ES
% rcp85
proj_retreat =  proj.retreat.HadGEM.RCP85.med(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir -p ../HadGEM2-ES-rcp85-Rmed
save(['../HadGEM2-ES-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');

proj_retreat =  proj.retreat.HadGEM.RCP85.high(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir ../HadGEM2-ES-rcp85-Rhigh
save(['../HadGEM2-ES-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');

proj_retreat =  proj.retreat.HadGEM.RCP85.low(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir ../HadGEM2-ES-rcp85-Rlow
save(['../HadGEM2-ES-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');

%%%%%%%% CSIRO-Mk3.6
% rcp85
proj_retreat =  proj.retreat.CSIRO.RCP85.med(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir -p ../CSIRO-Mk3.6-rcp85-Rmed
save(['../CSIRO-Mk3.6-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');

proj_retreat =  proj.retreat.CSIRO.RCP85.high(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir ../CSIRO-Mk3.6-rcp85-Rhigh
save(['../CSIRO-Mk3.6-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');

proj_retreat =  proj.retreat.CSIRO.RCP85.low(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir ../CSIRO-Mk3.6-rcp85-Rlow
save(['../CSIRO-Mk3.6-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');

%%%%%%%% IPSL-CM5-MR
% rcp85
proj_retreat =  proj.retreat.IPSLCM.RCP85.med(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir -p ../IPSL-CM5-MR-rcp85-Rmed
save(['../IPSL-CM5-MR-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');

proj_retreat =  proj.retreat.IPSLCM.RCP85.high(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir ../IPSL-CM5-MR-rcp85-Rhigh
save(['../IPSL-CM5-MR-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');

proj_retreat =  proj.retreat.IPSLCM.RCP85.low(reorder,proj_range);
retreat = proj_retreat+hist_retreat(:,end);
! mkdir ../IPSL-CM5-MR-rcp85-Rlow
save(['../IPSL-CM5-MR-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');

figure
hold on; box on
plot(hist_time,hist_retreat')
plot(proj_time,retreat')
