% Remap dist and weights back to model grid 

addpath('../../toolbox')

clear
d1 = ncload('../../mask2dist/dist_0d6_ISMIP6_GrIS_01km.nc');
g1 = ncload('/Volumes/ISMIP6/Grids/GrIS/SFs/af2_ISMIP6_GrIS_08000m.nc');
[y,x] = meshgrid(double(d1.y),double(d1.x));
[yB, xB] = meshgrid(g1.y, g1.x);

% remap with binning
dist_bin = binToMatrix(y,x,d1.dist_bin,yB,xB);

ncwrite2d_n('dist_0d6_ISMIP6_GrIS_08km.nc', dist_bin,'dist_bin')
