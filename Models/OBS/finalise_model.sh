# Finalise retreatmask file for ice sheet model
# Conservative interpolation

# interpolate back to model grid 01km -> 08km 
pgdfs=/Volumes/ISMIP6/Grids/GrIS/GDFs
pwgts=/Volumes/ISMIP6/Grids/GrIS/weights
pfts=/Volumes/ISMIP6/Grids/GrIS/SFs

# input/output grid description files
ingdf=grid_ISMIP6_GrIS_01000m.nc
outgdf=grid_ISMIP6_GrIS_08000m.nc
wgts=weights_ycon_e01000m_e08000m.nc

# files
infile=retreatmasks_test00_OBS_01000m.nc
outfile=retreatmasks_test00_OBS_08000m.nc

### With weights file
# produce remap weights file
#cdo genycon,${pgdfs}/${outgdf} -setgrid,${pgdfs}/${ingdf} ${infile} ${pwgts}/${wgts}
# remap with predefined weights
cdo remap,${pgdfs}/${outgdf},${pwgts}/${wgts} -setgrid,${pgdfs}/${ingdf} ${infile} ${outfile}

# remove latlon
ncks -O -C -x -v lat,lon,lat_bnds,lon_bnds ${outfile} ${outfile}
