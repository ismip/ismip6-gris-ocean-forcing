# Prepare input data 

### Copy input files from external archive (search ISMIP6 ftp)
`cp <ExtArchive>/BedMachineGreenland0d6km.nc ../Data/BedMachine/`
`cp <ExtArchive>/grimask_BedMachine_01000m.nc ../Data/BedMachine/`
`cp <ExtArchive>/ISMIP6_Ocean_Regions_01000m.nc ../Data/Basins/`

# Note Bedmachine data has to be processed with inverted y axis compared to original
`prep_BedMachine.sh`

# Calculate distance map for observed grid
`matlab
comp_distance_0d6km.m
`

# Add xy to dist map
`ncks -A -v x,y ../Data/BedMachine/BM_0d6km_xy.nc ../Data/dist/dist0d6km.nc`
