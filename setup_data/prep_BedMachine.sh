#!/bin/bash

orgfile=../Data/BedMachine/BedMachineGreenland0d6km.nc
bmfile=../Data/BedMachine/BedMachineGreenlandMasks0d6km.nc
xyfile=../Data/BedMachine/BM_0d6km_xy.nc

# Start from BedMachind v3 data. subsampled and y axis inverted
cp ${orgfile} ${bmfile}
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
ncks -v x,y ${bmfile} ${xyfile} 

