% Sanity check provided mask information

clear

%amodel='ISSMUCIJPL';
amodel='AWI_ISSM';

% load obs ice mask
obs = ncload(['../Data/BedMachine/BedMachineGreenlandMasks0d6km.nc']);

% load model ice mask
ima = ncload(['../Models/' amodel '/sftgif_0d6.nc']);
dist = ncload(['../Models/' amodel '/dist0d6km_M.nc']);


% plot overlap
shade(double(obs.imask))
set(gca,'XTicklabel', [],'YTicklabel', [])
title('obs')
%print('-dpng', '-r300', ['mask_obs']);

shade(double(ima.sftgif))
set(gca,'XTicklabel', [],'YTicklabel', [])
title(amodel)
print('-dpng', '-r300', ['mask_' amodel]);

shade(double(ima.sftgif)*2-double(obs.imask))
set(gca,'XTicklabel', [],'YTicklabel', [])
cb = colorbar;
set(cb,'XTick',[-1 0 1 2])
set(cb,'XTicklabel',{'less ice','no ice','ice','more ice'})
print('-dpng', '-r300', ['mask_diff_' amodel]);


