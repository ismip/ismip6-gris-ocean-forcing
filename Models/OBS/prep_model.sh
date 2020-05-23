# prepare mask file from ice sheet model

# Use conservative interpolation to produce the mask file
# For this example we copy an existing observed mask instead

outfile=sftgif.nc

# extract inital ice mask
cp ../../Data/BedMachine/sftgrf_BedMachineGreenland_01000m.nc ${outfile}
ncrename -v sftgrf,sftgif ${outfile}
