% Sanity check provided mask information

clear

%% 600 m grid
%nx = 2555 ;
%ny = 4587 ;
%nt = 87;

%amodel='ELMER';
%amodel='ISSMUCIJPL';
%amodel='AWI_ISSM';

% 5 km grid (SICOPOLIS)
nx = 337 ;
ny = 577 ;
nt = 87;


amodel='SICOPOLIS1';

% load obs ice mask
obs = ncload(['../Data/BedMachine/BedMachineGreenlandMasks0d6km.nc']);

% load model ice mask
%mask = ncread(['../Models/' amodel '/retreatmasks_MIROC5-rcp85-Rmed_' amodel '.nc'], 'sftgif');
mask1 = ncread(['../Models/' amodel '/retreatmasks_MIROC5-rcp85-Rmed_' amodel '.nc'], 'sftgif', [1,1,1],[nx,ny,1]);
maskend = ncread(['../Models/' amodel '/retreatmasks_MIROC5-rcp85-Rmed_' amodel '.nc'], 'sftgif', [1,1,nt],[nx,ny,1]);

% plot overlap
shade(double(mask1-maskend))
set(gca,'XTicklabel', [],'YTicklabel', [])
title(['retreat' ' ' amodel])
print('-dpng', '-r300', ['retreatmask_' amodel]);
