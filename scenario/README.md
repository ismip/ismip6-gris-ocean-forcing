# Create time dependent mask based on retreat scenario and distance map
# on observational grid, then bin back to model grid

`make_retreatmasks.m`


# Standard setup for new ISMIP6 models
## for testing
`meta_make_retreatmasks1.m` 
## for all models/scenarios
`meta_make_retreatmasks.m`
## calls
`make_retreatmasks_func.m`

# testing
check_retreat.m



# IMAU setup: continuous from hist
`meta_make_retreatmasks_IMAU.m`
# calls
`make_retreatmasks_IMAU_func.m`

# Manual
`make_retreatmasks_IMAU.m`
`make_retreatmasks_IMAU_hist.m`



make_retreatmasks_shelves_func.m
