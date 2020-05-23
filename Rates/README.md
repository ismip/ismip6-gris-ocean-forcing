# Retreat scenarios 

Should be saved as a matlab variable retreat = zeros(7,106);
with relative ice front positions every year (0:1:105) for 7 regions [NO, NE, CE, SE, SW, CW, NW] 

## Test scenario (1995-2100)
`test00/`

## First GCM forcing retreat (MIROC5, 2015-2100)
`v1`

## Combined historical and future retreat for continous calculation
`hist_med_v1`
`hist_high_v1`
`hist_low_v1`

## more details for example med
`hist_med_v1`

Combined: where rates are calucated based on Donald's input <br>
    MIROC5-rcp26-Rhigh: projections with different sensitivity <br>
    MIROC5-rcp26-Rlow <br>
    MIROC5-rcp26-Rmed <br>
    MIROC5-rcp85-Rhigh <br>
    MIROC5-rcp85-Rlow <br>
    MIROC5-rcp85-Rmed <br>
    NorESM1-rcp85-Rhigh <br>
    NorESM1-rcp85-Rlow <br>
    NorESM1-rcp85-Rmed <br>

ZERO: Zero retreat forcing

hist-Rhigh : historical retreats, hist-Rlow and hist-Rhigh are duplicates of ../hist_low_v1 and hist_high_v1 <br>
hist-Rlow <br>
hist-Rmed <br>
hist-Rzero : zero  historical retreats <br>
