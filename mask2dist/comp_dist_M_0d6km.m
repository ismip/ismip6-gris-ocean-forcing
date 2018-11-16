% Compute distances from calving front
clear
b=ncload('../Data/BedMachine/BedMachineGreenland0d6km.nc');
m=ncload('grmask_M_0d6km.nc');
% scale in km
sc = 0.6;

% Combine modelled mask with observational ocean

% locations that can be traversed: ice below sea-level
mask = (m.grmask).*(b.wbmask);

% new ocean mask
wmask = int8(b.wbmask + mask == 1);

% grow out 1 point into ocean to get overlap
mskout = int8(mask);
mskout(2:end-1,2:end-1) = mskout(2:end-1,2:end-1) + mskout(3:end,2:end-1) + mskout(1:end-2,2:end-1) + mskout(2:end-1,3:end) + mskout(2:end-1,1:end-2);
% remask to ice+ocean
mask = int8(mskout>0).*int8((int8(wmask)+int8(mask))>0);

% seed locations: ocean points
dist = bwdistgeodesic(mask>0,wmask>0,'quasi-euclidean')*sc;

% mask out NaN
dist(isnan(dist)) = 9999;
% mask out inf
dist(isinf(dist)) = 99999;

ncwrite2d_n('dist0d6km_M.nc',double(dist),'dist')

% append coordinates to model dist file
! ncks -A -v x,y ../Data/BedMachine/BM_0d6km_xy.nc dist0d6km_M.nc

% plotting
shade(dist)
axis equal
%colororder = distinguishable_colors(150);
%set(0,'DefaultAxesColorOrder', colororder)
% colormap lines(50)
load('cmap_banded.mat');
colormap(cmap)
hold on
contour(wmask',[0.5,0.5],'k')
set(gcf,'Position', [142 74 609 1031]);

caxis([0,100])
print -dpng -r300 bwdist_M_0d6km_100km

%caxis([0,900])
%print -dpng -r300 bwdist_M_0d6km_900km

