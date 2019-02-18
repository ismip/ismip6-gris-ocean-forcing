% compute distances
clear
b=ncload('../Data/BedMachine/BedMachineGreenlandMasks0d6km.nc');

% scale in km
sc = 0.6;

% locations that can be traversed: ice below sea-level
mask = b.wgrimask>0;

% grow out 1 point into ocean to get overlap
mskout = int8(b.wgrimask);
mskout(2:end-1,2:end-1) = mskout(2:end-1,2:end-1) + mskout(3:end,2:end-1) + mskout(1:end-2,2:end-1) + mskout(2:end-1,3:end) + mskout(2:end-1,1:end-2);
% remask to ice+ocean
mask = int8(mskout>0).*int8((int8(b.wmask)+int8(b.wgrimask))>0);

% seed locations: ocean points
dist = bwdistgeodesic(mask>0,b.wmask>0,'quasi-euclidean')*sc;

% mask out NaN
dist(isnan(dist)) = 9999;
% mask out inf
dist(isinf(dist)) = 99999;

ncwrite2d_n('../Data/dist/dist0d6km.nc',double(dist),'dist')

% plotting
shade(dist)
axis equal
%colororder = distinguishable_colors(150);
%set(0,'DefaultAxesColorOrder', colororder)
% colormap lines(50)
load('cmap_banded.mat');
colormap(cmap)
hold on
contour(b.wmask',[0.5,0.5],'k')
set(gcf,'Position', [142 74 609 1031]);

caxis([0,1000])
print -dpng -r300 bwdist_0d6km_1000km

caxis([0,100])
print -dpng -r300 bwdist_0d6km_100km
