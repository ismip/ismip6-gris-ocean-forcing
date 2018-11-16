# README

# Prepare Bedmachine data
# Note Bedmachine data has to be processed with inverted y axis compared to original
prep_BedMachine.sh

# calculate distance map for observed grid
comp_distance_0d6km.m

# Add xy to dist map
ncks -A -v x,y ../Data/BedMachine/BM_0d6km_xy.nc ../Data/dist/dist0d6km.nc

