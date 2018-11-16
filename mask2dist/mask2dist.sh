#!/bin/bash
# Build retreat distance map based on modelled ice mask

# Model name with directory in 'Models' that contains sftgif_01000m.nc
amodel=OBS
#amodel=TEST16
#amodel=TEST08

cp ../Models/${amodel}/sftgif_01000m.nc ./

# Interpolation of mask from diagnostic grid to obs grid
# Compute distances from calving front
# Remap dist back to diagnostic grid
matlabbatch meta_mat.m

# take partial mask into account
ncap2 -A -s "rweight=(double(sftgif)); where(sftgif>0) rweight=(double(sftgif)); elsewhere rweight=0;" -v sftgif_01000m.nc weight_0d6_ISMIP6_GrIS_01km.nc
ncap2 -O -s "ww=weight*rweight" weight_0d6_ISMIP6_GrIS_01km.nc weight_0d6_ISMIP6_GrIS_01km.nc

# add x,y from template 
pfts=/Volumes/ISMIP6/Grids/GrIS/SFs
ncks -A -v x,y ${pfts}/af2_ISMIP6_GrIS_01000m.nc dist_0d6_ISMIP6_GrIS_01km.nc

# move results to model directory
/bin/mv dist_0d6_ISMIP6_GrIS_01km.nc ../Models/${amodel}/
/bin/mv weight_0d6_ISMIP6_GrIS_01km.nc ../Models/${amodel}/
/bin/mv *.png ../Models/${amodel}/

# clean up
/bin/rm sftgif_01000m.nc
