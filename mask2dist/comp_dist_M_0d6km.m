% Compute distances from calving front
clear

% flag for plotting 
flg_plot=0;

b = ncload('../Data/BedMachine/BedMachineGreenlandMasks0d6km.nc');
m = ncload('sftgif_M_0d6km.nc');

% scale in km
sc = 0.6;

addpath('../toolbox')

% Combine modelled mask with observational ocean

% type conversion
icemask = int8(m.sftgif);
wetbedmask = int8(b.wbmask);

% locations that can be traversed: modelled ice with observed bed below sea-level
mask = icemask.*wetbedmask;

% seed locations on connected ocean mask
wmask = (1-icemask).*wetbedmask;
wmask = int8(marginid(wmask));

% grow out 1 point into ocean to get overlap
mskout = mask;
mskout(2:end-1,2:end-1) = mskout(2:end-1,2:end-1) + mskout(3:end,2:end-1) + mskout(1:end-2,2:end-1) + mskout(2:end-1,3:end) + mskout(2:end-1,1:end-2);
% remask to ice+ocean
rmask = int8(mskout>0).*int8((wmask+mask)>0);

% seed locations: ocean points (wmask>0)
% travel locations: ice with bed below sea-level (rmask>0)
dist = bwdistgeodesic(rmask>0,wmask>0,'quasi-euclidean')*sc;

% mask out NaN
dist(isnan(dist)) = 9999;
% mask out inf
dist(isinf(dist)) = 99999;

ncwrite2d_n('dist0d6km_M.nc',double(dist),'dist')

% append coordinates to model dist file
! ncks -A -v x,y ../Data/BedMachine/BM_0d6km_xy.nc dist0d6km_M.nc

if (flg_plot)
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
end

