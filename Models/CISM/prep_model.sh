# prepare mask file from ice sheet model

outfile=sftgif.nc

# extract inital ice mask
ncks -O -d time,-1 -v thk /Users/hgoelzer/Documents/CMIP6/ISMIP6/OceanForcing/GrIS/Implementation/CISM/restart_relax.nc ./Hi.nc
ncap2 -O -s "sftgif = thk>0.1" -v ./Hi.nc ./sftgif.nc 
# rename x,y
ncrename -v x1,x -v y1,y ./sftgif.nc 
# cleanup
/bin/rm  Hi.nc
