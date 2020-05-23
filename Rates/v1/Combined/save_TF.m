% save thermal forcing to individual files

clear

% load
%in = load('May16/projected_retreat.mat');
%in = load('Aug20/projected_retreat.mat');
in = load('Oct16/projected_retreat.mat');

% sort by regions
reorder = [7,5,3,1,2,4,6];
IDs = {in.retreat.regions(reorder).name}
time = 1950:2100;

%%%%%%%%% MIROC
%% rcp85
%TF =  in.retreat.MIROC5.RCP85.TF(reorder,:);
%save(['../TF_MIROC5-rcp85.mat'],'TF','IDs','time');
%dlmwrite(['../TF_MIROC5-rcp85.dat'],[time;TF]','delimiter','\t', 'precision',6);
%% rcp26
%TF =  in.retreat.MIROC5.RCP26.TF(reorder,:);
%save(['../TF_MIROC5-rcp26.mat'],'TF','IDs','time');
%dlmwrite(['../TF_MIROC5-rcp26.dat'],[time;TF]','delimiter','\t', 'precision',6);
%
%%%%%%%%% NorESM
%% rcp85
%TF =  in.retreat.NorESM.RCP85.TF(reorder,:);
%save(['../TF_NorESM1-rcp85.mat'],'TF','IDs','time');
%dlmwrite(['../TF_NorESM1-rcp85.dat'],[time;TF]','delimiter','\t', 'precision',6);
%
%%%%%%%%% HadGEM
%% rcp85
%TF =  in.retreat.HadGEM.RCP85.TF(reorder,:);
%save(['../TF_HadGEM2-ES-rcp85.mat'],'TF','IDs','time');
%dlmwrite(['../TF_HadGEM2-ES-rcp85.dat'],[time;TF]','delimiter','\t', 'precision',6);
%
%%%%%%%%% CSIRO
%% rcp85
%TF =  in.retreat.CSIRO.RCP85.TF(reorder,:);
%save(['../TF_CSIRO-Mk3.6-rcp85.mat'],'TF','IDs','time');
%dlmwrite(['../TF_CSIRO-Mk3.6-rcp85.dat'],[time;TF]','delimiter','\t', 'precision',6);
%
%%%%%%%%% IPSL
%% rcp85
%TF =  in.retreat.IPSLCM.RCP85.TF(reorder,:);
%save(['../TF_IPSL-CM5-MR-rcp85.mat'],'TF','IDs','time');
%dlmwrite(['../TF_IPSL-CM5-MR-rcp85.dat'],[time;TF]','delimiter','\t', 'precision',6);
%
%%%%%%%%% ACCESS
%% rcp85
%TF =  in.retreat.ACCESS.RCP85.TF(reorder,:);
%save(['../TF_ACCESS1.3-rcp85.mat'],'TF','IDs','time');
%dlmwrite(['../TF_ACCESS1.3-rcp85.dat'],[time;TF]','delimiter','\t', 'precision',6);
%
%%%%%%%%% CNRMCM6
%% ssp585
%TF =  in.retreat.CNRMCM6.ssp585.TF(reorder,:);
%save(['../TF_CNRM-CM6-ssp585.mat'],'TF','IDs','time');
%dlmwrite(['../TF_CNRM-CM6-ssp585.dat'],[time;TF]','delimiter','\t', 'precision',6);
%% ssp126
%TF =  in.retreat.CNRMCM6.ssp126.TF(reorder,:);
%save(['../TF_CNRM-CM6-ssp126.mat'],'TF','IDs','time');
%dlmwrite(['../TF_CNRM-CM6-ssp126.dat'],[time;TF]','delimiter','\t', 'precision',6);

%%%%%%%%%% CNRMESM2
%% ssp585
%TF =  in.retreat.CNRMESM2.ssp585.TF(reorder,:);
%save(['../TF_CNRM-ESM2-ssp585.mat'],'TF','IDs','time');
%dlmwrite(['../TF_CNRM-ESM2-ssp585.dat'],[time;TF]','delimiter','\t', 'precision',6);
%
%%%%%%%%%% UKESM1
%% ssp585
%TF =  in.retreat.UKESM1.ssp585.TF(reorder,:);
%save(['../TF_UKESM1-CM6-ssp585.mat'],'TF','IDs','time');
%dlmwrite(['../TF_UKESM1-CM6-ssp585.dat'],[time;TF]','delimiter','\t', 'precision',6);
%%%%%%%%% CESM2
% ssp585
TF =  in.retreat.CESM2.ssp585.TF(reorder,:);
save(['../TF_CESM2-ssp585.mat'],'TF','IDs','time');
dlmwrite(['../TF_CESM2-ssp585.dat'],[time;TF]','delimiter','\t', 'precision',6);
