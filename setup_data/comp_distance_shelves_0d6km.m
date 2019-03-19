% compute distances
clear

% flag for plotting 
flg_plot=0;

addpath('../toolbox')

b=ncload('../Data/BedMachine/BedMachineGreenlandMasks0d6km.nc');

% scale in km
sc = 0.6;

wetbedmask = int8(b.wbmask);
icemask = int8(b.imask);

% locations that can be traversed: modelled ice with observed bed below sea-level
mask = icemask.*wetbedmask;

% seed locations new ocean mask
wmask = (1-icemask).*wetbedmask;

% grow out 1 point into ocean to get overlap
mskout = int8(b.wimask);
mskout(2:end-1,2:end-1) = mskout(2:end-1,2:end-1) + mskout(3:end,2:end-1) + mskout(1:end-2,2:end-1) + mskout(2:end-1,3:end) + mskout(2:end-1,1:end-2);
% remask to ice+ocean
rmask = int8(mskout>0).*int8((wmask+mask)>0);

% seed locations: ocean points
dist = bwdistgeodesic(rmask>0,wmask>0,'quasi-euclidean')*sc;

% mask out NaN
dist(isnan(dist)) = 9999;
% mask out inf
dist(isinf(dist)) = 99999;

ncwrite2d_n('../Data/dist/dist0d6km_shelves.nc',double(dist),'dist')

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
    contour(b.wmask',[0.5,0.5],'k')
    set(gcf,'Position', [142 74 609 1031]);

    caxis([0,1000])
    print -dpng -r300 bwdist_sh_0d6km_1000km

    caxis([0,100])
    print -dpng -r300 bwdist_sh_0d6km_100km
end
