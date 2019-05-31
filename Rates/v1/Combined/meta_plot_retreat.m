% plot retreat for all scenarios
scens = {
    'ACCESS1.3-rcp85-Rhigh',
    'ACCESS1.3-rcp85-Rlow',
    'ACCESS1.3-rcp85-Rmed',
    'CNRM-CM6-ssp126-Rhigh',
    'CNRM-CM6-ssp126-Rlow',
    'CNRM-CM6-ssp126-Rmed',
    'CNRM-CM6-ssp585-Rhigh',
    'CNRM-CM6-ssp585-Rlow',
    'CNRM-CM6-ssp585-Rmed',
    'CSIRO-Mk3.6-rcp85-Rhigh',
    'CSIRO-Mk3.6-rcp85-Rlow',
    'CSIRO-Mk3.6-rcp85-Rmed',
    'HadGEM2-ES-rcp85-Rhigh',
    'HadGEM2-ES-rcp85-Rlow',
    'HadGEM2-ES-rcp85-Rmed',
    'IPSL-CM5-MR-rcp85-Rhigh',
    'IPSL-CM5-MR-rcp85-Rlow',
    'IPSL-CM5-MR-rcp85-Rmed',
    'MIROC5-rcp26-Rhigh',
    'MIROC5-rcp26-Rlow',
    'MIROC5-rcp26-Rmed',
    'MIROC5-rcp85-Rhigh',
    'MIROC5-rcp85-Rlow',
    'MIROC5-rcp85-Rmed',
    'NorESM1-rcp85-Rhigh',
    'NorESM1-rcp85-Rlow',
    'NorESM1-rcp85-Rmed',
    'ZERO'};

for i = 1:length(scens)
    plot_retreat_func(scens{i})
    close
end
