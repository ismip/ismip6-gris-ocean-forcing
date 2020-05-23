% plot retreat for one scenario
function plot_retreat_func(scen)

%scen = 'CNRM-CM6-ssp585-Rmed';

load(['../' scen '/retreat.mat']);
figure
plot(time,retreat')
axis([2010 2100 -45 5])
legend(IDs,'Location','sw')
title(scen)
print('-dpng','-r100',['retreat_' scen '.png'])
