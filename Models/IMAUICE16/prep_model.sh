# prepare mask file from ice sheet model

outfile=sftgif.nc

# extract inital ice mask
ncks -O -d time,-1 -v Hi /Users/hgoelzer/icedyn/svn3/project.anice/branches/imauice/greenland_ISMIP6_16x16km_init/restart_greenland_16x16km.nc ./Hi.nc
ncap2 -O -s "sftgif = Hi>0.1" -v ./Hi.nc ./sftgif.nc 
# replace x,y
ncks -C -O -x -v x,y ./sftgif.nc ./sftgif.nc
ncks -A -v x,y /Volumes/ISMIP6/Grids/GrIS/SFs/af2_ISMIP6_GrIS_16000m.nc ./sftgif.nc
# cleanup
/bin/rm  Hi.nc
