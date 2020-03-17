#!/bin/bash
# Build retreat distance map based on modelled ice mask

# Model name with directory in 'Models' that contains sftgif.nc
amodel=OBS
#amodel=OBSSH
#amodel=IMAUICE16
#amodel=CISM
#amodel=ELMER
#amodel=ISSMUCIJPL
#amodel=SICOPOLIS1
#amodel=SICOPOLIS2
#amodel=SICOPOLIS3
#amodel=ISSM_GSFC
#amodel=ISSM_JPL
#amodel=ISSM_JPLPALEO
#amodel=ISSM_AWI_gridY
#amodel=ISSM_AWI_gridZ
#amodel=ISSM_AWI_grid1
#amodel=ISSM_AWI_grid2
#amodel=ISSM_AWI_grid3
#amodel=VUB_GISM_SIA
#amodel=MUN_GSM2371
#amodel=UAF_PISM1
#amodel=GRISLI_LSCE
#amodel=VUB_GISM_SIA2
#amodel=VUB_GISM_HO2
#amodel=UAF_PISM2
#amodel=GRISLI_LSCE2
#amodel=VUB_GISM_SIA3
#amodel=NCAR_CISM2
#amodel=VUB_GISM_SIA4
#amodel=GRISLI_LSCE3
#amodel=ISSM_AWI_grid4
#amodel=VUB_GISM_HOMv2

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
