% Matlab interpolation from model to obs grid
clear

% flag for plotting 
flg_plot=0;

d1 = ncload('sftgif.nc');
g1 = ncload('../Data/dist/dist0d6km.nc');

[yd,xd] = meshgrid(double(d1.y),double(d1.x));
[yg,xg] = meshgrid(double(g1.y),double(g1.x));

mask = double(d1.sftgif > 0);
grmask = interp2(yd,xd,mask,yg,xg,'nearest',0);

% save
ncwrite2d_n('grmask_M_0d6km.nc', grmask,'grmask')

if (flg_plot)
    shade(d1.sftgif)
    print -dpng -r300 mask_M_org
    shade(grmask)
    print -dpng -r300 mask_M_0d6km
end
