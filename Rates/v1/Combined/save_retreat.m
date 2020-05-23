% save retreat to individual files

% Should be saved as a matlab variable retreat = zeros(7,87);
%with relative ice front positions every year (0:1:86) for 7 regions [NO, NE, CE, SE, SW, CW, NW] 

%clear

% load
%in = load('projected_retreat.mat');
%in = load('April10/projected_retreat.mat');
%in = load('May15/projected_retreat.mat');
%in = load('May16/projected_retreat.mat');
%in = load('Aug20/projected_retreat.mat');
%in = load('Oct16/projected_retreat.mat');

% new kappas
in = load('Apr17_2020/projected_retreat.mat');

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

retreat =  in.retreat.MIROC5.RCP85.p5(reorder,65:151);
! mkdir ../MIROC5-rcp85-Rp5
save(['../MIROC5-rcp85-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.MIROC5.RCP85.p95(reorder,65:151);
! mkdir ../MIROC5-rcp85-Rp95
save(['../MIROC5-rcp85-Rp95/retreat.mat'],'retreat','IDs','time');

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

retreat =  in.retreat.MIROC5.RCP26.p5(reorder,65:151);
! mkdir ../MIROC5-rcp26-Rp5
save(['../MIROC5-rcp26-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.MIROC5.RCP26.p95(reorder,65:151);
! mkdir ../MIROC5-rcp26-Rp95
save(['../MIROC5-rcp26-Rp95/retreat.mat'],'retreat','IDs','time');
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

retreat =  in.retreat.NorESM.RCP85.p5(reorder,65:151);
! mkdir ../NorESM1-rcp85-Rp5
save(['../NorESM1-rcp85-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.NorESM.RCP85.p95(reorder,65:151);
! mkdir ../NorESM1-rcp85-Rp95
save(['../NorESM1-rcp85-Rp95/retreat.mat'],'retreat','IDs','time');
%

%%%%%%%%% HadGEM2-ES
%
%% rcp85
%retreat =  in.retreat.HadGEM.RCP85.med(reorder,65:151);
%! mkdir ../HadGEM2-ES-rcp85-Rmed
%save(['../HadGEM2-ES-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.HadGEM.RCP85.high(reorder,65:151);
%! mkdir ../HadGEM2-ES-rcp85-Rhigh
%save(['../HadGEM2-ES-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.HadGEM.RCP85.low(reorder,65:151);
%! mkdir ../HadGEM2-ES-rcp85-Rlow
%save(['../HadGEM2-ES-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.HadGEM.RCP85.p5(reorder,65:151);
! mkdir ../HadGEM2-ES-rcp85-Rp5
save(['../HadGEM2-ES-rcp85-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.HadGEM.RCP85.p95(reorder,65:151);
! mkdir ../HadGEM2-ES-rcp85-Rp95
save(['../HadGEM2-ES-rcp85-Rp95/retreat.mat'],'retreat','IDs','time');

%
%%%%%%%%% CSIRO-Mk3.6
%
%% rcp85
%retreat =  in.retreat.CSIRO.RCP85.med(reorder,65:151);
%! mkdir ../CSIRO-Mk3.6-rcp85-Rmed
%save(['../CSIRO-Mk3.6-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CSIRO.RCP85.high(reorder,65:151);
%! mkdir ../CSIRO-Mk3.6-rcp85-Rhigh
%save(['../CSIRO-Mk3.6-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CSIRO.RCP85.low(reorder,65:151);
%! mkdir ../CSIRO-Mk3.6-rcp85-Rlow
%save(['../CSIRO-Mk3.6-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CSIRO.RCP85.p5(reorder,65:151);
! mkdir ../CSIRO-Mk3.6-rcp85-Rp5
save(['../CSIRO-Mk3.6-rcp85-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CSIRO.RCP85.p95(reorder,65:151);
! mkdir ../CSIRO-Mk3.6-rcp85-Rp95
save(['../CSIRO-Mk3.6-rcp85-Rp95/retreat.mat'],'retreat','IDs','time');

%
%%%%%%%%% IPSL-CM5-MR
%
%% rcp85
%retreat =  in.retreat.IPSLCM.RCP85.med(reorder,65:151);
%! mkdir ../IPSL-CM5-MR-rcp85-Rmed
%save(['../IPSL-CM5-MR-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.IPSLCM.RCP85.high(reorder,65:151);
%! mkdir ../IPSL-CM5-MR-rcp85-Rhigh
%save(['../IPSL-CM5-MR-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.IPSLCM.RCP85.low(reorder,65:151);
%! mkdir ../IPSL-CM5-MR-rcp85-Rlow
%save(['../IPSL-CM5-MR-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.IPSLCM.RCP85.p5(reorder,65:151);
! mkdir ../IPSL-CM5-MR-rcp85-Rp5
save(['../IPSL-CM5-MR-rcp85-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.IPSLCM.RCP85.p95(reorder,65:151);
! mkdir ../IPSL-CM5-MR-rcp85-Rp95
save(['../IPSL-CM5-MR-rcp85-Rp95/retreat.mat'],'retreat','IDs','time');

%%%%%%%%% ACCESS1-3
%
%% rcp85
%retreat =  in.retreat.ACCESS.RCP85.med(reorder,65:151);
%! mkdir ../ACCESS1.3-rcp85-Rmed
%save(['../ACCESS1.3-rcp85-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.ACCESS.RCP85.high(reorder,65:151);
%! mkdir ../ACCESS1.3-rcp85-Rhigh
%save(['../ACCESS1.3-rcp85-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.ACCESS.RCP85.low(reorder,65:151);
%! mkdir ../ACCESS1.3-rcp85-Rlow
%save(['../ACCESS1.3-rcp85-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.ACCESS.RCP85.p5(reorder,65:151);
! mkdir ../ACCESS1.3-rcp85-Rp5
save(['../ACCESS1.3-rcp85-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.ACCESS.RCP85.p95(reorder,65:151);
! mkdir ../ACCESS1.3-rcp85-Rp95
save(['../ACCESS1.3-rcp85-Rp95/retreat.mat'],'retreat','IDs','time');

%
%%%%%%%%% CNRM-CM6
%
%% ssp585
%retreat =  in.retreat.CNRMCM6.ssp585.med(reorder,65:151);
%! mkdir ../CNRM-CM6-ssp585-Rmed
%save(['../CNRM-CM6-ssp585-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CNRMCM6.ssp585.high(reorder,65:151);
%! mkdir ../CNRM-CM6-ssp585-Rhigh
%save(['../CNRM-CM6-ssp585-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CNRMCM6.ssp585.low(reorder,65:151);
%! mkdir ../CNRM-CM6-ssp585-Rlow
%save(['../CNRM-CM6-ssp585-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CNRMCM6.ssp585.p5(reorder,65:151);
! mkdir ../CNRM-CM6-ssp585-Rp5
save(['../CNRM-CM6-ssp585-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CNRMCM6.ssp585.p95(reorder,65:151);
! mkdir ../CNRM-CM6-ssp585-Rp95
save(['../CNRM-CM6-ssp585-Rp95/retreat.mat'],'retreat','IDs','time');
%
%% ssp126
%retreat =  in.retreat.CNRMCM6.ssp126.med(reorder,65:151);
%! mkdir ../CNRM-CM6-ssp126-Rmed
%save(['../CNRM-CM6-ssp126-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CNRMCM6.ssp126.high(reorder,65:151);
%! mkdir ../CNRM-CM6-ssp126-Rhigh
%save(['../CNRM-CM6-ssp126-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CNRMCM6.ssp126.low(reorder,65:151);
%! mkdir ../CNRM-CM6-ssp126-Rlow
%save(['../CNRM-CM6-ssp126-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CNRMCM6.ssp126.p5(reorder,65:151);
! mkdir ../CNRM-CM6-ssp126-Rp5
save(['../CNRM-CM6-ssp126-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CNRMCM6.ssp126.p95(reorder,65:151);
! mkdir ../CNRM-CM6-ssp126-Rp95
save(['../CNRM-CM6-ssp126-Rp95/retreat.mat'],'retreat','IDs','time');


%%%%%%%%%% CNRMESM2
%
%% ssp585
%retreat =  in.retreat.CNRMESM2.ssp585.med(reorder,65:151);
%! mkdir ../CNRM-ESM2-ssp585-Rmed
%save(['../CNRM-ESM2-ssp585-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CNRMESM2.ssp585.high(reorder,65:151);
%! mkdir ../CNRM-ESM2-ssp585-Rhigh
%save(['../CNRM-ESM2-ssp585-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CNRMESM2.ssp585.low(reorder,65:151);
%! mkdir ../CNRM-ESM2-ssp585-Rlow
%save(['../CNRM-ESM2-ssp585-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CNRMESM2.ssp585.p5(reorder,65:151);
! mkdir ../CNRM-ESM2-ssp585-Rp5
save(['../CNRM-ESM2-ssp585-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CNRMESM2.ssp585.p95(reorder,65:151);
! mkdir ../CNRM-ESM2-ssp585-Rp95
save(['../CNRM-ESM2-ssp585-Rp95/retreat.mat'],'retreat','IDs','time');

%
%%%%%%%%%% UKESM1
%
%% ssp585
%retreat =  in.retreat.UKESM1.ssp585.med(reorder,65:151);
%! mkdir ../UKESM1-CM6-ssp585-Rmed
%save(['../UKESM1-CM6-ssp585-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.UKESM1.ssp585.high(reorder,65:151);
%! mkdir ../UKESM1-CM6-ssp585-Rhigh
%save(['../UKESM1-CM6-ssp585-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.UKESM1.ssp585.low(reorder,65:151);
%! mkdir ../UKESM1-CM6-ssp585-Rlow
%save(['../UKESM1-CM6-ssp585-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.UKESM1.ssp585.p5(reorder,65:151);
! mkdir ../UKESM1-CM6-ssp585-Rp5
save(['../UKESM1-CM6-ssp585-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.UKESM1.ssp585.p95(reorder,65:151);
! mkdir ../UKESM1-CM6-ssp585-Rp95
save(['../UKESM1-CM6-ssp585-Rp95/retreat.mat'],'retreat','IDs','time');


%%%%%%%%% CESM2

%% ssp585
%retreat =  in.retreat.CESM2.ssp585.med(reorder,65:151);
%! mkdir ../CESM2-ssp585-Rmed
%save(['../CESM2-ssp585-Rmed/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CESM2.ssp585.high(reorder,65:151);
%! mkdir ../CESM2-ssp585-Rhigh
%save(['../CESM2-ssp585-Rhigh/retreat.mat'],'retreat','IDs','time');
%
%retreat =  in.retreat.CESM2.ssp585.low(reorder,65:151);
%! mkdir ../CESM2-ssp585-Rlow
%save(['../CESM2-ssp585-Rlow/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CESM2.ssp585.p5(reorder,65:151);
! mkdir ../CESM2-ssp585-Rp5
save(['../CESM2-ssp585-Rp5/retreat.mat'],'retreat','IDs','time');

retreat =  in.retreat.CESM2.ssp585.p95(reorder,65:151);
! mkdir ../CESM2-ssp585-Rp95
save(['../CESM2-ssp585-Rp95/retreat.mat'],'retreat','IDs','time');


%%%%%%%%% ZERO

%retreat =  in.retreat.MIROC5.RCP85.med(reorder,65:151)*0.;
%save(['../ZERO/retreat.mat'],'retreat','IDs','time');

