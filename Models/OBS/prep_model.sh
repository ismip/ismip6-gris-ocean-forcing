# prepare mask file from ice sheet model

# Use conservative interpolation to produce the mask file
# For this example we copy an existing observed mask instead

outfile=sftgif_01000m.nc

# extract inital ice mask
cp ../../../Database/grimask_BedMachine_01000m.nc ./sftgif_01000m.nc
ncrename -v grimask,sftgif ${outfile}
