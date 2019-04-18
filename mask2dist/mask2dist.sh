#!/bin/bash
# Build retreat distance map based on modelled ice mask

# Model name with directory in 'Models' that contains sftgif.nc
#amodel=OBS
#amodel=OBSSH
#amodel=IMAUICE16
#amodel=IMAUICE16V2
#amodel=CISM
#amodel=ELMER
amodel=ISSMUCIJPL
#amodel=IMAUICE16V5
#amodel=IMAUICE16V2HIST
#amodel=IMAUICE16V3
#amodel=IMAUICE16v8histmed
#amodel=IMAUICE16v09histmed
#amodel=IMAUICE16v08histmed


cp ../Models/${amodel}/sftgif.nc ./sftgif.nc

# Interpolation of mask from model grid to obs grid
# Compute distances from calving front
../toolbox/matlabbatch meta_mat.m

# take partial mask into account
ncap2 -A -s "rweight=(double(sftgif)); where(sftgif>0) rweight=(double(sftgif)); elsewhere rweight=0;" -v sftgif_M_0d6km.nc weight_0d6_ISMIP6_GrIS.nc
ncap2 -O -s "ww=rweight" weight_0d6_ISMIP6_GrIS.nc weight_0d6_ISMIP6_GrIS.nc

# move results to model directory
/bin/mv dist0d6km_M.nc ../Models/${amodel}/
/bin/mv weight_0d6_ISMIP6_GrIS.nc ../Models/${amodel}/
/bin/mv sftgif_M_0d6km.nc ../Models/${amodel}/sftgif_0d6.nc
/bin/mv *.png ../Models/${amodel}/

# clean up
/bin/rm sftgif.nc
