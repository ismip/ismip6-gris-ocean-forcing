# prepare mask file from ice sheet model

outfile=sftgif_01000m.nc

# extract inital ice mask
ncks -O -v grimask nn_BedMachineGreenland_01000m.nc ${outfile}
ncrename -v grimask,sftgif ${outfile}

# remove latlon
ncks -O -C -x -v lat,lon,lat_bnds,lon_bnds ${outfile} ${outfile}

