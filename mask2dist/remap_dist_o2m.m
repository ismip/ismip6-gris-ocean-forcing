% Matlab interpolation and weight creation 0d6 -> 1km
clear
d1 = ncload('dist0d6km_M.nc');
g1 = ncload('sftgif_01000m.nc');

mask = d1.dist < 9999;
dist_masked = d1.dist./mask;
dist_masked(~isfinite(dist_masked))=NaN;

[y,x] = meshgrid(double(d1.y),double(d1.x));
[yB, xB] = meshgrid(g1.y, g1.x);

% remap dist with binning
dist_bin = binToMatrix(y,x,dist_masked,yB,xB);

% remap weights with binning
weight = binToMatrix(y,x,mask,yB,xB);
weight(~isfinite(weight))=0.;

% save
ncwrite2d_n('dist_0d6_ISMIP6_GrIS_01km.nc', dist_bin,'dist_bin')
ncwrite2d_n('weight_0d6_ISMIP6_GrIS_01km.nc', weight,'weight')

