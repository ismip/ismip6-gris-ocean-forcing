#!/bin/bash

bmfile=BedMachineGreenland0d6km.nc

# From original BedMachind v3 subsampled and y axis inverted
cp /Volumes/ISMIP6/Data/Raw/Morlighem/BedMachinev3.10/${bmfile} ./
#### basic masking from netcdf processing
# ocean mask
ncap2 -O -s "omask=(mask==0)" ${bmfile} ${bmfile}
# wetmask: ocean + shelf mask: 
ncap2 -O -s "wmask=(mask==0 || mask==3)" ${bmfile} ${bmfile}
# ice mask
ncap2 -O -s "imask=(mask==3 || mask==2)" ${bmfile} ${bmfile}
# grounded ice mask
ncap2 -O -s "grimask=(mask==2)" ${bmfile} ${bmfile}
# floating ice mask
ncap2 -O -s "flimask=(mask==3)" ${bmfile} ${bmfile}

# wet bed: bed <= sea-level
ncap2 -O -s "wbmask=(bed<=0)" ${bmfile} ${bmfile}

# ice on wet bed 
ncap2 -O -s "wimask=(wbmask && imask)" ${bmfile} ${bmfile}

# grounded ice on wet bed 
ncap2 -O -s "wgrimask=(wbmask && grimask)" ${bmfile} ${bmfile}

# extract x,y for easy access
#ncks -v x,y ${bmfile} BM_1d5km_xy.nc
#/bin/mv BM_1d5km_xy.nc ../Data/BedMachine/
ncks -v x,y ${bmfile} BM_0d6km_xy.nc
/bin/mv BM_0d6km_xy.nc ../Data/BedMachine/

/bin/mv ${bmfile} ../Data/BedMachine/

